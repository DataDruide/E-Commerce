
import Foundation

// Eine Struktur zur Darstellung eines Zahlungsanbieters mit Identifiable-Protokoll.
struct PaymentProvider: Identifiable {
    let id = UUID() // Eine eindeutige Identifikations-ID für jeden Zahlungsanbieter.
    let name: String // Der Name des Zahlungsanbieters.
}
