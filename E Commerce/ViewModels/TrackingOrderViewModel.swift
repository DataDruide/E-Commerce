import Foundation

@MainActor
class TrackingOrderViewModel: ObservableObject {
    // Speichern der Liste von Bestellungen
    @Published var orders: [Order]
    
    init() {
        // Initialisiere die Liste der Bestellungen mit Beispieldaten
        self.orders = [
            Order(id: 1, text: "Bestellung 1 wurde verpackt", isPackaged: false),
            Order(id: 2, text: "Bestellung ist auf dem Weg zum Lager", isPackaged: false),
            Order(id: 3, text: "Bestellung ist im Lager angekommen", isPackaged: false),
            Order(id: 4, text: "Bestellung befindet sich auf dem Weg zur Auslieferung", isPackaged: false),
            Order(id: 5, text: "Bestellung wurde zugestellt", isPackaged: false)
        ]
    }
    
    // Ändern des Checkbox-Status für die Bestellung an einem bestimmten Index
    func checkCheckBox(for index: Int) {
        orders[index].isPackaged.toggle()
    }
    
    // Speichern der aktualisierten Checkbox-Status
    func saveCheckboxes() {
        // Hier sollte die Speicherlogik implementiert werden
        // Zum Beispiel können Sie eine Datenbank oder einen Server mit den aktualisierten Checkbox-Status aktualisieren
    }
}
