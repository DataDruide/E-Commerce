
import SwiftUI


struct PaymentBoxShape: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Total")
                .font(.custom("Montserrat", size: 17))
                .fontWeight(.medium)
                .foregroundColor(.black)
            
            HStack(spacing: 20) {
                Text("Sub-total")
                    .font(.custom("Montserrat", size: 14))
                    .foregroundColor(.black)
                Spacer()
                Text("$65.00")
                    .font(.custom("Montserrat", size: 14))
                    .foregroundColor(.black)
            }
            .padding(0)
            
            Button(action: {
                // Hier könntest du die Aktion für den schnellen Liefer-Button definieren
            }) {
                Text("$15 fast delivery")
                    .font(.custom("Montserrat", size: 15))
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.14))
                    .padding(8)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(10)
            }
            
            Text("Deliver on or before March 14th")
                .font(.custom("Montserrat", size: 11))
                .foregroundColor(Color(red: 0.43, green: 0.44, blue: 0.46))
                .padding(.leading, 28)
        }
        .padding(20)
        .background(Color.gray.opacity(0.12))
        .cornerRadius(5)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}


struct PaymentBoxShape_Previews: PreviewProvider {
    static var previews: some View {
        PaymentBoxShape()
    }
}
