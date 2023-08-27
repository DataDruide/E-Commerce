
import SwiftUI


struct PaymentProgressBarView: View {
    // Deklarieren von Variablen
    @State var text : String = ""
    @State var textcvv : String = ""
    
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 0) {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 120, height: 8)
                  .background(Color(red: 0, green: 0.64, blue: 0.49))
                  .cornerRadius(4)
            }
            .padding(.leading, 0)
            .padding(.trailing, 201)
            .padding(.vertical, 0)
            .frame(width: 321, height: 8, alignment: .leading)
            .background(Color(red: 0, green: 0.64, blue: 0.49))
            .cornerRadius(4)
        }
        
    }
}

struct PaymentProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentProgressBarView()
    }
}
