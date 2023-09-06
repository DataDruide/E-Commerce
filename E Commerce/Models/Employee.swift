import Foundation

// Eine Struktur zur Darstellung eines Mitarbeiters mit Identifiable-Protokoll.
struct Employee: Identifiable {
    let id = UUID() // Eine eindeutige Identifikations-ID für jeden Mitarbeiter.
    let name: String // Der Name des Mitarbeiters.
    let phoneNumber: String // Die Telefonnummer des Mitarbeiters.
}
