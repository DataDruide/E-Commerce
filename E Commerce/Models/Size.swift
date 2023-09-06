

import Foundation
// Eine Struktur zur Darstellung von Größen mit einer Identifikations-ID.
struct Size: Identifiable, Equatable {
    let id = UUID() // Eindeutige Identifikations-ID für jede Größe
    let name: String // Der Name der Größe (zum Beispiel "XS", "S", usw.)
}
