import Foundation
import SwiftUI

class BackendSimulator: ObservableObject {
    @Published var serverStatus: String = "Idle" // Status des Servers, standardmäßig auf "Idle"
    @Published var serverDelay: Int = 0 // Verzögerungssimulation, standardmäßig auf 0
    @Published var selectedProvider: PaymentProvider? // Ausgewählter Zahlungsanbieter
    @Published var isProcessing: Bool = false // Gibt an, ob eine Zahlungsverarbeitung im Gange ist
    @Published var paymentSuccess: Bool = false // Gibt an, ob die Zahlung erfolgreich war
    @Published var validationSuccess: Bool = false // Gibt an, ob die Validierung erfolgreich war

    private var timer: Timer?

    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
            self?.simulateServerRequest()
        }
    }

    func simulateServerRequest() {
        if isProcessing { // Überprüfe, ob der Zahlungsvorgang bereits im Gange ist
            return // Verlasse die Funktion, wenn der Zahlungsvorgang bereits läuft
        }

        if let provider = selectedProvider {
            serverStatus = "Anfrage an \(provider.name) wird gesendet..." // Aktualisiere den Serverstatus
            serverDelay = Int.random(in: 1...5) // Simuliere eine zufällige Verzögerung
            isProcessing = true // Setze den Status auf "in Bearbeitung"
            paymentSuccess = false // Setze den Erfolgsstatus der Zahlung auf "false"
            validationSuccess = false // Setze den Erfolgsstatus der Validierung auf "false"

            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(serverDelay)) { [weak self] in
                self?.serverStatus = "Zahlung erfolgreich mit \(provider.name)" // Aktualisiere den Serverstatus nach Verzögerung
                self?.isProcessing = false // Setze den Status auf "nicht in Bearbeitung"
                self?.paymentSuccess = true // Setze den Erfolgsstatus der Zahlung auf "true"
                self?.validationSuccess = true // Setze den Erfolgsstatus der Validierung auf "true"
            }
        }
    }
}
