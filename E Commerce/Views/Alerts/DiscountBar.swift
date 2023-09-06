

import Foundation
import SwiftUI

struct DiscountBar: View {
    @State private var isCheckboxChecked = false
    
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
                
                Button(action: {
                    isCheckboxChecked.toggle()
                }) {
                    Image(systemName: isCheckboxChecked ? "checkmark.square.fill" : "square")
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color(red: 0.4, green: 0.03, blue: 0.37))
                }
            }
            .padding(.horizontal, 19)
            .padding(.vertical, 6)
            .frame(width: 320, height: 46, alignment: .leading)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        }
    }
}





