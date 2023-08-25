
import SwiftUI

struct RecentlyCategoryShowPage: View {
    @State private var selectedCategory: String? = nil
    
    var body: some View {
        VStack {
            
            RecentlyCategoryShowShape()
            
            ScrollView {
                VStack(spacing: 20) {
                    CategoryRow(title: "Clothings", imageName: "categoryimagemen-01")
                    CategoryRow(title: "Trousers", imageName: "categoryimagemen-02")
                    CategoryRow(title: "Jeans", imageName: "categoryimagemen-03")
                    CategoryRow(title: "Dresses", imageName: "categoryimagemen-04")
                    CategoryRow(title: "Shoes", imageName: "categoryimagemen-04")
                }
                .padding()
            }
            
            // Unterer Navigationsbereich fixiert am unteren Ende
            HStack(alignment: .center, spacing: 45) {
                NavigationLink(destination: Text("Category")) {
                    Image(systemName: "house")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color(red: 0.4, green: 0.03, blue: 0.37))
                }
                .tag(0)
                
                NavigationLink(destination: Text("Search")) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color(red: 0.4, green: 0.03, blue: 0.37))
                }
                .tag(1)
                
                NavigationLink(destination: Text("Profile")) {
                    ZStack {
                        Image(systemName: "person")
                            .frame(width: 60, height: 60)
                            .background(Color.white)
                            .cornerRadius(30)
                            .shadow(color: Color(red: 0.63, green: 0.14, blue: 0.59), radius: 1, x: 0, y: 5)
                    }
                    .frame(width: 60, height: 60)
                }
                .tag(2)
                
                NavigationLink(destination: Text("Favorites")) {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color(red: 0.4, green: 0.03, blue: 0.37))
                }
                .tag(3)
                
                NavigationLink(destination: Text("Profile")) {
                    Image(systemName: "book")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color(red: 0.4, green: 0.03, blue: 0.37))
                }
                .tag(4)
            }
            .padding(0)
            .frame(width: 360, height: 66)
            .background(Color.white)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(red: 0.4, green: 0.03, blue: 0.37).opacity(0.5), lineWidth: 0.5)
            )
            .padding(.top, 20) // Von .bottom auf .top geändert
        }
    }
}


import SwiftUI

struct RecentlyCategoryShowPage_Previews: PreviewProvider {
    static var previews: some View {
        RecentlyCategoryShowPage()
            .previewDevice("iPhone 12")
    }
}
