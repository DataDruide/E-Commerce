import SwiftUI

struct CreateProfileView: View {
    @State private var username = ""
    @State private var bio = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthday = ""
    @State private var street = ""
    @State private var zipCode = ""
    @State private var familyState = ""
    @State private var kids: Int = 1

    @State private var selectedImage: UIImage? = nil
    @State private var isImagePickerPresented = false

    var body: some View {
        ZStack {
            Color.white
            .ignoresSafeArea()

            VStack(alignment: .center, spacing: 26) {
                HStack(alignment: .top, spacing: 10) {
                    // Button oben links außerhalb des Kastens
                    Button(action: {
                        // Action for the button
                    }) {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .background(Circle().foregroundColor(Color.gray))
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }

                    VStack(alignment: .center, spacing: 10) {
                        // Ellipse49 Bild
                        Image("Ellipse49")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .multilineTextAlignment(.center)
                            .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                            .overlay(
                                Rectangle()
                                    .stroke(.white, lineWidth: 1)
                            )

                        Text("Hello, Vanessa hopits")
                            .font(Font.custom("Montserrat", size: 13))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                    }
                    .frame(width: 100, height: 100)
                }
                .padding(.horizontal, 16)
                .padding(.top, 20)

                // Restlicher Inhalt des Kastens
                VStack(alignment: .center, spacing: 10) {
                    // ... Hier kommen die restlichen Elemente des Kastens hin ...
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(5)
            }
            .frame(width: 360, height: 800)
        }
    }


struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
    }
}
