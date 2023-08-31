
import SwiftUI

import SwiftUI

struct ProductSizeSelectionShape: View {
    @ObservedObject var sizeViewModel = SizeViewModel() // Nutze das SizeViewModel hier

    var body: some View {
        VStack {
            HStack {
                Text("Here you choose your size.")
                                ForEach(sizeViewModel.sizes) { size in
                                    Text(size.name)
                                        .font(Font.custom("Montserrat", size: 13))
                                        .foregroundColor(sizeViewModel.selectedSize == size ? .black : Color(red: 0.73, green: 0.73, blue: 0.73))
                                        .padding(5)
                                        .background(sizeViewModel.selectedSize == size ? Color.gray.opacity(0.05) : Color.clear)
                                        .cornerRadius(8)
                                        .onTapGesture {
                                            sizeViewModel.selectedSize = size // Aktualisiere die ausgewählte Größe im ViewModel
                                        }
                                }
            }
            .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25) // grauer Schatten
        }
        .padding(.vertical, 10)
    }
}


struct AddProductButton: View {
    @State private var showingPaymentViewSheet = false
    @State private var showingCheckOutBannerSheet = false
    @ObservedObject private var sizeViewModel = SizeViewModel() // SizeViewModel hinzugefügt

    let product: Product
    var body: some View {
        
        VStack {
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
                    CheckOutBanner(selectedSize: sizeViewModel.selectedSize, product: Product(id: product.id,
                        title: product.title,
                        price: product.price,
                        description: product.description,
                        category: product.category,
                        image: product.image,
                        rating: Rating(rate: 4.5, count: 120)))
                }
                
            }
        }
    }
}
