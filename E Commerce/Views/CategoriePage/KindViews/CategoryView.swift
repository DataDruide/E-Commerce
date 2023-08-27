//import SwiftUI
//
//struct CategoryView: View {
//    let category: Category
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 16)], spacing: 16) {
//                    ForEach(getItemsForCategory(), id: \.self) { item in
//                        NavigationLink(destination: getDetailViewForItem(itemName: item)) {
//                            CategoryItemView(itemName: item)
//                        }
//                    }
//                }
//                .padding()
//            }
//            .navigationTitle("\(category == .women ? "Damen" : "Herren") Kategorie")
//        }
//    }
//
//    private func getItemsForCategory() -> [String] {
//        switch category {
//        case .women:
//            return ["Clothing", "Trousers", "Shoes", "Dresses"]
//        case .men:
//            return ["Clothing", "Trousers", "Shoes", "TShirts", "Jackets"]
//        }
//    }
//
//    private func getDetailViewForItem(itemName: String) -> AnyView {
//        if category == .men && itemName == "Trousers" {
//            return AnyView(TrousersView())
//        } else {
//            return AnyView(EmptyView())
//        }
//    }
//}
