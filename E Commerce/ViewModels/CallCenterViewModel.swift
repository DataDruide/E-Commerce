import Foundation

class CallCenterViewModel: ObservableObject {
    @Published var calls: [Call] = []
    
    func startCall(withName callerName: String) {
        let newCall = Call(callerName: callerName, isOngoing: true)
        calls.append(newCall)
    }
    
    func endCall(_ call: Call) {
        if let index = calls.firstIndex(where: { $0.id == call.id }) {
            calls[index].isOngoing = false
        }
        
    }
}
