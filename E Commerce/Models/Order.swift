import SwiftUI

// Eine Struktur zur Darstellung einer Bestellung mit Identifiable-Protokoll.
struct Order: Identifiable {
    let id: Int // Eine eindeutige Identifikationsnummer für jede Bestellung.
    let text: String // Der Text oder die Beschreibung der Bestellung.
    var isPackaged: Bool // Ein Wert, der angibt, ob die Bestellung verpackt ist oder nicht.
}
