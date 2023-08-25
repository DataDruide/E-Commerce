import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authService: AuthService
    @State var email: String = ""
    @State var password: String = ""
    @State private var isShowingAlertBanner = false
    @State private var isButtonPressed = false // Neue Zustandsvariable für den Button

    var body: some View {
        ZStack {
            Image("setcard-06") // Hier das Bild einfügen
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.9) // Angepasste Opacity für das Bild
                .contrast(0.7)
                .offset(x: -70)
            
            VStack(spacing: 20) {
                
                
                Text("Start\nYour Style Journey")
                    .font(.system(size: 24, weight: .thin, design: .rounded))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .shadow(color: .gray, radius: 0.5, x: 0.25, y: 0.25)
                
                Spacer()
                
                Text("Login")
                    .font(.system(size: 56, weight: .semibold))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .blur(radius: 0.5)
                    .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                
                Spacer()
                
                VStack(spacing: 10) {
                    // Email TextField
                    TextField("Email", text: $email)
                        .padding(.horizontal, 10)
                        .foregroundColor(.white)
                        .frame(width: 370, height: 45)
                        .background(Color.black.opacity(0.23))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .onAppear {
                            UITextField.appearance().tintColor = .white
                        }
                    
                    SecureField("Password", text: $password)
                        .padding(.horizontal, 10)
                        .foregroundColor(.white)
                        .frame(width: 370, height: 45)
                        .background(Color.black.opacity(0.23))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .onAppear {
                            UITextField.appearance().tintColor = .white
                        }
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                Button(action: {
                                    isButtonPressed = true // Setze den Zustand des Buttons auf "Gedrückt"
                                    authService.signUp(email: email, password: password)
                                    isShowingAlertBanner.toggle()
                                }) {
                                    Text("Registrieren")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 70)
                                        .padding(.vertical, 16)
                                        .background(
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 9)
                                                    .foregroundColor(isButtonPressed ? Color(red: 0.35, green: 0.02, blue: 0.32) : Color(red: 0.4, green: 0.03, blue: 0.37))
                                                    .blur(radius: 0.5)
                                                    .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                                                
                                                Text("Registrieren")
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                            }
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
                                    Text("Anmelden")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 77)
                                        .padding(.vertical, 16)
                                        .background(
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 9)
                                                    .foregroundColor(isButtonPressed ? Color(red: 0.35, green: 0.02, blue: 0.32) : Color(red: 0.4, green: 0.03, blue: 0.37))
                                                    .blur(radius: 0.5)
                                                    .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                                                
                                                Text("Anmelden")
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                            }
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
