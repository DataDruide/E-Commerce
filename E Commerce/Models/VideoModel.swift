
import Foundation

// Mit diesem VideoModel können wir nun mit der JSON File Videos kommunzieren
struct VideoModel: Codable, Identifiable { // Datenmodel Videomodel
    let id: String
    let name: String
    let headline: String
    
}
