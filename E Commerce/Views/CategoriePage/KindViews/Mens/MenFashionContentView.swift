
// MenFashionContentView.swift
import SwiftUI
struct MenFashionContentView: View {
    @State private var isItemDetailsPresented = false
    
    var body: some View {
        VStack {
            ItemRowView(imageName: "categoryimagemen-01", itemName: "Clothings")
                .onTapGesture {
                    isItemDetailsPresented = true
                }
            
            ItemRowView(imageName: "categoryimagemen-02", itemName: "Trousers")
                .onTapGesture {
                    isItemDetailsPresented = true
                }
            
            
            ItemRowView(imageName: "categoryimagemen-03", itemName: "Shoes")
                .onTapGesture {
                    isItemDetailsPresented = true
                }
            
            
            ItemRowView(imageName: "categoryimagemen-04", itemName: "TShirts")
                .onTapGesture {
                    isItemDetailsPresented = true
                }
            
            
            ItemRowView(imageName: "categoryimagemen-04", itemName: "Jeans Jackets")
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
