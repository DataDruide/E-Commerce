import Foundation
import FirebaseAuth

// Die AuthService-Klasse ist eine ObservableObject-Klasse, die verschiedene Methoden für die Verwaltung von Authentifizierungsfunktionen enthält.
final class AuthService: ObservableObject {
    
    // Die "user"-Eigenschaft ist ein optionales User-Objekt und wird aktualisiert, wenn sich der Authentifizierungszustand ändert.
    var user: User? {
        didSet {
            objectWillChange.send()
        }
    }
    
    // Methode zum Hinzufügen eines Listeners für Änderungen im Authentifizierungszustand.
    // Diese Methode registriert einen Beobachter für Änderungen im Authentifizierungszustand.
    // Wenn sich der Authentifizierungszustand ändert (z. B. ein Benutzer sich ein- oder ausloggt),
    // wird der bereitgestellte Abschluss aufgerufen, um den neuen Benutzer zurückzugeben.
    // Der Beobachter wird schwach referenziert, um potenzielle Zyklen zu vermeiden.
    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else { return }
            self.user = user
        }
    }
    
    // Methode zum Registrieren eines neuen Benutzers mit einer E-Mail-Adresse und einem Passwort.
    // Diese Methode ermöglicht die Registrierung eines neuen Benutzers mit einer E-Mail-Adresse und einem Passwort.
    // Der Benutzer wird mit den bereitgestellten Anmeldeinformationen bei Firebase Authentication registriert.
    // Wenn ein Fehler auftritt, wird eine Fehlermeldung in die Konsole gedruckt.
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Ein Fehler ist aufgetreten: \(error)")
                return
            }
            // Erfolgreiche Registrierung behandeln, wenn erforderlich
        }
    }
    
    // Methode zum Anmelden eines registrierten Benutzers mit einer E-Mail-Adresse und einem Passwort.
    // Diese Methode ermöglicht die Anmeldung eines registrierten Benutzers mit einer E-Mail-Adresse und einem Passwort.
    // Die Anmeldeinformationen werden mit Firebase Authentication überprüft, und bei erfolgreicher Anmeldung
    // wird der Benutzer als angemeldeter Benutzer in der App authentifiziert.
    // Wenn ein Fehler auftritt, wird eine Fehlermeldung in die Konsole gedruckt.
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Ein Fehler ist aufgetreten: \(error)")
                return
            }
            // Erfolgreiche Anmeldung behandeln, wenn erforderlich
        }
    }
    
    // Methode zum Abmelden eines angemeldeten Benutzers.
    // Diese Methode ermöglicht es einem angemeldeten Benutzer, sich von Firebase Authentication abzumelden.
    // Wenn ein Fehler auftritt, wird eine Fehlermeldung in die Konsole gedruckt.
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("Ein Fehler ist aufgetreten: \(error)")
        }
        // Erfolgreiche Abmeldung behandeln, wenn erforderlich
    }
}
