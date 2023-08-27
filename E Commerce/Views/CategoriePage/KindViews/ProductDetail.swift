import SwiftUI
import URLImage

struct ProductDetail: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .center) {
            URLImage(URL(string: product.image)!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5)
            }
            .frame(width: 200, height: 180) // Adjust the frame size as needed

            Text(product.title)
                .font(.title)
            Text("\(product.price) $")
                .foregroundColor(.gray)
            Text(product.description)
                .padding(.top, 10)
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            Text("\(product.rating.rate) (\(product.rating.count) reviews)")
                .foregroundColor(.gray)
            Spacer()
        }
        .padding()
        .navigationBarTitle("Product Detail")
    }
}
