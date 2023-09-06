import Foundation

// Eine Struktur zur Darstellung von Produkten mit Codable und Identifiable Protokollen.
struct Product: Codable, Identifiable {
    let id: Int // Eindeutige Identifikationsnummer des Produkts.
    let title: String // Der Name oder die Bezeichnung des Produkts.
    let price: Double // Der Preis des Produkts.
    let description: String // Die Beschreibung oder Details des Produkts.
    let category: String // Die Kategorie, zu der das Produkt gehört.
    let image: String // Ein String, der den Bildpfad oder die URL des Produktbilds enthält.
    let rating: Rating // Eine Struktur zur Darstellung von Bewertungen des Produkts.
}
