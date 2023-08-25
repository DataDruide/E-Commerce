
import SwiftUI

struct CategorySearchBarShape: View {
    
    @State private var textFieldInput: String = ""

    var body: some View {
        HStack {
                       
                       Button(action: {
                           // Action for the button
                       }) {
                           Image(systemName: "arrow.left")
                               .resizable()
                               .frame(width: 20, height: 20)
                                .padding()
                                .background(Color(red: 0.96, green: 0.96, blue: 0.96))

                       }
                       .buttonStyle(PlainButtonStyle()) // Remove the default button style
                       Spacer()
                       TextField("Searching...", text: $textFieldInput)
                           .font(.custom("Montserrat", size: 14))
                           .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                           .frame(width: 270)
                           .cornerRadius(8)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                   }
                   .padding(.horizontal, 15)
                   .padding(.vertical, 12)
                   .frame(width: 370, alignment: .center)
                   .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                   .cornerRadius(5)
                   
    }
}

struct CategorySearchBarShape_Previews: PreviewProvider {
    static var previews: some View {
        CategorySearchBarShape()
    }
}



