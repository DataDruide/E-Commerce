
import SwiftUI

struct Pdf2View: View {
   
        let filename = "hii everyone this is working"
           
           var body: some View {
               ScrollView {
                       Text(filename)
                   Button {
                       sharePDF(content: {self}, fileName: filename)
                       
                   } label: {
                       Text("click me to share")
                   }
                   .buttonStyle(.borderedProminent)

               }
           }
    }


struct Pdf2View_Previews: PreviewProvider {
    static var previews: some View {
        Pdf2View()
    }
}
