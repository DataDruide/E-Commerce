import SwiftUI
import PDFKit


struct PdfView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var address: String = ""
    @State private var zipCode: String = ""
    @State private var phone: String = ""
    @State private var email: String = ""
    @State private var savedPDFURL: URL?
    @State private var pdfDocument: PDFDocument?
    @Binding var isPresented: Bool // Binding to dismiss the sheet
    let filename = "hii everyone this is working"

    var body: some View {
        
        VStack {
            CustomHeaderView()

            VStack(spacing: 16) {
                CustomTextField(placeholder: "Firstname", text: $firstName)
                CustomTextField(placeholder: "Lastname", text: $lastName)
                CustomTextField(placeholder: "Address", text: $address)
                CustomTextField(placeholder: "Zipcode", text: $zipCode)
                CustomTextField(placeholder: "Phone", text: $phone)
                CustomTextField(placeholder: "E-Mail", text: $email)
            }
            .padding()
            
            Button("PDF erstellen") {
                if let pdfData = createPDF() {
                    showPDFView(pdfData: pdfData)
                }
            }
            .frame(width: 250, height: 40)
            .background(Color(red: 0.4, green: 0.03, blue: 0.37))
            .foregroundColor(Color.white)
            .cornerRadius(25)
            
            Footer2View()
        }
    }
    
    func createPDF() -> Data? {
        let pdfMetaData = [
            kCGPDFContextCreator: "Deine App Name",
            kCGPDFContextAuthor: "Dein Name"
        ]
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]

        let pageRect = CGRect(x: 0, y: 0, width: 595.2, height: 841.8) // Standard A4-Größe
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)

        let data = renderer.pdfData { context in
            context.beginPage()
            
            let text = "Hallo, dies ist mein PDF!"
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 24)
            ]
            let attributedText = NSAttributedString(string: text, attributes: attributes)
            attributedText.draw(in: pageRect.insetBy(dx: 50, dy: 50))
            
            let nameText = """
                Vorname: \(firstName)
                Nachname: \(lastName)
                Adresse: \(address)
                PLZ: \(zipCode)
                Telefon: \(phone)
                Email: \(email)
                """
            let nameAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 18)
            ]
            let attributedNameText = NSAttributedString(string: nameText, attributes: nameAttributes)
            attributedNameText.draw(at: CGPoint(x: 50, y: 200))
        }
        
        return data
    }
    
    func savePDF(pdfData: Data) -> URL? {
            guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                return nil
            }
            
            let pdfURL = documentsDirectory.appendingPathComponent("bestellformular.pdf")
            
            do {
                try pdfData.write(to: pdfURL)
                return pdfURL
            } catch {
                print("Error saving PDF: \(error.localizedDescription)")
                return nil
            }
        }
       

    
    func showPDFView(pdfData: Data) {
        let pdfViewController = UIHostingController(rootView: PDFKitRepresentedView(data: pdfData))
        UIApplication.shared.windows.first?.rootViewController?.present(pdfViewController, animated: true, completion: nil)
    }

}


struct PDFKitRepresentedView: UIViewRepresentable {
    let data: Data
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = PDFDocument(data: data)
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {
        uiView.document = PDFDocument(data: data)
    }
}

