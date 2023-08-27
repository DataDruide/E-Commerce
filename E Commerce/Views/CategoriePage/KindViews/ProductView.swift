

import SwiftUI

struct ProductView: View {
    @StateObject private var viewModel = ProductViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.filteredProducts) { product in
                NavigationLink(destination: ProductDetail(product: product)) {
                    VStack(alignment: .leading) {
                        Text(product.title)
                            .font(.headline)
                        Text("\(product.price) $")
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationBarTitle("Products")
        }
        .onAppear {
            viewModel.fetchProducts()
        }
    }
}




struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
