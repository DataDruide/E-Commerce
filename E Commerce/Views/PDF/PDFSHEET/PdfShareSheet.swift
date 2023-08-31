
import Foundation
import SwiftUI

struct ShareSheet {
    
    static let instance = ShareSheet()
    
    private init() { }
    
    func share(items: [Any]) {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        UIApplication.shared.currentUIWindow()?.rootViewController?.present(controller, animated: true, completion: nil)
    }
    
}

public extension UIApplication {
    func currentUIWindow() -> UIWindow? {
        let connectedScenes = UIApplication.shared.connectedScenes
            .filter({
                $0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
        
        let window = connectedScenes.first?
            .windows
            .first { $0.isKeyWindow }

        return window
        
    }
}
