import SwiftUI

struct CheckOutBanner: View {
    
    @State private var showingPaymentViewSheet = false

    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image("icon-x")
                        .frame(width: 30, height: 30)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
                    
                    Spacer()
                    
                    // subtitle
                    Text("Checkout")
                        .font(
                            Font.custom("Montserrat", size: 17)
                                .weight(.medium)
                        )
                        .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                HStack {
                    Text("Your Cart is Almost Ready")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                Button(action: {
                                showingPaymentViewSheet = true
                            }) {
                                Text("Proceed to Payment")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                                    .cornerRadius(8)
                            }
                            .sheet(isPresented: $showingPaymentViewSheet) {
                                PaymentView()
                            }
                .padding(.horizontal)
                .padding(.top, 20)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
                
                ProgressView(value: 0.5, total: 1.0)
                    .frame(height: 8)
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                HStack {
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 146, height: 147)
                        .background(
                            Image("thumbnail")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 146, height: 147)
                                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
                                .clipped()
                        )
                        .cornerRadius(5)
                    
                    // body
                    VStack(alignment: .leading, spacing: 3) {
                        Text("Fashionnova sundress $65")
                            .font(Font.custom("Montserrat", size: 14))
                            .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                            .frame(width: 127, alignment: .topLeading)
                        
                        Text("Color: Navy blue")
                            .font(Font.custom("Montserrat", size: 13))
                            .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                            .frame(width: 115.02538, alignment: .topLeading)
                        
                        // Caption
                        HStack {
                            Text("XS")
                                .font(Font.custom("Montserrat", size: 13))
                                .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                .frame(width: 18.98477, alignment: .topLeading)
                            
                            Text("QTY: 1")
                                .font(Font.custom("Montserrat", size: 13))
                                .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                .frame(width: 45.7868, alignment: .topLeading)
                        }
                    }
                }
                
                HStack(alignment: .center, spacing: 10) {
                    Image(systemName: "trash")
                    .frame(width: 24, height: 24)
                }
                .padding(.horizontal, 4)
                .padding(.vertical, 0)
                .frame(width: 69, alignment: .center)
                .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                .cornerRadius(5)
                
                
                CheckOutAddressCard()
                DiscountBar()
                HStack(alignment: .center) {
                    // Space Between
                    Spacer()
                    
                    // Alternative Views and Spacers
                    Text("Alternative Views")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 15)
                        .frame(width: 317, alignment: .center)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(5)
                    
                    Spacer()
                }
            }
            .frame(width: 360, height: 800)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
            .background(Color.white)
            .cornerRadius(10)
        }
    }
}

struct CheckOutBanner_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutBanner()
    }
}

struct CheckOutAddressCard: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Delivery Address")
                    .font(
                        Font.custom("Montserrat", size: 17)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                
                Text("Vanessa hopint 19, Edmund Crescent, yaba, Lagos 10001 Nigeria 0814567390")
                    .font(Font.custom("Montserrat", size: 14))
                    .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                
                HStack(alignment: .top, spacing: 10) {
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
            }
            .padding(12)
            .frame(width: 321, height: 141)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        }
    }
}

struct DiscountBar: View {
    var body: some View {
        ZStack {
          
            HStack(alignment: .center, spacing: 63) {
                // subtitle
                Text("Promo code/Discounts")
                  .font(
                    Font.custom("Montserrat", size: 17)
                      .weight(.medium)
                  )
                  .foregroundColor(.black)
                
                
                Image("icon-x")
                .frame(width: 24, height: 24)
                .background(Color(red: 0.4, green: 0.03, blue: 0.37))
            }
            .padding(.horizontal, 19)
            .padding(.vertical, 6)
            .frame(width: 320, height: 46, alignment: .leading)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))

        }
    }
}
