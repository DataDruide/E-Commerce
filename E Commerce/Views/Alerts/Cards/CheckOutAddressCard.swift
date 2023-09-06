
import SwiftUI


struct CheckOutAddressCard: View {
    @State private var isShowingSheet = false // State zur Steuerung des Anzeigens des Sheets
    
    // Add @State properties to hold the user's current address
    @State private var currentStreet = "Vanessa hopint 19"
    @State private var currentCity = "Edmund Crescent, yaba"
    @State private var currentState = "Lagos"
    @State private var currentPostalCode = "10001"
    @State private var currentCountry = "Nigeria"
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Delivery Address")
                    .font(
                        Font.custom("Montserrat", size: 17)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                
                Text("\(currentStreet), \(currentCity) \(currentState) \(currentPostalCode) \(currentCountry)")
                    .font(Font.custom("Montserrat", size: 14))
                    .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                
                HStack(alignment: .top, spacing: 10) {
                    Button(action: {
                        isShowingSheet = true // Beim Klick auf den Button das Sheet anzeigen lassen
                    }) {
                        Text("Change")
                            .font(
                                Font.custom("Montserrat", size: 13)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.white)
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color(red: 0.4, green: 0.03, blue: 0.37), lineWidth: 0.5)
                            )
                    }
                    .sheet(isPresented: $isShowingSheet) {
                        Pdf2View()
                    }
                }
            }
            .padding(12)
            .frame(width: 321, height: 141)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        }
    }
}
