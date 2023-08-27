import SwiftUI

struct OrderPlacedBanner: View {
    @State private var isShowingAddCategoriePageSheet = false
    @State private var isShowingTrackingOrderViewSheet = false

    @State private var timeRemaining: TimeInterval = 4 * 24 * 60 * 60 // 4 days in seconds

    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            Image("iconbanner")
                .frame(width: 120, height: 120)
            
            Text("Order has been placed\nsuccessfully\ntime to delivery: \(timeFormatted(timeRemaining))")
                .font(Font.custom("Montserrat", size: 22))
                .kerning(0.25)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                .frame(width: 294, alignment: .top)
            
            HStack(alignment: .center, spacing: 10) {
                Button(action: {
                    isShowingAddCategoriePageSheet = true
                }) {
                    Text("Shopping Continoue")
                        .font(
                            Font.custom("Nunito Sans", size: 12)
                                .weight(.semibold)
                        )
                        .kerning(1.25)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(red: 0.4, green: 0.03, blue: 0.37), lineWidth: 1)
                        )
                }
                .sheet(isPresented: $isShowingAddCategoriePageSheet) {
                    AddCategoryPage()
                }
                
                Button(action: {
                    isShowingTrackingOrderViewSheet = true
                }) {
                    Text("Track Order")
                        .font(
                            Font.custom("Nunito Sans", size: 12)
                                .weight(.semibold)
                        )
                        .kerning(1.25)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(red: 0.4, green: 0.03, blue: 0.37), lineWidth: 1)
                        )
                }
                .sheet(isPresented: $isShowingTrackingOrderViewSheet) {
                    TrackingOrderView()
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
        .onAppear {
            startTimer()
        }
        .frame(width: 327, height: 404, alignment: .top)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer.invalidate()
            }
        }
    }
    
    func timeFormatted(_ totalSeconds: TimeInterval) -> String {
        let days = Int(totalSeconds / (24 * 60 * 60))
        let hours = Int((totalSeconds.truncatingRemainder(dividingBy: 24 * 60 * 60)) / 3600)
        let minutes = Int((totalSeconds.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(totalSeconds.truncatingRemainder(dividingBy: 60))

        return String(format: "%02dd:%02dh:%02dm:%02ds", days, hours, minutes, seconds)
    }
}

import SwiftUI

struct OrderPlacedBanner_Previews: PreviewProvider {
    static var previews: some View {
        OrderPlacedBanner()
    }
}
