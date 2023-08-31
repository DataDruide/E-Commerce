import SwiftUI
import URLImage

struct ProductDetail: View {
    let product: Product
    @StateObject private var viewModel = ProductViewModel()
    @State private var selectedSize: Size? // Die ausgewählte Größe

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
                .padding(.horizontal, 20)
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            Text("\(product.rating.rate) (\(product.rating.count) reviews)")
                .foregroundColor(.gray)
            ProductSizeSelectionShape()
            AddProductButton(product: Product(id: product.id,
                title: product.title,
                price: product.price,
                description: product.description,
                category: product.category,
                image: product.image,
                rating: Rating(rate: 4.5, count: 120)))

            Spacer()
        }
        .padding()
        .navigationBarTitle("Product Detail")
    }
}
