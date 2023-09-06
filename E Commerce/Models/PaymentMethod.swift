import Foundation

// Eine Struktur zur Darstellung einer Zahlungsmethode mit Identifiable- und Decodable-Protokollen.
struct PaymentMethod: Identifiable, Decodable {
    let id: Int // Eine eindeutige Identifikationsnummer für jede Zahlungsmethode.
    let title: String // Der Name oder die Bezeichnung der Zahlungsmethode.
    let description: String // Die Beschreibung oder Details der Zahlungsmethode.
    let category: String // Die Kategorie, zu der die Zahlungsmethode gehört.
    let image: String // Ein String, der den Bildpfad oder die URL des Bilds für die Zahlungsmethode enthält.
    let rating: Rating // Eine verschachtelte Struktur zur Darstellung von Bewertungen für die Zahlungsmethode.

    // Eine verschachtelte Struktur zur Darstellung von Bewertungen mit Decodable-Protokoll.
    struct Rating: Decodable {
        let rate: Double // Die Bewertung oder Punktzahl.
        let count: Int // Die Anzahl der Bewertungen.
    }
}
