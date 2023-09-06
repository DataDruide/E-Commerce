import Foundation

// Eine Struktur zur Darstellung von Videos mit Codable und Identifiable-Protokollen.
struct VideoModel: Codable, Identifiable {
    let id: String // Eine eindeutige Identifikations-ID für jedes Video.
    let name: String // Der Name des Videos.
    let headline: String // Die Überschrift oder Beschreibung des Videos.
}
