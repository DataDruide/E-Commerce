import Foundation

struct Size: Identifiable, Equatable {
    let id = UUID()
    let name: String // Ändere "size" zu "name"
}

class SizeViewModel: ObservableObject {
    @Published var sizes: [Size] = []
    @Published var selectedSize: Size?

    init() {
        loadSizes()
    }

    func loadSizes() {
        sizes = [
            Size(name: "XS"),
            Size(name: "S"),
            Size(name: "M"),
            Size(name: "L"),
            Size(name: "XL"),
            Size(name: "XXL")
        ]
    }
    
    // ...
}

 
