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
                    .foregroundColor(.yellow)
                    .padding(.top, 20)
                
                Text("Willkommen bei unserer App. Durch die Nutzung dieser App erklären Sie sich mit den folgenden Nutzungsbedingungen einverstanden:")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                
                Group {
                    Text("1. Zustimmung zu den Bedingungen der AGB des Unternehmens Die Putzteufel")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("Bitte lesen Sie diese Nutzungsbedingungen sorgfältig durch und stimmen Sie ihnen zu, bevor Sie unsere App nutzen. Wenn Sie nicht mit diesen Bedingungen einverstanden sind, verwenden Sie die App bitte nicht.")
                        .font(.body)
                        .foregroundColor(.white)

                    // ... Weitere Bedingungen ...

                    Text("5. Änderungen der Nutzungsbedingungen")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("Wir behalten uns das Recht vor, diese Nutzungsbedingungen jederzeit ohne vorherige Ankündigung zu ändern. Es liegt in Ihrer Verantwortung, regelmäßig auf Aktualisierungen der Bedingungen zu achten. Durch die fortgesetzte Nutzung der App nach der Veröffentlichung von Änderungen erklären Sie sich mit den aktualisierten Bedingungen einverstanden.")
                        .font(.body)
                        .foregroundColor(.white)

                    Text("6. Änderungen zur\nBedingungen zur Kündigung")
                        .font(.headline)
                        .foregroundColor(.white)

                    Text("Wir behalten uns das Recht vor, Ihren Zugang zur App nach eigenem Ermessen ohne vorherige Ankündigung oder Haftung zu beenden oder auszusetzen, wenn Sie gegen diese Nutzungsbedingungen verstoßen.")
                        .font(.body)
                        .foregroundColor(.white)

                    Text("7. Aktueller Satz des Anwendbares Recht")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("Diese Nutzungsbedingungen unterliegen den Gesetzen des Landes, in dem Sie wohnhaft sind, und jegliche rechtliche Streitigkeiten unterliegen der ausschließlichen Zuständigkeit der Gerichte dieses Landes.")
                        .font(.body)
                        .foregroundColor(.white)

                    // Weitere Bedingungen hier hinzufügen...
                }
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.2))
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                )
                .padding(.top, 16)
                
                // Buttons für Zustimmung
                HStack(spacing: 16) {
                                  Button(action: {
                                      isAccepted = true
                                      // Schließe die View hier, wenn "Ich akzeptiere" ausgewählt wird
                                  }) {
                                      HStack(spacing: 6) {
                                          Image(systemName: isAccepted ? "checkmark.circle.fill" : "circle")
                                              .foregroundColor(.green)
                                              .font(.system(size: 20))
                                          Text("Ich akzeptiere")
                                              .foregroundColor(.blue)
                                              .padding(.vertical, 10)
                                              .padding(.horizontal, 10)
                                              .background(Color.gray.opacity(0.3))
                                              .cornerRadius(10)
                                      }
                                  }
                                  
                                  Button(action: {
                                      if isAccepted {
                                          showAlert = true
                                      } else {
                                          isAccepted = false
                                      }
                                  }) {
                                      HStack(spacing: 6) {
                                          Image(systemName: isAccepted ? "circle" : "xmark.circle.fill")
                                              .foregroundColor(.white)
                                              .font(.system(size: 20))
                                          Text("Ich akzeptiere nicht")
                                              .foregroundColor(.blue)
                                              .padding(.vertical, 10)
                                              .padding(.horizontal, 10)
                                              .background(Color.gray.opacity(0.3))
                                              .cornerRadius(10)
                                      }
                                  }
                                  .alert(isPresented: $showAlert) {
                                      Alert(title: Text("Achtung!"), message: Text("Sie haben die Nutzungsbedingungen nicht akzeptiert."), dismissButton: .default(Text("OK")))
                                  }
                              }
                              .padding(.top, 16)

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
