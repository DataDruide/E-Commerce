
import SwiftUI

struct ProfileView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var address: String = ""
    @State private var zipCode: String = ""
    @State private var phone: String = ""
    @State private var email: String = ""
    @State private var mobile: String = ""

    
    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                CreateProfileHeaderView()
                
                Section(header: Text("Personal Information")) {
                    CustomTextField(placeholder: "Firstname", text: $firstName)
                    CustomTextField(placeholder: "Lastname", text: $lastName)
                    CustomTextField(placeholder: "Address", text: $address)
                    CustomTextField(placeholder: "Zipcode", text: $zipCode)
                }
                
                Section(header: Text("Contact Information")) {
                    CustomTextField(placeholder: "Phone", text: $phone)
                    CustomTextField(placeholder: "E-Mail", text: $email)
                    CustomTextField(placeholder: "Mobile", text: $mobile)

                }
                
                Button("Save Data") {
                    // Perform action to save data
                }
                .frame(width: 250, height: 40)
                .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                .foregroundColor(Color.white)
                .cornerRadius(25)
                .padding(.vertical, 10)
            }
            .padding()
            
            CreateProfileFooterShape()
            FooterShape()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


struct CreateProfileFooterShape: View {
    @State private var showShapeOne = false
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                self.showShapeOne = true
            }) {
                Image(systemName: "figure.walk.arrival")
                    .padding()
                    .background(Color(red: 0.7, green: 0.03, blue: 0.37))
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .cornerRadius(10)
                    .clipShape(Circle())
                    .foregroundColor(.black.opacity(1.3))
                    .blur(radius: 0.5)
                    .shadow(color: .white, radius: 0.55, x: 0.25, y: 0.25)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 16)
            }
            .shadow(radius: 10)
            .sheet(isPresented: $showShapeOne) {
                LogoutShape(username: "authService")
            }
        }
        .padding(.horizontal, 16)
    }
}

struct FooterShape: View {
    var body: some View {
        VStack(spacing: 10) {
            Divider()
            HStack {
                Image(systemName: "info.circle")
                    .foregroundColor(.gray)
                Text("© 2023 YOUR COMPANY. ALL RIGHTS RECEIVED.")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 35)
        }
        .background(Color.gray.opacity(0.12))
    }
}

// Add your other shape components here...
