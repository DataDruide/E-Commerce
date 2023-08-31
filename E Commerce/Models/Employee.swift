import Foundation

struct Employee: Identifiable {
    let id = UUID()
    let name: String
    let phoneNumber: String
}
