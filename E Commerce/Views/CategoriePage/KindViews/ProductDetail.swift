
import SwiftUI

struct ProductDetail: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
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
