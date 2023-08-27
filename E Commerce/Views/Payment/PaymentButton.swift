

import SwiftUI


struct PaymentButton: View {
    var body: some View {
        Button(action: {
            // Hier könntest du die Aktion für den "Make Payment"-Button definieren
        }) {
            Text("Make payment")
                .font(.custom("Montserrat", size: 15))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(.horizontal, 60)
                .padding(.vertical, 4)
                .frame(width: 320, height: 45)
                .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                .cornerRadius(25)
        }
    }
}



struct PaymentButton_Previews: PreviewProvider {
    static var previews: some View {
        PaymentButton()
    }
}
