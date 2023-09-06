import Foundation
import SwiftUI

// Eine SwiftUI View-Erweiterung für das Exportieren von Inhalten als PDF und für das Teilen von PDFs.
extension View {
    
    // Eine Funktion zum Teilen von PDFs. Sie erstellt ein PDF aus dem angegebenen Inhalt und teilt es.
    func sharePDF<Content: View>(@ViewBuilder content: @escaping () -> Content, fileName: String) {
        exportPDF(content: content, completion: { status , url in
            if let url = url, status {
                ShareSheet.instance.share(items: [url]) // Teile das PDF
            } else {
                print("⚠️ PDF-Erstellung fehlgeschlagen")
            }
        }, fileName: fileName)
    }
    
    // Eine Funktion zum Konvertieren einer SwiftUI View in eine UIScrollView.
    fileprivate func convertToScrollView<Content: View>(@ViewBuilder content: @escaping () -> Content) -> UIScrollView {
        
        let scrollView = UIScrollView()
        
        // SwiftUI View in eine UIKit View umwandeln
        let hostingController = UIHostingController(rootView: content()).view!
        hostingController.translatesAutoresizingMaskIntoConstraints = false
        
        // Constraints festlegen
        let constraints = [
            hostingController.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostingController.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostingController.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostingController.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            // Breitenanker
            hostingController.widthAnchor.constraint(equalToConstant: screenBounds().width)
        ]
        scrollView.addSubview(hostingController)
        scrollView.addConstraints(constraints)
        scrollView.layoutIfNeeded()
        
        return scrollView
    }
    
    // Eine Funktion zum Exportieren von Inhalten als PDF mit einer Completion-Handler-Funktion.
    fileprivate func exportPDF<Content: View>(@ViewBuilder content: @escaping () -> Content, completion: @escaping (Bool, URL?) -> (), fileName: String) {
        
        // Temporäre URL für das PDF
        let documentDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        let outputFileURL = documentDirectory.appendingPathComponent("\(fileName)\(UUID().uuidString).pdf")
        
        // SwiftUI View in eine ScrollView konvertieren
        let pdfView = convertToScrollView {
            content()
        }
        pdfView.tag = 1009
        let size = pdfView.contentSize
        // Safe Area Top-Wert entfernen
        pdfView.frame = CGRect(x: 0, y: getSafeArea().top, width: size.width, height: size.height)
        
        // PDF-Rendering vorbereiten
        getRootController().view.insertSubview(pdfView, at: 0)
        
        // PDF-Rendering durchführen
        let renderer = UIGraphicsPDFRenderer(bounds: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        do {
            try renderer.writePDF(to: outputFileURL, withActions: { context in
                context.beginPage()
                pdfView.layer.render(in: context.cgContext)
            })
            
            completion(true, outputFileURL)
        } catch {
            completion(false, nil)
            print(error.localizedDescription)
        }
        
        // Hinzugefügte View entfernen
        getRootController().view.subviews.forEach { view in
            if view.tag == 1009 {
                print("Entfernt")
                view.removeFromSuperview()
            }
        }
    }
    
    // Bildschirmgröße abrufen
    fileprivate func screenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
    
    // Root-ViewController abrufen
    fileprivate func getRootController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
    
    // Safe Area abrufen
    fileprivate func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
}
