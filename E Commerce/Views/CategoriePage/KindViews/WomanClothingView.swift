

import SwiftUI
import URLImage

struct WomanClothingView: View {
    @ObservedObject var viewModel = WomanClothingViewModel()

    var body: some View {
        NavigationView {
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
            .navigationTitle("Women's Clothing Products")
        }
    }
}
