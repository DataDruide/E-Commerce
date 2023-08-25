import SwiftUI

struct CategoryPage: View {
    @State private var selectedCategory: String? = nil
    
    var body: some View {
        VStack {
            CategoryHeaderShape(title: "Categories") // Replace with actual title
            CategorySearchBarShape()
            
            // Scrollview unterhalb der NavigationTabs
            VStack {
                ScrollView {
                    VStack(spacing: 20) {
                        HStack {
                            Button(action: {
                                selectedCategory = "Women's Fashion"
                            }) {
                                Text("Women's Fashion")
                                    .padding()
                                    .background(Color.gray.opacity(0.01))
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                            }
                            
                            Button(action: {
                                selectedCategory = "Men's Fashion"
                            }) {
                                Text("Men's Fashion")
                                    .padding()
                                    .background(Color.gray.opacity(0.01))
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                            }
                        }
                        
                        if let selectedCategory = selectedCategory {
                            Section(header: CategoryHeaderShape(title: selectedCategory)) {
                                switch selectedCategory {
                                case "Women's Fashion":
                                    WomenFashionContentView()
                                case "Men's Fashion":
                                    MenFashionContentView()
                                default:
                                    EmptyView()
                                }
                            }
                        } else {
                            // Overlay for no selected category
                            Rectangle()
                                .foregroundColor(Color.white)
                                .cornerRadius(40)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color.black, lineWidth: 1) // Stroke
                                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10) // Shadow
                                )
                                .blur(radius: 10) // Blur effect
                                .frame(width: 360, height: 700)
                                .padding()
                        }
                    }
                    .padding()
                }
                
                //                // Unterer Navigationsbereich fixiert am unteren Ende
                //                HStack(alignment: .center, spacing: 45) {
                //                    NavigationLink(destination: Text("Category")) {
                //                        Image(systemName: "house")
                //                            .resizable()
                //                            .frame(width: 24, height: 24)
                //                            .foregroundColor(Color(red: 0.4, green: 0.03, blue: 0.37))
                //                    }
                //                    .tag(0)
                //
                //                    NavigationLink(destination: Text("Search")) {
                //                        Image(systemName: "magnifyingglass")
                //                            .resizable()
                //                            .frame(width: 24, height: 24)
                //                            .foregroundColor(Color(red: 0.4, green: 0.03, blue: 0.37))
                //                    }
                //                    .tag(1)
                //
                //                    NavigationLink(destination: Text("Profile")) {
                //                        ZStack {
                //                            Image(systemName: "person")
                //                                .frame(width: 60, height: 60)
                //                                .background(Color.white)
                //                                .cornerRadius(30)
                //                                .shadow(color: Color(red: 0.63, green: 0.14, blue: 0.59), radius: 1, x: 0, y: 5)
                //                        }
                //                        .frame(width: 60, height: 60)
                //                    }
                //                    .tag(2)
                //
                //                    NavigationLink(destination: Text("Favorites")) {
                //                        Image(systemName: "heart")
                //                            .resizable()
                //                            .frame(width: 24, height: 24)
                //                            .foregroundColor(Color(red: 0.4, green: 0.03, blue: 0.37))
                //                    }
                //                    .tag(3)
                //
                //                    NavigationLink(destination: Text("Profile")) {
                //                        Image(systemName: "book")
                //                            .resizable()
                //                            .frame(width: 24, height: 24)
                //                            .foregroundColor(Color(red: 0.4, green: 0.03, blue: 0.37))
                //                    }
                //                    .tag(4)
                //                }
                //                .padding(0)
                //                .frame(width: 360, height: 66)
                //                .background(Color.white)
                //                .cornerRadius(20)
                //                .overlay(
                //                    RoundedRectangle(cornerRadius: 20)
                //                        .stroke(Color(red: 0.4, green: 0.03, blue: 0.37).opacity(0.5), lineWidth: 0.5)
                //                )
                //                .padding(.top, 20) // Von .bottom auf .top geändert
                //            }
            }
            .background(Color.white)
        }
    }
}
struct CategoryPage_Previews: PreviewProvider {
    static var previews: some View {
        CategoryPage()
    }
}


