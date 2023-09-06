import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authService: AuthService
    @State var email: String = ""
    @State var password: String = ""
    @State private var isShowingAlertBanner = false
    @State private var isButtonPressed = false // Neue Zustandsvariable für den Button

    var body: some View {
        ZStack {
            Image("Case") // Hier das Bild einfügen
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.8) // Angepasste Opacity für das Bild
                .contrast(1.9)
                .offset(x: -35)
            
            VStack(spacing: 5) {
                
                Spacer()
                Text("START\nYOUR STYLE JOURNEY")
                    .font(Font.custom("Sedgwick Ave Display", size: 45))
                    .kerning(0.25)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .shadow(color: .white, radius: 0.5, x: 0.25, y: 0.25)
                
                Spacer()
                
                Text("LOGIN")
                    .font(Font.custom("Sedgwick Ave Display", size: 56))
                    .kerning(0.25)                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .blur(radius: 0.5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

                Spacer()
                
                VStack(spacing: 10) {
                    // Email TextField
                    TextField("EMAIL", text: $email)
                        .padding(.horizontal, 10)
                        .foregroundColor(.white)
                        .frame(width: 370, height: 45)
                        .background(Color.black.opacity(0.23))
                        .cornerRadius(18)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .onAppear {
                            UITextField.appearance().tintColor = .white
                        }
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

                    
                    SecureField("PASSWORD", text: $password)
                        .padding(.horizontal, 10)
                        .foregroundColor(.white)
                        .frame(width: 370, height: 45)
                        .background(Color.black.opacity(0.23))
                        .cornerRadius(18)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .onAppear {
                            UITextField.appearance().tintColor = .white
                        }
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                Button(action: {
                    isButtonPressed = true
                    authService.signUp(email: email, password: password)
                    isShowingAlertBanner.toggle()
                }) {
                    Text("REGISTER")
                        .font(Font.custom("Sedgwick Ave Display", size: 18))
                        .kerning(0.25)                         .foregroundColor(.white)
                        .padding(.horizontal, 70)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 25) // Änderung des Hintergrunds
                                .foregroundColor(isButtonPressed ? Color(red: 0.35, green: 0.02, blue: 0.32) : Color(red: 0.4, green: 0.03, blue: 0.37))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.white, lineWidth: 1) // Weißer Rand
                                )
                        )
                }
                .disabled(email.isEmpty || password.isEmpty)
                .sheet(isPresented: $isShowingAlertBanner) {
                    AlertBanner() // Hier kommt deine AlertBanner-View
                }
                .onChange(of: isButtonPressed) { newValue in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        isButtonPressed = false // Setze den Zustand des Buttons zurück
                    }
                }

                Button(action: {
                    isButtonPressed = true
                    authService.signIn(email: email, password: password)
                }) {
                    Text("SIGN IN")
                        .font(Font.custom("Sedgwick Ave Display", size: 18))
                        .kerning(0.25)                        .foregroundColor(.white)
                        .padding(.horizontal, 80)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 25) // Änderung des Hintergrunds
                                .foregroundColor(isButtonPressed ? Color(red: 0.35, green: 0.02, blue: 0.32) : Color(red: 0.4, green: 0.03, blue: 0.37))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.white, lineWidth: 1) // Weißer Rand
                                )
                        )
                }

                                .disabled(email.isEmpty || password.isEmpty)
                                .sheet(isPresented: $isShowingAlertBanner) {
                                    AlertBanner() // Hier kommt deine AlertBanner-View
                                }
                                .onChange(of: isButtonPressed) { newValue in
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                        isButtonPressed = false
                                    }
                                }
                Spacer(minLength: 150)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
