import SwiftUI

// Die SwiftUI-View für den Splash Screen.
struct SplashView: View {
    
    // Ein State-Property, das den Zustand des Splash Screens verfolgt.
    @State private var isActive = false
    
    var body: some View {
        // Die View entscheidet basierend auf dem Zustand, ob sie den Hauptinhalt (ContentView) oder den Splash Screen anzeigt.
        if isActive {
            // Wenn der Zustand aktiv ist, wird der Hauptinhalt (ContentView) angezeigt.
            ContentView()
        } else {
            // Wenn der Zustand inaktiv ist, wird der Splash Screen angezeigt.
            ZStack {
                ZStack {
                    ZStack {
                        Text("WARDROBE\nALL YOUR CLOTHING\nNEEDS")
                            .font(Font.custom("Space Grotesk", size: 34))
                            .kerning(0.25)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .fontWeight(.bold)

                          .scaleEffect(isActive ? 1.5 : 0.7)
                          .animation(Animation.easeInOut(duration: 1.2).repeatForever(autoreverses: true))
                          .onAppear {
                              // Nach einer Verzögerung von 4 Sekunden wird der Zustand auf aktiv gesetzt, um den Hauptinhalt anzuzeigen.
                              DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                                  withAnimation {
                                      self.isActive = true
                                  }
                              }
                          }
                    }
                    .frame(width: 517, height: 496)
                    .background(
                      EllipticalGradient(
                        stops: [
                          Gradient.Stop(color: Color(red: 0.78, green: 0.26, blue: 0.43), location: 0.00),
                          Gradient.Stop(color: Color(red: 0.39, green: 0.17, blue: 0.45), location: 0.87),
                        ],
                        center: UnitPoint(x: 0.5, y: 0.5)
                      )
                    )
                }
                .frame(width: 440, height: 1100)
                .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                               .cornerRadius(10)
                // Hintergrundbild für den Splash Screen.
               
                
               
                }
            }
        }
    }


// Die Preview-Provider für die `SplashView`.
struct Previews_SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
