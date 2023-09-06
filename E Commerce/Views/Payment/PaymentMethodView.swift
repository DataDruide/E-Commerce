
import SwiftUI
import URLImage



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

struct PaymentMethodView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodView()
    }
}

