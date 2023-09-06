
import Foundation

// Eine Struktur zur Darstellung einer FAQ-Sektion mit Identifiable-Protokoll.
struct FAQSection: Identifiable {
    var id = UUID() // Eine eindeutige Identifikations-ID für jede FAQ-Sektion.
    let title: String // Der Titel oder Name der FAQ-Sektion.
    let questions: [FAQQuestion] // Eine Liste von FAQ-Fragen in dieser Sektion.
}
