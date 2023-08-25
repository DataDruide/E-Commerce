import SwiftUI

struct OnBoardingView: View {
    @AppStorage("onBoarding") var onBoarding = true
    @State private var showAfterOnBoarding = false
    @State private var current = 1
    
    var body: some View {
        VStack(spacing: 30) {
            if current == 1 {
                OnboardItem(title: "E-Richtide\nAll your clothing needs")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .transition(AnyTransition.slide.animation(.spring()))
            }
            
            if current == 2 {
                OnboardItem(title: "Start your Style journey")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .transition(AnyTransition.slide.animation(.spring()))
            }
            
            Spacer()
            
            HStack {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color("purple"))
                    .overlay(
                        Image(systemName: current == 3 ? "checkmark" : "arrow.right")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    )
                    .onTapGesture {
                        if current == 3 {
                            showAfterOnBoarding = true
                        } else {
                            withAnimation {
                                current += 1
                            }
                        }
                    }
                
                Spacer()
            }
            .padding(.bottom, 20)
            
            Button(action: {
                onBoarding = false
            }) {
                HStack {
                    Text("Continue")
                    Image(systemName: "chevron.right")
                }
                .padding()
                .background(
                    Capsule()
                        .fill(Color(.gray).opacity(0.2))
                )
            }
        }
        .padding(20)
        .frame(width: 400, height: 900)
        .background(Color(red: 0.4, green: 0.03, blue: 0.37))        .cornerRadius(10)
    }
}
