import SwiftUI
import URLImage

struct SearchView: View {
    @StateObject private var viewModel = ProductViewModel()
    @State private var searchText = "" // Add a state for searchText

    @State private var isSearching = false

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Spacer()
            SearchHeaderView(searchText: $searchText, isSearching: $isSearching)
                .onAppear {
                    // Hier könntest du den API-Aufruf durchführen und die Daten im productViewModel.products speichern
                }
            List(viewModel.filteredProducts) { product in
                NavigationLink(destination: ProductDetail(product: product)) {
                    VStack(alignment: .leading) {
                        URLImage(URL(string: product.image)!) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                        }
                        Text(product.title)
                            .font(.headline)
                        Text("\(product.price) $")
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationBarTitle("Products")
            Spacer()
            Image(systemName: "magnifyingglass.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.gray)
                .padding(.bottom, 20)
            
            Text("Die Suche wird jetzt noch einfacher!")
                .font(.headline)
                .foregroundColor(.gray)
            
            Text("Geben Sie einfach den Begriff in das ")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
            Text("obige Suchfeld ein und drücken")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
            Text("Sie die Lupe um loszulegen.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

