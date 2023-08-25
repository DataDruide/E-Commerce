import SwiftUI
struct WomenFashionContentView: View {
    @State private var isItemDetailsPresented = false
    
    var body: some View {
        VStack {
            ItemRowView(imageName: "categoryimage-01", itemName: "Clothings")
                .onTapGesture {
                    isItemDetailsPresented = true
                }
            
            ItemRowView(imageName: "categoryimage-02", itemName: "Trousers")
                .onTapGesture {
                    isItemDetailsPresented = true
                }
            
            
            ItemRowView(imageName: "categoryimage-03", itemName: "Shoes")
                .onTapGesture {
                    isItemDetailsPresented = true
                }
            
            
            ItemRowView(imageName: "categoryimage-04", itemName: "Dresses")
                .onTapGesture {
                    isItemDetailsPresented = true
                }
            
            
            ItemRowView(imageName: "categoryimage-04", itemName: "Chillout Pannies")
                .onTapGesture {
                    isItemDetailsPresented = true
                }
            
            // Add more similar ItemRowViews here for the other items
        }
        .sheet(isPresented: $isItemDetailsPresented) {
            ItemDetailsView()
        }
    }
}
