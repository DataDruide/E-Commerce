
import SwiftUI

struct PayButton: View {
    @State private var showAlert = false
    
    var body: some View {
        VStack(alignment: .center,spacing: 5) {
            Button(action: {
                showAlert = true
            }) {
                Text("PAY NOW")
                    .font(.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                    .cornerRadius(10)
            }
        }
        .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Payment Required"),
                        message: Text("Confirm your purchase of the products"),
                        primaryButton: .default(Text("OK")) {
                            // Handle OK button action here, if needed
                        },
                        secondaryButton: .cancel()
                    )
                }
    }
}
