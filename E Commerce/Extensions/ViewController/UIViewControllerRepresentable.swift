import SwiftUI
import UIKit

// Eine SwiftUI-View, die es ermöglicht, ein Bild auszuwählen.
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage? // Ein Binding zum ausgewählten Bild
    @Environment(\.presentationMode) private var presentationMode // Die Presentation Mode-Umgebung, um die Ansicht zu präsentieren bzw. zu schließen
    
    // Erstellt und konfiguriert den UIImagePickerController.
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator // Setzt den Coordinator als den Delegaten des Image Pickers
        return imagePicker
    }
    
    // Wird aufgerufen, wenn sich die SwiftUI-View aktualisiert.
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Hier können keine Änderungen am UIViewController vorgenommen werden.
    }
    
    // Erstellt den Coordinator für die ImagePicker-View.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Ein Coordinator ist für die Kommunikation zwischen SwiftUI und UIKit zuständig.
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        // Wird aufgerufen, wenn ein Bild ausgewählt wurde.
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let pickedImage = info[.originalImage] as? UIImage {
                parent.selectedImage = pickedImage // Setzt das ausgewählte Bild im Eltern-View
            }
            parent.presentationMode.wrappedValue.dismiss() // Schließt die ImagePicker-Ansicht
        }
        
        // Wird aufgerufen, wenn die Auswahl abgebrochen wurde.
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss() // Schließt die ImagePicker-Ansicht
        }
    }
}
