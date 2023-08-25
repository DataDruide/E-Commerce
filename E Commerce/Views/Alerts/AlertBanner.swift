
import SwiftUI

struct AlertBanner: View {
    @State private var isShowingHomeViewSheet = false

    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            Image("iconbanner")
            .frame(width: 120, height: 120)
            
            // subtitle
            Text("Account Created!")
              .font(
                Font.custom("Montserrat", size: 17)
                  .weight(.medium)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
            
            HStack(alignment: .center, spacing: 10) {
                Button(action: {
                                isShowingHomeViewSheet = true
                            }) {
                                Text("Continue")
                                    .font(
                                        Font.custom("Nunito Sans", size: 14)
                                            .weight(.semibold)
                                    )
                                    .kerning(1.25)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 10)
                                    .frame(width: 139, alignment: .center)
                                    .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                                    .cornerRadius(25)
                            }
                            .sheet(isPresented: $isShowingHomeViewSheet) {
                                HomeView()
                            }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .frame(width: 139, alignment: .center)
            .background(Color(red: 0.4, green: 0.03, blue: 0.37))
            .cornerRadius(25)
        }
        .padding(.horizontal, 0)
        .padding(.vertical, 40)
        .frame(width: 296, height: 297, alignment: .top)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
    }
}

struct AlertBanner_Previews: PreviewProvider {
    static var previews: some View {
        AlertBanner()
    }
}
