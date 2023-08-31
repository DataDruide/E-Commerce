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
                        Image("Case")
                            .aspectRatio(contentMode: .fit)
                            .ignoresSafeArea(.all)
                        Text("WARDROBE\nALL YOUR CLOTHING\nNEEDS")
                            .font(Font.custom("Sedgwick Ave Display", size: 34))
                            .kerning(0.25)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .fontWeight(.bold)

                            .scaleEffect(isActive ? 1.5 : 1.2)
                          .animation(Animation.easeInOut(duration: 1.2).repeatForever(autoreverses: true))
                          .onAppear {
                              // Nach einer Verzögerung von 4 Sekunden wird der Zustand auf aktiv gesetzt, um den Hauptinhalt anzuzeigen.
                              DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                  withAnimation {
                                      self.isActive = true
                                  }
                              }
                          }
                    }
                    .frame(width: 517, height: 496)
//                    .background(
//                      EllipticalGradient(
//                        stops: [
//                          Gradient.Stop(color: Color(red: 0.78, green: 0.26, blue: 0.43), location: 0.00),
//                          Gradient.Stop(color: Color(red: 0.39, green: 0.17, blue: 0.45), location: 0.87),
//                        ],
//                        center: UnitPoint(x: 0.5, y: 0.5)
//                      )
//                    )
                }
                .frame(width: 440, height: 1200)
                .background(Color.gray.opacity(0.05))
                // Hintergrundbild für den Splash Screen.
               
                
               
                }
            }
        }
    // ************************************************************************
    // Dieser Code kann ausgeblendet werden den mit diesem Code rufen wir ab welche Schriften auf dem Device anzeigbar sind
    init() {
        for familyName in UIFont.familyNames {
            print(familyName)
            
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print("--\(fontName)")
            }
        }
    }
}
// ************************************************************************


// Die Preview-Provider für die `SplashView`.
struct Previews_SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
