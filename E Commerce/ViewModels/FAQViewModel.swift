
import SwiftUI


@MainActor
class FAQViewModel: ObservableObject {
    @Published var sections: [FAQSection] = [
        FAQSection(title: "Account und Anmeldung", questions: [
            FAQQuestion(question: "Wie erstelle ich ein Konto?", answer: "Um ein Konto zu erstellen, klicken Sie auf die Schaltfläche 'Registrieren' und geben Sie Ihre Informationen ein."),
            FAQQuestion(question: "Wie melde ich mich ab?", answer: "Klicken Sie auf Ihr Profilbild und wählen Sie 'Abmelden'."),
            FAQQuestion(question: "Ich habe mein Passwort vergessen. Was soll ich tun?", answer: "Klicken Sie auf 'Passwort vergessen' auf der Anmeldeseite und folgen Sie den Anweisungen, um Ihr Passwort zurückzusetzen.")
        ]),
        FAQSection(title: "Beiträge und Kommentare", questions: [
            FAQQuestion(question: "Wie poste ich einen neuen Beitrag?", answer: "Klicken Sie auf die Schaltfläche 'Neuer Beitrag' und geben Sie Ihren Text, Bilder oder Links ein."),
            FAQQuestion(question: "Kann ich meinen Beitrag nachträglich bearbeiten?", answer: "Ja, Sie können Ihre Beiträge bearbeiten. Klicken Sie auf den Beitrag und wählen Sie 'Bearbeiten'."),
            FAQQuestion(question: "Warum sehe ich meine Kommentare nicht?", answer: "Ihre Kommentare werden möglicherweise moderiert oder müssen von einem Administrator genehmigt werden, bevor sie angezeigt werden.")
        ]),
        FAQSection(title: "Privatsphäre und Sicherheit", questions: [
            FAQQuestion(question: "Wie kann ich mein Profil privat machen?", answer: "Gehen Sie zu den Datenschutzeinstellungen und aktivieren Sie die Option 'Profil privat'."),
            FAQQuestion(question: "Wie blockiere ich einen anderen Benutzer?", answer: "Gehen Sie zum Profil des Benutzers und klicken Sie auf 'Blockieren'."),
            FAQQuestion(question: "Sind meine Daten sicher?", answer: "Ja, wir verwenden moderne Verschlüsselungstechnologien, um Ihre Daten zu schützen.")
        ])
    ]

    func filteredQuestions(_ searchQuery: String) -> [FAQSection] {
        if searchQuery.isEmpty {
            return sections
        } else {
            return sections.map { section in
                let filteredQuestions = section.questions.filter { question in
                    question.question.localizedCaseInsensitiveContains(searchQuery)
                }
                return FAQSection(title: section.title, questions: filteredQuestions)
            }.filter { section in
                !section.questions.isEmpty
            }
        }
    }
}

