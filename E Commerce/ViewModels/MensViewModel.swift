import Foundation

class MensViewModel: ObservableObject {
    @Published var products: [Product] = [] // Eine Liste von Produkten

    init() {
        fetchProducts() // Beim Initialisieren Produkte abrufen
    }

    // Eine Methode zum Abrufen von Produkten aus einer API
    func fetchProducts() {
        if let urlString = "https://fakestoreapi.com/products/category/men's clothing".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode([Product].self, from: data) // JSON-Daten in ein Array von Produktobjekten umwandeln
                        DispatchQueue.main.async {
                            self.products = decodedData // Aktualisiere die Liste der Produkte auf dem Hauptthread
                        }
                    } catch {
                        print("Fehler beim Decodieren von JSON: \(error)") // Fehler beim Decodieren der JSON-Daten behandeln
                    }
                }
            }.resume() // Starte die URLSession-Anfrage
        }
    }
}
