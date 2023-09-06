
import Foundation

// Eine Struktur zur Darstellung von FAQ-Fragen mit Identifiable-Protokoll.
struct FAQQuestion: Identifiable {
    let id = UUID() // Eine eindeutige Identifikations-ID für jede FAQ-Frage.
    let question: String // Die Frage selbst.
    let answer: String // Die Antwort auf die Frage.
}
