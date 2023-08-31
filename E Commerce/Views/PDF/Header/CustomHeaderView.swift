
import SwiftUI

struct CustomHeaderView: View {
    var body: some View {
        HStack {
            Button(action: {
                // Aktion für Glocken-Button
            }) {
                Image(systemName: "bell")
                    .font(.system(size: 20))
            }
            Spacer()
            Text("IHRE BESTELLUNG")
                .font(.headline)
            Spacer()
            Button(action: {
                // Aktion für Hamburger-Button
            }) {
                Image(systemName: "line.horizontal.3")
                    .font(.system(size: 20))
            }
        }
        .padding()
        .background(Color(red: 0.4, green: 0.03, blue: 0.37))
        .foregroundColor(.white)
    }
}

struct CustomHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomHeaderView()
    }
}
