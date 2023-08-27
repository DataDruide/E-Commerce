
import SwiftUI


struct PaymentCardNumberView: View {
    // Deklarieren von Variablen
    @State var text : String = ""
    @State var textcvv : String = ""
    @State var textcardNumber : String = ""

    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Caption
            Text("Card number")
              .font(Font.custom("Montserrat", size: 13))
              .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
            
            HStack(alignment: .center, spacing: 0) {
                TextField("1234567980",text: $textcardNumber)
                  .font(Font.custom("Nunito Sans", size: 14))
                  .foregroundColor(Color(red: 0.11, green: 0.11, blue: 0.11))
                  .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .frame(width: 320, alignment: .leading)
            .background(.white)
            .cornerRadius(8)
            .overlay(
              RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.25)
                .stroke(Color(red: 0.73, green: 0.73, blue: 0.73), lineWidth: 0.5)
            )
            
            // body
            Text("Tip: 10 digits on card front")
              .font(Font.custom("Montserrat", size: 14))
              .foregroundColor(Color(red: 0.63, green: 0.63, blue: 0.63))
              .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .padding(0)
        .frame(width: 328, alignment: .topLeading)
        
    }
}



struct PaymentCardNumberView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentCardNumberView()
    }
}
