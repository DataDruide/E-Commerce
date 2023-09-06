import SwiftUI
import FirebaseCore

// AppDelegate ist eine Klasse, die Funktionen zum Behandeln von Lebenszyklusereignissen der App bereitstellt.
class AppDelegate: NSObject, UIApplicationDelegate {
    
    // Diese Methode wird aufgerufen, wenn die App gestartet wird.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Konfiguriere Firebase. Dies sollte vor der Verwendung von Firebase-Diensten erfolgen.
        FirebaseApp.configure()
        return true
    }
}

@main
struct AppStorageAppApp: App {
    
    // Umgebungseigenschaft, die den AuthService enthält. Dadurch kann der AuthService in der gesamten App verwendet werden.
    @EnvironmentObject var authService: AuthService
    
    // Verwende das @UIApplicationDelegateAdaptor-Attribut, um die AppDelegate-Klasse zu registrieren.
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            NavigationView {
                // Hier wird die Ansicht definiert, die beim Start der App angezeigt wird.
                // In diesem Fall ist es die SplashView, die den AuthService über die Umgebung erhält.
                SplashView()
                    .environmentObject(AuthService())
            }
        }
    }
}
