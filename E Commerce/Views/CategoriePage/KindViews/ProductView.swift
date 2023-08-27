
import SwiftUI
import URLImage

struct ProductView: View {
    @StateObject private var viewModel = ProductViewModel()
    @State private var searchText = "" // Add a state for searchText

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $searchText) // SearchTextField
                    .padding(.horizontal)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.top)

                List(viewModel.filteredProducts) { product in
                    NavigationLink(destination: ProductDetail(product: product)) {
                        VStack(alignment: .leading) {
                            URLImage(URL(string: product.image)!) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80, height: 80)
                            }
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
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
