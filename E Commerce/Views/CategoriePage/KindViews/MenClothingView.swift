

import SwiftUI
import URLImage

struct MenClothingView: View {
    @ObservedObject var viewModel = MensViewModel()

    var body: some View {
        List(viewModel.products) { product in
            VStack(alignment: .center) {
                URLImage(URL(string: product.image)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 200)
                }
                Text(product.title)
                    .font(.headline)
                Text("Price: $\(product.price)")
                Text("Category: \(product.category)")
                Text(product.description)
            }
        }
        .navigationTitle("Men's Clothing")
    }
}

