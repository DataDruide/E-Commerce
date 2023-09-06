import Foundation
import UIKit

extension UIImageView {
    
    // Eine Funktion zum Herunterladen und Anzeigen eines Bildes von einer URL mit einer angegebenen Content Mode.
    func downloadImageFrom(urlString: String, imageMode: UIView.ContentMode) {
        guard let url = URL(string: urlString) else { return }
        downloadImageFrom(url: url, imageMode: imageMode)
    }
    
    // Eine Funktion zum Herunterladen und Anzeigen eines Bildes von einer URL mit einer angegebenen Content Mode.
    func downloadImageFrom(url: URL, imageMode: UIView.ContentMode) {
        contentMode = imageMode // Setze die Content Mode für das Bild
        
        let imageCache = NSCache<NSString, AnyObject>() // Erstelle einen Bildcache
        
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
            // Wenn das Bild im Cache vorhanden ist, verwende es
            self.image = cachedImage
        } else {
            // Wenn das Bild nicht im Cache ist, lade es herunter
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    if let imageToCache = UIImage(data: data) {
                        // Wenn das Bild erfolgreich heruntergeladen wurde, setze es im Cache und zeige es an
                        imageCache.setObject(imageToCache, forKey: url.absoluteString as NSString)
                        self.image = imageToCache
                    }
                }
            }.resume()
        }
    }
}
