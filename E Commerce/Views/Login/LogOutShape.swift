
import SwiftUI

struct LogoutShape: View {
    
    @State private var showYourWayView = false
    @EnvironmentObject var authService: AuthService
    
    @State private var showMenu = false
    @State private var showNextView = false
    
    var username: String
    
    var body: some View {
        CardViewShape1 {
            ZStack {
                Image("Case")
                    .resizable()
                    .overlay(Rectangle().foregroundColor(.clear))
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(.black.opacity(0.15))
                    .contrast(0.7)
                    .offset(x: -0)
                    .opacity(01.05)
                
                LinearGradient(colors: [.white.opacity(0.47),.white.opacity(0.67)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .overlay(
                            VStack {
                                Text("If you want to log out, then click on the button below.")
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.all)
                                    .cornerRadius(50)
                                
                                HStack {
                                    Button(action: {
                                        self.showYourWayView = true
                                        authService.signOut()
                                    }) {
                                        HStack {
                                            Image(systemName: "figure.walk.arrival")
                                            Text(authService.user?.email ?? "")
                                        }
                                        .padding()
                                        .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                                        .overlay(
                                          Rectangle()
                                            .stroke(.white, lineWidth: 2)
                                        )

                                        .foregroundColor(.white)
                                        .cornerRadius(15)
                                        .blur(radius: 0.5)
                                        .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                                        
                                    }
                                }
                            }
                                .padding()
                        )
                }
            }
        }
    }
    
    
    // Eine Preview-Struktur, um eine Vorschau der View in der Xcode-Preview-Ansicht zu sehen
    struct Shape1_Previews: PreviewProvider {
        static var previews: some View {
            LogoutShape(username: "Claire Bouston")
                .environmentObject(AuthService()) // Fügt ein EnvironmentObject hinzu, um die AuthService-Instanz zu verwenden
        }
    }
    
    struct CardViewShape1<Content: View>: View {
        
        let content: Content
        
        init(@ViewBuilder content: () -> Content) {
            self.content = content()
        }
        
        var body: some View {
            content
                .background(Color.clear) // Hintergrundfarbe auf transparent setzen
                .ignoresSafeArea(.all)
            //  .cornerRadius(20)
        }
    }
}
