//import SwiftUI
//
//struct CategoryItemView: View {
//    let itemName: String
//
//    var body: some View {
//        VStack {
//            Image(systemName: "square.fill")
//                .resizable()
//                .frame(width: 80, height: 80)
//                .foregroundColor(.gray).opacity(0.12)
//                .padding(.bottom, 8)
//
//            Text(itemName)
//                .font(.headline)
//                .multilineTextAlignment(.center)
//        }
//        .padding()
//        .background(Color.white)
//        .cornerRadius(10)
//        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
//    }
//}
//
//struct CategoryItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            CategoryItemView(itemName: "Clothing")
//                .previewLayout(.sizeThatFits)
//                .padding()
//
//            CategoryItemView(itemName: "Shoes")
//                .previewLayout(.sizeThatFits)
//                .padding()
//
//            CategoryItemView(itemName: "Trousers")
//                .previewLayout(.sizeThatFits)
//                .padding()
//        }
//    }
//}
