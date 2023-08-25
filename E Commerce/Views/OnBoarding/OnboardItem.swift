import SwiftUI

// Eine einzelne SwiftUI-View, die ein Onboarding-Element darstellt.
struct OnboardItem: View {
    
    // Die Bild-, Titel- und Beschreibungstexte für das Onboarding-Element.
    var title: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            
            // Platzhalter-Spacer, um den Inhalt vertikal zu zentrieren.
            Spacer()
            
            // Platzhalter-Spacer, um den Inhalt vertikal zu zentrieren.
            Spacer()
            
            // Der Titel des Onboarding-Elements.
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .kerning(0.8) // Anpassung des horizontalen Abstands zwischen Buchstaben in einem Text.
                .padding(.vertical, 12)
                .padding(.horizontal, 20)
                .foregroundColor(.yellow)
            
            // Platzhalter-Spacer, um den Inhalt vertikal zu zentrieren.
            Spacer()
        }
    }
}

// Die Preview-Provider für die `OnboardItem`.
struct OnboardItem_Previews: PreviewProvider {
    static var previews: some View {
        OnboardItem()
    }
}
