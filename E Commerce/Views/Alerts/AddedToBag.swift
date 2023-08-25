import SwiftUI

struct AddedToBag: View {
    @State private var showingPaymentViewSheet = false
    @State private var showingCheckOutBannerSheet = false
    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            HStack(alignment: .center, spacing: 3) {
                Image("iconbanner")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                
                // Zeile: Titel - Gibt an, dass das Produkt zur Tasche hinzugefügt wurde
                Text("Articel added to Bag")
                  .font(Font.custom("Montserrat", size: 11))
                  .foregroundColor(.black)
                
                // Button - Zeigt den Inhalt der Tasche an, mit der Angabe der Anzahl der Artikel
                Text("My Bag, 1 Product")
                  .font(
                    Font.custom("Montserrat", size: 15)
                      .weight(.medium)
                  )
                  .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
            }
            .padding(.horizontal, 3)
            .padding(.vertical, 0)
            .background(.white)
            .cornerRadius(5)
            
            HStack(alignment: .top, spacing: 10) {
                ZStack {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 166, height: 167)
                      .background(
                        Image("thumbnail")
                          .resizable()
                          .aspectRatio(contentMode: .fill)
                          .frame(width: 166, height: 167)
                          .clipped()
                      )
                      .cornerRadius(5)
                }
                .frame(width: 166, height: 167)
                
                // Produktinformationen
                VStack(alignment: .leading, spacing: 3) {
                    Text("Fashionnova Sundress $65")
                        .font(Font.custom("Montserrat", size: 14))
                        .foregroundColor(.black)
                    Text("Color: Navy Blau")
                        .font(Font.custom("Montserrat", size: 13))
                        .foregroundColor(.black)
                    HStack {
                        Text("XS")
                            .font(Font.custom("Montserrat", size: 13))
                            .foregroundColor(.black)
                        Text("Range: 1")
                            .font(Font.custom("Montserrat", size: 13))
                            .foregroundColor(.black)
                    }
                }
            }
            .frame(width: 334, height: 213)
            .background(.white)
            .cornerRadius(5)
            
            HStack {
                // Untertitel: Gesamtsumme
                Text("Totalprice:")
                    .font(
                        Font.custom("Montserrat", size: 17)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                Spacer()
                // Gesamtsumme des Produktpreises
                Text("$65.00")
                  .font(
                    Font.custom("Montserrat", size: 17)
                      .weight(.medium)
                  )
                  .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
            }
            
            HStack(spacing: 20) {
                // Button: "Tasche anzeigen"
                Button(action: {
                    // Aktion für den "Show Bag" Button
                }) {
                    Text("Show Bag")
                        .font(Font.custom("Montserrat", size: 15).weight(.medium))
                        .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                }
                
                Spacer()
                
                // Button: "Zur Kasse gehen"
                Button(action: {
                // Aktion für den "Check Out" Button
                showingCheckOutBannerSheet = true
                }) {
                Text("Check Out")
                    .font(Font.custom("Montserrat", size: 15).weight(.medium))
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 9)
                    .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                    .cornerRadius(20)
                }
                .sheet(isPresented: $showingCheckOutBannerSheet) {
                    CheckOutBanner()
                }
            }

        }
        .padding(0)
        .frame(width: 354, height: 418, alignment: .topLeading)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
    }
}

struct AddedToBag_Previews: PreviewProvider {
    static var previews: some View {
        AddedToBag()
    }
}
