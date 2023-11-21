


import SwiftUI
import URLImage



struct PaymentMethodDetailView: View {
    let paymentMethod: PaymentMethod
    @State private var loadedImage: UIImage?
    @State private var isLoadingImage = false

    var body: some View {
        List {
            Section(header: Text("Details")) {
                if isLoadingImage {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .scaleEffect(2.0, anchor: .center)
                } else {
                    if let loadedImage = loadedImage {
                        Image(uiImage: loadedImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200) // Adjust height as needed
                    } else {
                        Text("Bild konnte nicht geladen werden")
                            .font(.headline)
                            .foregroundColor(.red)
                    }
                    Text(paymentMethod.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                    Text("Kategorie: \(paymentMethod.category)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    HStack {
                        ForEach(1..<6, id: \.self) { starIndex in
                            Image(systemName: "star.fill")
                                .foregroundColor(starIndex <= Int(paymentMethod.rating.rate) ? .yellow : .gray)
                                .onTapGesture {
                                    // Hier kannst du die Bewertung aktualisieren, wenn der Benutzer auf einen Stern klickt
                                    // Zum Beispiel könntest du die ausgewählte Bewertung in einer Variable speichern
                                    // und diese Variable dann verwenden, um die Anzeige der Sterne zu steuern
                                }
                        }
                        Text(String(paymentMethod.rating.rate))
                            .foregroundColor(.black)
                        
                    }
                    PayButton()
                    FooterView()

                }
            }
        }
        .listStyle(InsetGroupedListStyle()) // Stil anpassen
        .navigationTitle(paymentMethod.title)
        .onAppear {
            async {
                isLoadingImage = true
                loadedImage = await loadImage(from: paymentMethod.image)
                isLoadingImage = false
            }
        }
    }
    
    func loadImage(from urlString: String) async -> UIImage? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return UIImage(data: data)
        } catch {
            print("Fehler beim Laden des Bildes: \(error)")
            return nil
        }
    }
}
