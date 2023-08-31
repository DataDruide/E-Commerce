import SwiftUI

struct TermsOfServiceView: View {
    @State private var isAccepted: Bool = false
    @State private var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                Text("Nutzungsbedingungen")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, 20)
                
                Text("Willkommen bei unserer App. Durch die Nutzung dieser App erklären Sie sich mit den folgenden Nutzungsbedingungen einverstanden:")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 20)
                
                // Grouped sections of terms
                Group {
                    TermSection(title: "Zustimmung zu den Bedingungen der AGB des Unternehmens Die Putzteufel", content: """
                    Bitte lesen Sie diese Nutzungsbedingungen sorgfältig durch und stimmen Sie ihnen zu, bevor Sie unsere App nutzen. Wenn Sie nicht mit diesen Bedingungen einverstanden sind, verwenden Sie die App bitte nicht.
                    """)

                    // ... Additional terms sections ...

                    TermSection(title: "Änderungen der Nutzungsbedingungen", content: """
                    Wir behalten uns das Recht vor, diese Nutzungsbedingungen jederzeit ohne vorherige Ankündigung zu ändern. Es liegt in Ihrer Verantwortung, regelmäßig auf Aktualisierungen der Bedingungen zu achten. Durch die fortgesetzte Nutzung der App nach der Veröffentlichung von Änderungen erklären Sie sich mit den aktualisierten Bedingungen einverstanden.
                    """)

                    TermSection(title: "Änderungen zur Bedingungen zur Kündigung", content: """
                    Wir behalten uns das Recht vor, Ihren Zugang zur App nach eigenem Ermessen ohne vorherige Ankündigung oder Haftung zu beenden oder auszusetzen, wenn Sie gegen diese Nutzungsbedingungen verstoßen.
                    """)

                    TermSection(title: "Aktueller Satz des Anwendbares Recht", content: """
                    Diese Nutzungsbedingungen unterliegen den Gesetzen des Landes, in dem Sie wohnhaft sind, und jegliche rechtliche Streitigkeiten unterliegen der ausschließlichen Zuständigkeit der Gerichte dieses Landes.
                    """)

                    // Additional terms sections...
                }
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.2))
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                )
                .padding(.top, 16)
                
                // Buttons for agreement
                HStack(spacing: 16) {
                    AgreementButton(title: "Ich akzeptiere", isSelected: isAccepted) {
                        isAccepted = true
                        // Close the view here if "Ich akzeptiere" is selected
                    }
                    
                    AgreementButton(title: "Ich akzeptiere nicht", isSelected: !isAccepted) {
                        if isAccepted {
                            showAlert = true
                        } else {
                            isAccepted = false
                        }
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Achtung!"), message: Text("Sie haben die Nutzungsbedingungen nicht akzeptiert."), dismissButton: .default(Text("OK")))
                    }
                }
                .padding(.top, 16)
            }
            .padding(.horizontal, 20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.2))
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
            )
            .padding(.top, 16)
        }
    }
}

struct TermsOfServiceView_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfServiceView()
            .previewDevice("iPhone 12")
            .preferredColorScheme(.light)
    }
}
