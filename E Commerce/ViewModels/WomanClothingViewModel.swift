

import Foundation

class WomanClothingViewModel: ObservableObject {
    @Published var products: [Product] = []

    init() {
        fetchWomanClothingProducts()
    }

    func fetchWomanClothingProducts() {
        if let urlString = "https://fakestoreapi.com/products/category/women's clothing".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
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

