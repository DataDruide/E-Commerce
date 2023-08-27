import SwiftUI

struct SearchHeaderView: View {
   
    @Binding var searchText: String
    @Binding var isSearching: Bool
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color: Color(red: 0.38, green: 0.19, blue: 0.43), location: 0.00),
                Gradient.Stop(color: Color(red: 0.39, green: 0.17, blue: 0.45), location: 0.87),
            ]), startPoint: .top, endPoint: .bottom)
            .frame(height: 500) // Höhe des lila farbigen Bereichs
            .ignoresSafeArea(edges: .top) // Den Farbverlauf über den sicheren Bereich ausdehnen

            
            VStack(spacing: 0) {
                Text("Willkommen")
                    .font(.custom("Poppins-Bold", size: 32)) // Verwende deine gewünschte Schriftart
                    .foregroundColor(.white)
                    .padding()
                
                HStack {
                    Spacer()
                    TextField("Suche...", text: $searchText)
                        .padding()
                        .padding(.leading, 30) // Angepasstes Padding hier
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .padding(.leading, 10)
                                Spacer()
                                if isSearching {
                                    Button(action: {
                                        searchText = ""
                                        isSearching = false
                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                    }) {
                                        Text("Abbrechen")
                                            .foregroundColor(.black)
                                            .padding(.trailing, 10)
                                    }
                                }
                            }
                        )
                        .onTapGesture {
                            isSearching = true
                        }
                    
                }
                .padding(.horizontal)
                .padding(.all) // Angepasstes Padding hier
            }
            .cornerRadius(50)
            .background(
              EllipticalGradient(
                stops: [
                  Gradient.Stop(color: Color(red: 0.78, green: 0.26, blue: 0.43), location: 0.00),
                  Gradient.Stop(color: Color(red: 0.39, green: 0.17, blue: 0.45), location: 0.87),
                ],
                center: UnitPoint(x: 0.5, y: 0.5)
              )
            )
        }
    }
}
