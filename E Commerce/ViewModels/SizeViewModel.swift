import Foundation

class SizeViewModel: ObservableObject {
    @Published var sizes: [Size] = [] // Eine Liste der verfügbaren Größen
    @Published var selectedSize: Size? // Die ausgewählte Größe

    init() {
        loadSizes() // Beim Initialisieren Größen laden
    }

    // Laden der verfügbaren Größen (Beispielwerte)
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
