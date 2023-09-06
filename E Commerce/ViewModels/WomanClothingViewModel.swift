import Foundation

class WomanClothingViewModel: ObservableObject {
    @Published var products: [Product] = [] // Eine Liste von Produkten für Damenbekleidung

    init() {
        fetchWomanClothingProducts() // Beim Initialisieren Produkte für Damenbekleidung abrufen
    }

    // Eine Methode zum Abrufen von Produkten für Damenbekleidung aus einer API
    func fetchWomanClothingProducts() {
        if let urlString = "https://fakestoreapi.com/products/category/women's clothing".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode([Product].self, from: data) // JSON-Daten in ein Array von Produktobjekten umwandeln
                        DispatchQueue.main.async {
                            self.products = decodedData // Aktualisiere die Liste der Produkte für Damenbekleidung auf dem Hauptthread
                        }
                    } catch {
                        print("Fehler beim Decodieren von JSON: \(error)") // Fehler beim Decodieren der JSON-Daten behandeln
                    }
                }
            }.resume() // Starte die URLSession-Anfrage
        }
    }
}
