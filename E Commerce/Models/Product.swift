
import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
}

struct Rating: Codable {
    let rate: Double
    let count: Int
}


//import Foundation
//
//struct Product: Codable, Identifiable {
//    let id: Int
//    let title: String
//    let price: Double
//    let description: String
//    let category: String
//    let image: String
//    let rating: Rating
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(Int.self, forKey: .id)
//        title = try container.decode(String.self, forKey: .title)
//        price = try container.decode(Double.self, forKey: .price)
//        description = try container.decode(String.self, forKey: .description)
//        category = try container.decode(String.self, forKey: .category)
//        image = try container.decode(String.self, forKey: .image)
//        rating = try container.decode(Rating.self, forKey: .rating)
//    }
//
//    private enum CodingKeys: String, CodingKey {
//        case id, title, price, description, category, image, rating
//    }
//}
//
//struct Rating: Codable {
//    let rate: Double
//    let count: Int
//}
