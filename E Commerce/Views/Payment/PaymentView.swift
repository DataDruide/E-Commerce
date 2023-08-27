import SwiftUI

// Diese View wickelt die Zahlungsmodalitäten ab
struct PaymentView: View {
    // Deklarieren von Variablen
    @State var text : String = ""
    @State var textcvv : String = ""
    
    
    var body: some View {
        VStack(alignment: .center,spacing: 10) {
            // Aufrufen unserer SubViews in der Mutterview
            PaymentHeaderView()
                .padding()
            PaymentProgressBarView() // Progressbar
                .padding()
            // Headline
            Text("Card Details")
                .font(Font.custom("Montserrat", size: 26))
                .kerning(0.25)
                .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
            
            PaymentCardNumberView()
                .padding()
            HStack { // 2 Textfelder Expiry Date und CVV
                PaymentTextField1View()
                    .padding()
                PaymentTextField2View()
                    .padding()
            } // Ende Textfelder
            PaymentSaveButtonShape()
                .padding()
            PaymentBoxShape()
                .padding()
            PaymentButton()
                .padding()
        }
        
    }
    
}
    struct PaymentView_Previews: PreviewProvider {
        static var previews: some View {
            PaymentView()
        }
    }








