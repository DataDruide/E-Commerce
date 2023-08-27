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
    @State private var showShapeOne = false

    var body: some View {
        
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                CreateProfileImageShape()
                CreateProfileListShape()
                
            }
            VStack {
                CreateProfileFooterShape()
                    .padding(.bottom, 20) // Füge unten etwas Abstand hinzu
            }
        }
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
    }
}



struct CreateProfileListShape: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("Edit Username")) {
                    Text("Edit Username")
                }
                
                NavigationLink(destination: Text("Edit Bio")) {
                    Text("Edit Bio")
                }
                
                NavigationLink(destination: Text("Edit First Name")) {
                    Text("Edit First Name")
                }
                
                NavigationLink(destination: Text("Edit Last Name")) {
                    Text("Edit Last Name")
                }
                
                NavigationLink(destination: Text("Edit Birthday")) {
                    Text("Edit Birthday")
                }
                
                NavigationLink(destination: Text("Edit Address")) {
                    Text("Edit Address")
                }
                
                NavigationLink(destination: Text("Edit Zip Code")) {
                    Text("Edit Zip Code")
                }
                
                NavigationLink(destination: Text("Edit Family Status")) {
                    Text("Edit Family Status")
                }
            }
            .navigationBarTitle("Profile Sections")
        }
    }
}


import SwiftUI

struct CreateProfileImageShape: View {
    @State private var selectedImage: UIImage? = nil
    @State private var isImagePickerPresented = false
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(Color.gray)
                    .frame(width: 150, height: 150)
                    .overlay(
                        Image(systemName: "person.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.white)
                    )
                    .onTapGesture {
                        isImagePickerPresented = true
                    }
            }
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            Text("Tap to select image")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(width: 440, height: 250)
        .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                       .cornerRadius(10)
                       .ignoresSafeArea(.all)
    }
}

struct CreateProfileImageShape_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileImageShape()
    }
}


import SwiftUI

struct CreateProfileFooterShape: View {
    @State private var showShapeOne = false

    var body: some View {
        HStack {
            Button(action: {
                self.showShapeOne = true
            }, label: {
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
                    .blur(radius: 0.5) // Unschärfeeffekt
                    .shadow(color: .white, radius: 0.55, x: 0.25, y: 0.25) // grauer Schatten
                    .padding(.horizontal, 50)
                    .padding(.vertical, 16)
                
            })
            .shadow(radius: 10)
            .offset(x: -150, y: -345) // Position des Buttons auf der Z-Ebene
            .sheet(isPresented: $showShapeOne) {
                LogoutShape(username: "authService")
                
            }
        }
        .padding(.horizontal, 16)
    }
}

struct CreateProfileFooterShape_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileFooterShape()
    }
}
