

import SwiftUI


struct PaymentHeaderView: View {
    // Deklarieren von Variablen
    @State var text: String = ""
    @State var textcvv: String = ""
    
    var body: some View {
        HStack {
            Button(action: {
                // Hier könntest du die Aktion für den Button definieren
            }) {
                Image(systemName: "icon-x")
                    .font(.custom("Montserrat", size: 15).weight(.medium))
                    .foregroundColor(.white)
                    .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                    .cornerRadius(20)
            }
            
            
            Text("Payment")
                .font(Font.custom("Montserrat", size: 17).weight(.medium))
                .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
            
            
            
        }
    }
}



struct PaymentHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentHeaderView()
    }
}
