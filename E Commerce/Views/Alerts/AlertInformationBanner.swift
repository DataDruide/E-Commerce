import SwiftUI

struct AlertInformationBanner: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image("ausrufezeichen")
                .frame(width: 100, height: 100)
            
            // subtitle
            Text("Are you sure you want to Cancel Order?")
                .font(
                    Font.custom("Montserrat", size: 17)
                        .weight(.medium)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                .frame(width: 229, height: 92, alignment: .center)
            
            HStack(spacing: 20) { // Hier habe ich den Abstand zwischen den Buttons hinzugefügt
                Button(action: {
                    // Action for the "Yes" button
                }) {
                    Text("Yes")
                        .font(
                            Font.custom("Montserrat", size: 15)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                .padding(.vertical, 8)
                .frame(width: 100)
                .background(Color(red: 0.9, green: 0.2, blue: 0.2))
                .cornerRadius(20)
                
                Button(action: {
                    // Action for the "No" button
                }) {
                    Text("No")
                        .font(
                            Font.custom("Montserrat", size: 15)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                }
                .padding(.vertical, 8)
                .frame(width: 100)
                .background(Color.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .inset(by: -0.5)
                        .stroke(Color(red: 0.4, green: 0.03, blue: 0.37), lineWidth: 1)
                )
            }
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 59)
        .frame(width: 360, alignment: .top)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(25)
    }
}

struct AlertInformationBanner_Previews: PreviewProvider {
    static var previews: some View {
        AlertInformationBanner()
    }
}
