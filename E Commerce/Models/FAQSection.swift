
import Foundation

struct FAQSection: Identifiable {
    var id = UUID()
    let title: String
    let questions: [FAQQuestion]
}
