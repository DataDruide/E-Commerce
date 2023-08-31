import SwiftUI

struct SettingView: View {
    @State private var isButtonTapped = false

    var body: some View {
        NavigationView {
            List {
                // Abschnitt "Allgemein"
                Section(header: Text("Allgemein").font(.headline)) {
                    // NavigationLink zur "Allgemeine Einstellungen" Ansicht
                    NavigationLink(destination: Text("Allgemeine Einstellungen")) {
                        Label("Allgemeine Einstellungen", systemImage: "gear")
                    }
                    
                    // NavigationLink zur "Spracheinstellungen" Ansicht
                    NavigationLink(destination: Text("Spracheinstellungen")) {
                        Label("Spracheinstellungen", systemImage: "globe")
                    }
                    
                    // NavigationLink zur "CreateProfileView" Ansicht
                    NavigationLink(destination: ProfileView()) {
                        Label("Profil erstellen", systemImage: "person")
                    }
                    
                    // NavigationLink zur "CallCenterView" Ansicht
                    NavigationLink(destination: CallCenterView()) {
                        Label("Call Center", systemImage: "phone")
                    }
                }
                
                // Abschnitt "Benachrichtigungen"
                Section(header: Text("Benachrichtigungen").font(.headline)) {
                    // Toggle für Push-Benachrichtigungen
                    Toggle(isOn: .constant(true)) {
                        Label("Push-Benachrichtigungen", systemImage: "bell")
                    }
                    
                    // Toggle für E-Mail-Benachrichtigungen
                    Toggle(isOn: .constant(false)) {
                        Label("E-Mail-Benachrichtigungen", systemImage: "envelope")
                    }
                }
                
                // Abschnitt "Datenschutz"
                Section(header: Text("Datenschutz").font(.headline)) {
                    // NavigationLink zur "Datenschutzeinstellungen" Ansicht
                    NavigationLink(destination: TermsOfServiceView()) {
                        Label("Datenschutzeinstellungen", systemImage: "lock")
                    }
                }
                
                // Abschnitt "Anzeige"
                Section(header: Text("Anzeige").font(.headline)) {
                    // Toggle für Dark Mode
                    Toggle(isOn: .constant(true)) {
                        Label("Dark Mode", systemImage: "moon")
                    }
                    
                    // Toggle für Light Mode
                    Toggle(isOn: .constant(true)) {
                        Label("Light Mode", systemImage: "moonphase.new.moon")
                    }
                }
            }
            .navigationBarTitle("Einstellungen") // Titel der NavigationBar
        }
        .background(
            // ... Hintergrundfarbverlauf und Button-Overlay ...
            Color.white
        )
    }
}


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
