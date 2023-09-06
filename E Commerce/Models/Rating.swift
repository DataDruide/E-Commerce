
import Foundation

// Eine Struktur zur Darstellung von Bewertungen mit Codable-Protokoll.
struct Rating: Codable {
    let rate: Double // Die Bewertung oder Punktzahl.
    let count: Int // Die Anzahl der Bewertungen.
}
