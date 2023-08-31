import SwiftUI


struct CreateProfileHeaderView: View {
    var body: some View {
        HStack {
            Button(action: {
                // Action for the button
            }) {
                Image(systemName: "icon-x")
                    .font(.custom("Montserrat", size: 15).weight(.medium))
                    .foregroundColor(.black)
                    .background(Color(red: 0.4, green: 0.03, blue: 0.37))
            }
            
            Text("CREATE PROFILE")
                .font(Font.custom("Montserrat", size: 17).weight(.medium))
                .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
        }
        .padding()
    }
}
