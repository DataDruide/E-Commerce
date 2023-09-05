

import SwiftUI

struct CategoryProductView: View {
    @State private var selectedCategory = "Men's Clothing"
    @State private var isSheetPresented = false // Zustand für das Sheet
    @State private var isVideoSheetPresented = false // Zustand für das Sheet
    
    var body: some View {
        NavigationView {
  
                VStack {
                    Picker("Category", selection: $selectedCategory) {
                        Text("Men's Clothing").tag("Men's Clothing")
                        Text("Women's Clothing").tag("Women's Clothing")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    if selectedCategory == "Men's Clothing" {
                        MenClothingView()
                    } else {
                        WomanClothingView()
                    }
                    
                    
                }
                .navigationBarTitle(selectedCategory)
            }
    }
}
    
