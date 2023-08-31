import SwiftUI

struct ServerView: View {
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var backendSimulator = BackendSimulator()

    let paymentProviders = [
        PaymentProvider(name: "Klarna"),
        PaymentProvider(name: "Giropay"),
        PaymentProvider(name: "Creditcard")
    ]

    var body: some View {
        VStack {
            List(paymentProviders) { provider in
                Button(action: {
                    backendSimulator.selectedProvider = provider
                    backendSimulator.simulateServerRequest()
                    // Call the sharePDF function here
                    sharePDF(content: {
                        Text("PDF Content") // Replace with your actual content
                    }, fileName: "example.pdf")
                }) {
                    Text(provider.name)
                }
            }

            Text("Server Status: \(backendSimulator.serverStatus)")
            Text("Server Delay: \(backendSimulator.serverDelay) seconds")

            if backendSimulator.isProcessing {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            }

            if backendSimulator.paymentSuccess && backendSimulator.validationSuccess {
                Text("Payment and Validation were successful!")
                    .foregroundColor(.green)
                    .padding()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // Delay of 3 seconds
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }

    private func exportPDF<Content: View>(content: @escaping () -> Content, completion: @escaping (Bool, URL?) -> Void, fileName: String) {

        exportPDF(content: content, completion: { status , url in
            if let url = url, status {
                ShareSheet.instance.share(items: [url])
            } else {
                print("⚠️ Failed to make PDF")
            }
        }, fileName: fileName)
    }
}
