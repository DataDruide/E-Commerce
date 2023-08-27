

import SwiftUI


struct PaymentSaveButtonShape: View {
    var body: some View {
        VStack {
            
            HStack(alignment: .center, spacing: 10) {
                Button(action: {
                    // Füge hier den Aktionsschritt hinzu, der beim Klicken des Buttons ausgeführt werden soll
                }) {
                    Text("Save")
                        .font(
                            Font.custom("Montserrat", size: 15)
                                .weight(.medium)
                        )
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 56)
            .padding(.vertical, 9)
            .frame(height: 33, alignment: .center)
            .background(Color(red: 0.4, green: 0.03, blue: 0.37))
            .cornerRadius(20)
            
        }
    }
}

struct PaymentSaveButtonShape_Previews: PreviewProvider {
    static var previews: some View {
        PaymentSaveButtonShape()
    }
}
