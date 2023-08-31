import Foundation
import FirebaseAuth

// The AuthService class is an ObservableObject class that contains various methods for managing authentication functions
final class AuthService: ObservableObject {
    
    // The "user" property is an optional User and is updated when the authentication state changes
    var user: User? {
        didSet {
            objectWillChange.send()
        }
    }
    
    // Method to add a listener for changes in authentication state
    // This method registers an observer for authentication state changes.
    // When the authentication state changes (e.g., a user logs in or logs out),
    // the provided closure is called to return the new user.
    // The observer is weakly referenced to avoid potential cycles.
    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else { return }
            self.user = user
        }
    }
    
    // Method to register a new user with an email address and password
    // This method allows registering a new user with an email address and password.
    // The user is registered with the provided credentials on Firebase Authentication.
    // If an error occurs, an error message is printed to the console.
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("An error occurred: \(error)")
                return
            }
            // Handle successful registration if needed
        }
    }
    
    // Method to sign in a registered user with an email address and password
    // This method allows signing in a registered user with an email address and password.
    // The login credentials are verified with Firebase Authentication, and upon successful login,
    // the user is authenticated as a signed-in user within the app.
    // If an error occurs, an error message is printed to the console.
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("An error occurred: \(error)")
                return
            }
            // Handle successful login if needed
        }
    }
    
    // Method to sign out a signed-in user
    // This method allows a signed-in user to sign out from Firebase Authentication.
    // If an error occurs, an error message is printed to the console.
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("An error occurred: \(error)")
        }
        // Handle successful sign-out if needed
    }
}
