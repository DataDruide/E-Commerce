
import SwiftUI
import URLImage

struct PaymentMethod: Identifiable, Decodable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let image: String
    let rating: Rating
    
    struct Rating: Decodable {
        let rate: Double
        let count: Int
    }
}

struct PaymentMethodView: View {
    @State private var paymentMethods: [PaymentMethod] = []

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(paymentMethods) { method in
                        NavigationLink(destination: PaymentMethodDetailView(paymentMethod: method)) {
                            PaymentListShape(paymentMethod: method)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Zahlungsmethoden")
            .onAppear {
                Task {
                    await fetchData()
                }
            }
        }
    }

    func fetchData() async {
        if let url = URL(string: "http://localhost:1457/register") {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decodedData = try JSONDecoder().decode([PaymentMethod].self, from: data)
                DispatchQueue.main.async {
                    self.paymentMethods = decodedData
                }
            } catch {
                print("Fehler beim Decodieren der Daten: \(error)")
            }
        }
    }
}

struct PaymentMethodDetailView: View {
    let paymentMethod: PaymentMethod
    @State private var loadedImage: UIImage?
    @State private var isLoadingImage = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
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
//                Text(paymentMethod.title)
//                    .font(.title)
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

            }
        }
        .padding()
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


struct PaymentListShape: View {
    let paymentMethod: PaymentMethod
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(paymentMethod.title)
                .font(.title)
            Text(paymentMethod.description)
                .font(.body)
                .foregroundColor(.secondary)
            Text("Kategorie: \(paymentMethod.category)")
                .font(.caption)
                .foregroundColor(.secondary)
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .overlay(
                    Text(String(paymentMethod.rating.rate))
                        .foregroundColor(.black)
                        .offset(x: 5, y: -2)
                )
            Image(uiImage: loadImage(from: paymentMethod.image))
                .resizable()
                .aspectRatio(contentMode: .fit)
            Divider()
        }
        .padding()
    }
    
    func loadImage(from urlString: String) -> UIImage {
        guard let url = URL(string: urlString),
              let data = try? Data(contentsOf: url),
              let image = UIImage(data: data) else {
            return UIImage() // Fallback-Bild, falls das Laden fehlschlägt
        }
        return image
    }
}

struct PaymentMethodView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodView()
    }
}
