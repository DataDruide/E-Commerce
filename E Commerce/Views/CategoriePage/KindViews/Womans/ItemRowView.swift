
import SwiftUI

struct ItemRowView: View {
    var imageName: String
    var itemName: String
    
    var body: some View {
        ZStack {
            HStack(alignment: .center) {
                Text(itemName)
                    .font(.custom("Montserrat", size: 14))
                    .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                Spacer()
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 75, height: 96)
                    .background(
                        Image(imageName) // Replace with actual image name or system image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75, height: 96)
                            .clipped()
                    )
                    .cornerRadius(10)
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 12)
            .frame(width: 320, alignment: .center)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(5)
        }
    }
}



