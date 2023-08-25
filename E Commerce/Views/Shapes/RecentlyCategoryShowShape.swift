
import SwiftUI

struct RecentlyCategoryShowShape: View {
    
    var body: some View {
        HStack {
                       
                       Button(action: {
                           // Action for the button
                       }) {
                           Image(systemName: "arrow.left")
                               .resizable()
                               .frame(width: 15, height: 15)
                                .padding()
                                .background(Circle().foregroundColor(Color.purple))
                       }
                       .buttonStyle(PlainButtonStyle()) // Remove the default button style
                       Spacer()
                       Text("Recently viewed Items")
                           .font(.custom("Montserrat", size: 24))
                           .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                           .fontWeight(.bold)
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

struct RecentlyCategoryShowShape_Previews: PreviewProvider {
    static var previews: some View {
        RecentlyCategoryShowShape()
    }
}
