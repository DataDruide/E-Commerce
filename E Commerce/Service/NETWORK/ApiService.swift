import Foundation

// Die ApiService-Klasse behandelt das Abrufen von Produktinformationen von einer angegebenen URL unter Verwendung von URLSession.
class ApiService {
    
    // Methode zum Abrufen von Produkten von der angegebenen URL und Bereitstellen der Ergebnisse über einen Abschluss-Handler.
    func fetchProducts(completion: @escaping ([Product]) -> Void) {
        // Überprüfen, ob die bereitgestellte URL gültig ist.
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            completion([]) // Wenn die URL ungültig ist, wird der Abschluss-Handler mit einem leeren Array aufgerufen.
            return
        }
        
        // Führen Sie eine Datenaufgabe mit URLSession aus.
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                // Initialisieren Sie einen JSON-Decoder, um die empfangenen Daten zu analysieren.
                let decoder = JSONDecoder()
                if let products = try? decoder.decode([Product].self, from: data) {
                    // Rufen Sie den Abschluss-Handler mit den abgerufenen Produkten auf.
                    completion(products)
                }
            } else {
                // Rufen Sie den Abschluss-Handler im Falle eines Fehlers mit einem leeren Array auf.
                completion([])
            }
        }.resume() // Starten Sie die Datenaufgabe.
    }
}
