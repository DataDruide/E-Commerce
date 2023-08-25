import SwiftUI

struct PaymentView: View {
    
    @State var text : String = ""
    @State var textcvv : String = ""

    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {
                    // Aktion für den Button
                }) {
                    Image("icon-x")
                        .font(.title)
                        .frame(width: 30, height: 30)
                }
                .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))

                Spacer()

                Text("Payment")
                    .font(Font.custom("Montserrat", size: 17).weight(.medium))
                    .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                
                Spacer()

            }
            .padding(.horizontal)
            .padding(.top)

      


            Rectangle()
                .foregroundColor(Color(red: 0, green: 0.64, blue: 0.49))
                .frame(height: 8)
                .cornerRadius(4)
                .padding(.horizontal, 20)
            
            ZStack {
                // Headline
                Text("Card Details")
                  .font(Font.custom("Montserrat", size: 26))
                  .kerning(0.25)
                  .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                
                
                
                VStack(alignment: .leading, spacing: 4) {
                    // Caption
                    Text("Card number")
                      .font(Font.custom("Montserrat", size: 13))
                      .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                    
                    HStack(alignment: .center, spacing: 0) {
                        Text("1234567980")
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
            .frame(width: 360, height: 529)
            
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {  // Caption
                    Text("Expiry date")
                        .font(Font.custom("Montserrat", size: 13))
                        .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                    Spacer()
                    Text("CVV")
                        .font(Font.custom("Montserrat", size: 13))
                        .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                    Spacer()

                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .frame(width: 360, alignment: .leading)
                .background(Color.white)
                .cornerRadius(8)
                
                
                HStack(alignment: .center, spacing: 0) {
                    HStack(alignment: .top, spacing: 3) {
                        TextField("Expiry Date", text: $text)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay(
                            RoundedRectangle(cornerRadius: 8)
                            .inset(by: 0.25)
                            .stroke(Color(red: 0.73, green: 0.73, blue: 0.73), lineWidth: 0.5)
                            )
                        Spacer()
                        Spacer()
                        TextField("CVV", text: $textcvv)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay(
                            RoundedRectangle(cornerRadius: 8)
                            .inset(by: 0.25)
                            .stroke(Color(red: 0.73, green: 0.73, blue: 0.73), lineWidth: 0.5)
                            )

//                        Image("Ellipse 59")
//                            .frame(width: 4, height: 4)
//                            .background(Color(red: 0.07, green: 0.07, blue: 0.07))
//
//                        Image("Ellipse 59")
//                            .frame(width: 4, height: 4)
//                            .background(Color(red: 0.07, green: 0.07, blue: 0.07))
//
//                        Image("Ellipse 59")
//                            .frame(width: 4, height: 4)
//                            .background(Color(red: 0.07, green: 0.07, blue: 0.07))
//
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .frame(width: 360, height: 44, alignment: .center)
                .background(.white)
                .cornerRadius(8)
                HStack {
                    // body
                    Text("Check back of Card")
                        .font(Font.custom("Montserrat", size: 14))
                        .foregroundColor(Color(red: 0.63, green: 0.63, blue: 0.63))
                        .frame(width: 152, alignment: .topLeading)
                    Spacer()
                    
                    // body
                    Text("3 digit on back of card")
                        .font(Font.custom("Montserrat", size: 14))
                        .foregroundColor(Color(red: 0.63, green: 0.63, blue: 0.63))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                }
                
                HStack(alignment: .center, spacing: 10) {
                    // Button
                    Text("Save")
                      .font(
                        Font.custom("Montserrat", size: 15)
                          .weight(.medium)
                      )
                      .foregroundColor(.white)
                }
                .padding(.horizontal, 56)
                .padding(.vertical, 9)
                .frame(height: 33, alignment: .center)
                .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                .cornerRadius(20)
                
                
                VStack(alignment: .leading, spacing: 14) {
                    
                    HStack(alignment: .center, spacing: 164) {
                        // subtitle
                        Text("Total")
                          .font(
                            Font.custom("Montserrat", size: 17)
                              .weight(.medium)
                          )
                          .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                        
                        
                    }
                    .padding(0)
                    HStack {
                        // body
                        Text("Sub-total")
                            .font(Font.custom("Montserrat", size: 14))
                            .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                        Spacer()
                        // body
                        Text("$65.00")
                          .font(Font.custom("Montserrat", size: 14))
                          .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 7)
                .frame(width: 320, alignment: .topLeading)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(5)
                
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack(alignment: .center, spacing: 0) {
                        
                        Image("Stroke")
                        .frame(width: 16, height: 16)
                        .overlay(
                          Rectangle()
                            .stroke(Color(red: 0.4, green: 0.03, blue: 0.37), lineWidth: 2)
                        )
                    }
                    .padding(2)
                    .frame(width: 20, height: 20, alignment: .center)
                    .cornerRadius(100)
                }
                .padding(0)
            }
            .padding(0)
                
            }
            .frame(width: 360, height: 800)
            .background(Color.white)
            .cornerRadius(10)
        }
       
    }

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
