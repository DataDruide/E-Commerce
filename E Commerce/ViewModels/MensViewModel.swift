
import Foundation

class MensViewModel: ObservableObject {
    @Published var products: [Product] = []

    init() {
        fetchProducts()
    }

    func fetchProducts() {
        if let urlString = "https://fakestoreapi.com/products/category/men's clothing".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode([Product].self, from: data)
                        DispatchQueue.main.async {
                            self.products = decodedData
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }.resume()
        }
    }


}
