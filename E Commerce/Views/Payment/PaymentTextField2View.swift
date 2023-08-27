import SwiftUI


struct PaymentTextField2View: View {
    // Deklarieren von Variablen
    @State var text : String = ""
    @State var textcvv : String = ""
    @State var textcardNumber : String = ""

    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Caption
            Text("CVV")
              .font(Font.custom("Montserrat", size: 13))
              .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
            HStack(alignment: .center, spacing: 0) {
                HStack(alignment: .top, spacing: 3) {
                    Image("Ellipse 55")
                    .frame(width: 4, height: 4)
                    .background(Color(red: 0.07, green: 0.07, blue: 0.07))
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .frame(width: 152, height: 44, alignment: .leading)
            .background(.white)
            .cornerRadius(8)
            .overlay(
              RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.25)
                .stroke(Color(red: 0.73, green: 0.73, blue: 0.73), lineWidth: 0.5)
            )
            // body
            Text("Check back of Card")
              .font(Font.custom("Montserrat", size: 14))
              .foregroundColor(Color(red: 0.63, green: 0.63, blue: 0.63))
              .frame(width: 152, alignment: .topLeading)
        }
        .padding(0)
        
    }
}



struct PaymentTextField2View_Previews: PreviewProvider {
    static var previews: some View {
        PaymentTextField2View()
    }
}
