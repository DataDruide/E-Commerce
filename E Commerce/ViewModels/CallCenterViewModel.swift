import Foundation

class CallCenterViewModel: ObservableObject {
    @Published var calls: [Call] = [] // Eine Liste von Anrufen
    
    // Eine Methode zum Starten eines Anrufs mit dem Namen des Anrufers.
    func startCall(withName callerName: String) {
        let newCall = Call(callerName: callerName, isOngoing: true) // Erstellt einen neuen Anruf
        calls.append(newCall) // Fügt den neuen Anruf zur Liste hinzu
    }
    
    // Eine Methode zum Beenden eines Anrufs.
    func endCall(_ call: Call) {
        // Sucht den Index des Anrufs in der Liste basierend auf der Anruf-ID.
        if let index = calls.firstIndex(where: { $0.id == call.id }) {
            calls[index].isOngoing = false // Setzt den Anrufstatus auf "nicht mehr laufend"
        }
    }
}
