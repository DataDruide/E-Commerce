
import SwiftUI

struct NotificationView: View {
    
    @State private var isFilterViewPresented = false

    struct NotificationItem: Identifiable {
        let id = UUID()
        let title: String
        let message: String
    }
    
    let notifications: [NotificationItem] = [
        NotificationItem(title: "New Product Added", message: "A new product has been added."),
        NotificationItem(title: "Your Order is Being Processed", message: "Your order is currently being processed."),
        NotificationItem(title: "Your Order Has Shipped", message: "Your ordered products are on their way to you."),
        NotificationItem(title: "Shipping Confirmation", message: "Your order has been shipped."),
        NotificationItem(title: "VIP Status Achieved", message: "Congratulations! You have achieved VIP status and are entitled to exclusive benefits."),
        NotificationItem(title: "Special Offer", message: "Special offer: 20% discount on selected items.")
        // Additional notifications...
    ]


    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                
                Spacer()
                HStack {
                    Spacer() // Pushes the filter button to the right
                    Button(action: {
                                        isFilterViewPresented.toggle()
                                    }) {
                                        Image(systemName: "slider.vertical.3")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.black)
                                    }
                                    .frame(width: 30, height: 30)
                                    .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                                    .cornerRadius(15)
                                    .padding()
                                    .padding(.trailing, 19)
                                    .padding(.top, 15)
                                    .sheet(isPresented: $isFilterViewPresented) {
                                        FilterView()
                                    }
                }
                
                Spacer() // Spacer to push content to the bottom
                
                // Benachrichtigungsliste
                            Section(header: Text("Benachrichtigungen")) {
                                List(notifications) { notification in
                                    VStack(spacing: 5) {
                                        Text(notification.title)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                        
                                        Text(notification.message)
                                            .padding(.vertical, 5)
                                            .multilineTextAlignment(.center)
                                        
                                        Image(systemName: "bell")
                                            .font(.largeTitle)
                                            .foregroundColor(Color(red: 0.4, green: 0.03, blue: 0.37))
                                    }
                                    .frame(width: 330)
                                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                    .cornerRadius(5)
                                    .padding(.bottom, 17)
                                }
                            }
                
                Section(header: Text("YOUR WAY TO CONTACT US")) {
                    NavigationLink(destination: CallCenterView()) {
                        Text("Kontaktieren Sie den Support")
                            .foregroundColor(Color.black)
                    }
                    NavigationLink(destination: FAQView()) {
                        Text("Häufig gestellte Fragen")
                            .foregroundColor(Color.black)

                    }
                }
            }
            .frame(width: 360, height: 800)
            .background(.white)
            .cornerRadius(20)
            .padding(.horizontal, 20)
            .navigationBarHidden(true) // Hide the navigation bar
        }
    }
}

import SwiftUI


import SwiftUI

struct FAQView: View {
    @State private var searchQuery = ""
    @ObservedObject private var viewModel = FAQViewModel()
    @State private var isSheetPresented = false

    var body: some View {
        VStack(spacing: 0) {
            // Header mit aktueller View-Bezeichnung
            VStack {
                Text("Häufig gestellte Fragen")
                    .font(.title)
                Text("FAQ View")
                    .font(.subheadline)
                Divider().background(Color.gray).frame(height: 2)
                Text("Hier findest du Antworten auf häufig gestellte Fragen.")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .padding()

            // Suchleiste
            SearchBarView(text: $searchQuery)

            // Abschnitte mit Fragen und Antworten
            List {
                ForEach(viewModel.filteredQuestions(searchQuery)) { section in
                    Section(header: Text(section.title)) {
                        ForEach(section.questions) { question in
                            FAQRowView(question: question)
                        }
                    }
                }
            }
        }
        .navigationBarItems(trailing:
                    Button(action: {
                        isSheetPresented.toggle()
                    }) {
                        Image(systemName: "arrow.up.right.circle")
                            .font(.system(size: 24))
                            .foregroundColor(Color(red: 0.4, green: 0.03, blue: 0.37))

                    }
                    .sheet(isPresented: $isSheetPresented) {
                        SpecialRequestView(isSheetPresented: $isSheetPresented)
                    }
                    .padding(.top, 10) // Abstand nach oben hinzufügen
                    .padding(.trailing, 10) // Abstand nach rechts hinzufügen
                )
    }
}

struct FAQRowView: View {
    var question: FAQQuestion
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(question.question)
                .font(.headline)
            Text(question.answer)
                .foregroundColor(.gray)
                .font(.body)
        }
        .padding(.vertical, 8)
    }
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}





struct SearchBarView: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Suche nach Fragen", text: $text)
                .font(.body)
                .foregroundColor(.primary)
        }
        .padding(.horizontal)
        .background(Color.secondary.opacity(0.1))
        .cornerRadius(10)
        .padding()
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}


struct SpecialRequestView: View {
    @Binding var isSheetPresented: Bool
    @State private var question = ""
    @State private var requestSent = false
    @State private var remainingCharacters = 1000

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Spezielle Frage anfragen")) {
                    TextEditor(text: $question)
                        .frame(height: 200) // Höhe des Eingabefelds anpassen
                        .overlay(
                            Text("\(remainingCharacters) Zeichen übrig")
                                .foregroundColor(remainingCharacters < 0 ? .red : .secondary)
                                .font(.caption)
                                .padding(.trailing, 8),
                            alignment: .bottomTrailing
                        )
                }
                Section {
                    Button(action: {
                        requestSent = true
                    }) {
                        Text("Anfrage senden")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                            .cornerRadius(10)
                    }
                    .disabled(question.isEmpty || requestSent || remainingCharacters < 0)
                    .opacity((requestSent || remainingCharacters < 0) ? 0.5 : 1)
                }
            }
            .onChange(of: question) { newValue in
                let remaining = 1000 - newValue.count
                remainingCharacters = max(remaining, 0)
            }
            .navigationTitle("Spezielle Anfrage")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Schließen") {
                        isSheetPresented = false
                    }
                }
            }
        }
    }
}




