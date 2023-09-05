import SwiftUI

struct PaymentButton: View {
    @State private var isPaymentMethodViewPresented = false // Zustand für die Präsentation der ServerView
    
    var body: some View {
        VStack {
                        Button(action: {
                            isPaymentMethodViewPresented = true // ServerView wird als Sheet präsentiert, wenn der Button geklickt wird
                        }) {
                            Text("PAYMENT METHODS")
                                .font(.custom("Montserrat", size: 15))
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .padding(.horizontal, 60)
                                .padding(.vertical, 4)
                                .frame(width: 320, height: 45)
                                .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                                .cornerRadius(25)
                        }
                    }
                    .sheet(isPresented: $isPaymentMethodViewPresented) {
                        PaymentMethodView() // ServerView wird als Sheet präsentiert
                    }
        }
    }
    
    struct PaymentButton_Previews: PreviewProvider {
        static var previews: some View {
            PaymentButton()
        }
    }

