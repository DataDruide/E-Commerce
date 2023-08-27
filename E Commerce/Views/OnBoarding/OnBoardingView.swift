import SwiftUI

struct OnBoardingView: View {
    @AppStorage("onBoarding") var onBoarding = true
    @State private var showAfterOnBoarding = false
    @State private var current = 1
    
    var body: some View {
        ZStack {
            Image("Case")
                .ignoresSafeArea(.all)
            VStack(spacing: 30) {
                if current == 1 {
                    OnboardItem(title: "WARDROBE\nCLOTHING FOR THE NEXT GENERATION")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .top)
                        .transition(AnyTransition.slide.animation(.spring()))
                }
                
                if current == 2 {
                    OnboardItem(title: "START YOUR FASHION TOUR")
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
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .padding()
                    .background(
                        Capsule()
                            .fill(Color(.purple).opacity(0.9))
                    )
                }
            }
            .padding(20)
            .frame(width: 400, height: 800)
            // .background(Color(red: 0.4, green: 0.03, blue: 0.37))
            .cornerRadius(10)
        }
    }
}
