import SwiftUI

struct CallCenterView: View {
    @State private var callerName: String = ""
    @State private var showDropdownMenu = false
    @StateObject private var viewModel = CallCenterViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    Color.white.edgesIgnoringSafeArea(.all)

                    VStack(alignment: .center, spacing: 8) {
                        CallCenterHeaderShape()
                        Spacer()

                        Text("SUPPORT\nCENTER")
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .padding()

                        Text("Telefonische Kontakt\nAufnahme")
                            .font(.callout)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                            .padding()

                        CallCenterImage()
                        CallCenterListView()

                        CallerInputView(callerName: $callerName, viewModel: viewModel)
                        CallListView(viewModel: viewModel)
                    }
                    .padding(.bottom, 70)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct CallerInputView: View {
    @Binding var callerName: String
    @ObservedObject var viewModel: CallCenterViewModel
    
    var body: some View {
        // Textfeld für den Anrufername
        TextField("Name des Anrufers", text: $callerName)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal)

        // Button zum Starten des Anrufs
        Button(action: {
            viewModel.startCall(withName: callerName)
            callerName = ""
        }) {
            Text("Anruf starten")
                .foregroundColor(.white)
                .padding()
                .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                .cornerRadius(10)
        }
        .padding()
    }
}

struct CallListView: View {
    @ObservedObject var viewModel: CallCenterViewModel
    
    var body: some View {
        ForEach(viewModel.calls) { call in
            VStack {
                // Anrufername
                Text(call.callerName)
                    .font(.headline)
                // Anrufstatus (Ongoing/Ended)
                Text(call.isOngoing ? "Ongoing" : "Ended")
                    .foregroundColor(call.isOngoing ? .green : .red)
                if call.isOngoing {
                    // Button zum Beenden des Anrufs
                    Button(action: {
                        viewModel.endCall(call)
                    }) {
                        Text("Anruf beenden")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.vertical, 4)
        }
    }
}

struct CallCenterImage: View {
    var body: some View {
        // Bild für das Call Center
        Image("ich")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 177, height: 177)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(200)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
            .padding()
    }
}

struct CallCenterView_Previews: PreviewProvider {
    static var previews: some View {
        CallCenterView()
    }
}

struct Call: Identifiable {
    let id = UUID()
    let callerName: String
    var isOngoing: Bool
}

class CallCenterViewModel: ObservableObject {
    @Published var calls: [Call] = []

    func startCall(withName callerName: String) {
        let newCall = Call(callerName: callerName, isOngoing: true)
        calls.append(newCall)
    }

    func endCall(_ call: Call) {
        if let index = calls.firstIndex(where: { $0.id == call.id }) {
            calls[index].isOngoing = false
        }
    }
}


import SwiftUI

struct CallCenterHeaderShape: View {
    @State private var showDropdownMenu = false
    
    var body: some View {
        ZStack {
            Color(red: 0.4, green: 0.03, blue: 0.37)
                .frame(height: 120)
            
            HStack {
                Button(action: {
                    showDropdownMenu.toggle()
                }) {
                    Image(systemName: "line.horizontal.3")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .padding(.leading)
                .popover(isPresented: $showDropdownMenu, arrowEdge: .trailing) {
                    DropdownMenu()
                }

                Spacer()

                Text("CallCenter")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Spacer()

                Button(action: {
                    // Aktion für die Glocke-Taste
                }) {
                    Image(systemName: "bell")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .padding(.trailing)
            }
            .padding(.vertical)
        }
    }
}

struct DropdownMenu: View {
    var body: some View {
        VStack {
            Button(action: {
                // Aktion für den Dropdown-Menü-Eintrag
            }) {
                Text("Kontaktieren")
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 20)
            }
            
            Button(action: {
                // Aktion für den Dropdown-Menü-Eintrag
            }) {
                Text("Hilfe")
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 20)
            }
            
            // Weitere Dropdown-Menü-Einträge hinzufügen
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding()
    }
}

struct CallCenterHeaderShape_Previews: PreviewProvider {
    static var previews: some View {
        CallCenterHeaderShape()
            .previewLayout(.sizeThatFits)
    }
}


import SwiftUI

struct CallCenterListView: View {
    var employees: [Employee] = [
        Employee(name: "Max Mustermann", phoneNumber: "123-456-7890"),
        Employee(name: "Anna Müller", phoneNumber: "987-654-3210"),
        // Weitere Mitarbeiter hinzufügen
    ]
    
    var body: some View {
        List(employees) { employee in
            VStack(alignment: .leading) {
                Text(employee.name)
                    .font(.headline)
                Text(employee.phoneNumber)
                    .font(.subheadline)
            }
        }
        .navigationTitle("Mitarbeiterliste")
    }
}

struct Employee: Identifiable {
    let id = UUID()
    let name: String
    let phoneNumber: String
}

struct CallCenterListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CallCenterListView()
        }
    }
}
