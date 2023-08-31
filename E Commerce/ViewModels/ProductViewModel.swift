

import Foundation
import SwiftUI

class ProductViewModel: ObservableObject {
    // Store all products from the API
    @Published var products: [Product] = []
    
    // Store the filtered products based on search text
    @Published var filteredProducts: [Product] = []

    // Store the search text
    @Published var searchText: String = "" {
        didSet {
            // Call the filtering method whenever the search text changes
            filterProducts()
        }
    }
    
    // ApiService instance for fetching products
    private let apiService = ApiService()

    // Fetch products from the API and update the lists
    func fetchProducts() {
        apiService.fetchProducts { products in
            DispatchQueue.main.async {
                self.products = products
                // After fetching, also update the filtered list
                self.filterProducts()
            }
        }
    }

    // Filter the products based on search text
    private func filterProducts() {
        if searchText.isEmpty {
            // If search text is empty, show all products
            filteredProducts = products
        } else {
            // Otherwise, filter products based on the search text
            filteredProducts = products.filter { product in
                // Make sure to compare lowercased versions of both the title and search text
                product.title.lowercased().contains(searchText.lowercased())
            }
        }
    }
}


