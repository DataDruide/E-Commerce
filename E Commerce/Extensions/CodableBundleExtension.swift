import Foundation

// Erweitert die Bundle-Klasse um eine Methode zum Dekodieren von Codable-Objekten aus JSON-Dateien.
extension Bundle {
  func decode<T: Codable>(_ file: String) -> T {
    // 1. Lokalisiere die JSON-Datei
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Konnte \(file) nicht im Bundle finden.")
    }
    
    // 2. Erstelle eine Eigenschaft für die Daten
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Konnte \(file) nicht aus dem Bundle laden.")
    }
    
    // 3. Erstelle einen Decoder
    let decoder = JSONDecoder()
    
    // 4. Erstelle eine Eigenschaft für die dekodierten Daten
    guard let decodedData = try? decoder.decode(T.self, from: data) else {
      fatalError("Konnte \(file) nicht aus dem Bundle decodieren.")
    }
    
    // 5. Gebe die fertigen Daten zurück
    return decodedData
  }
}
