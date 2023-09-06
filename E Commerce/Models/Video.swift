
import Foundation

// Eine Struktur zur Darstellung von Videos mit Codable und Identifiable-Protokollen.
struct Video: Codable, Identifiable {
    let id: String // Eine eindeutige Identifikations-ID für jedes Video.
    let name: String // Der Name des Videos.
    let headline: String // Die Überschrift oder Beschreibung des Videos.
    
    // Berechnete Eigenschaft zur Generierung des Thumbnail-Namens für das Video.
    var thumbnail: String {
        "video-\(id)" // Der Thumbnail-Name basiert auf der Video-ID.
    }
}
