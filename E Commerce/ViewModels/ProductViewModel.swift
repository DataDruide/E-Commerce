
import Foundation
import SwiftUI

class ProductViewModel: ObservableObject {
    // Speichern aller Produkte aus der API
    @Published var products: [Product] = []
    
    // Speichern der gefilterten Produkte basierend auf dem Suchtext
    @Published var filteredProducts: [Product] = []

    // Speichern des Suchtexts
    @Published var searchText: String = "" {
        didSet {
            // Rufe die Filtermethode immer dann auf, wenn sich der Suchtext ändert
            filterProducts()
        }
    }
    
    // Instanz der ApiService zum Abrufen von Produkten
    private let apiService = ApiService()

    // Produkte von der API abrufen und die Listen aktualisieren
    func fetchProducts() {
        apiService.fetchProducts { products in
            DispatchQueue.main.async {
                self.products = products
                // Nach dem Abrufen auch die gefilterte Liste aktualisieren
                self.filterProducts()
            }
        }
    }

    // Produkte basierend auf dem Suchtext filtern
    private func filterProducts() {
        if searchText.isEmpty {
            // Wenn der Suchtext leer ist, alle Produkte anzeigen
            filteredProducts = products
        } else {
            // Andernfalls Produkte basierend auf dem Suchtext filtern
            filteredProducts = products.filter { product in
                // Achten Sie darauf, die kleingeschriebenen Versionen des Titels und des Suchtexts zu vergleichen
                product.title.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

