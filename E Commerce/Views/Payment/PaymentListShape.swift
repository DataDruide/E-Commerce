
import SwiftUI


struct PaymentListShape: View {
    let paymentMethod: PaymentMethod
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(paymentMethod.title)
                .font(Font.custom("Sedgwick Ave Display", size: 34))
                .kerning(0.25)
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
