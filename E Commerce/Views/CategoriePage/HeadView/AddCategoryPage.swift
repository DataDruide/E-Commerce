import SwiftUI

import SwiftUI

struct AddCategoryPage: View {
    // Zustand für das Sheet für Produkte
    @State private var isSheetPresented = false
    
    // Zustand für das Sheet für Videos
    @State private var isVideoSheetPresented = false
    
    // Zustand für das Sheet für alle Produkte
    @State private var isCategorySheetPresented = false
    
    // Hier machen wir uns die Videos zugänglich
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    var body: some View {
        NavigationView {
            ZStack {
                // Hintergrundbild
                Image("Case")
                    .resizable()
                    .scaledToFill()
                    .overlay(Rectangle())
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(.black.opacity(0.55))
                    .contrast(0.6)
                    .offset(x: 20)
                    .opacity(0.12)
                
                VStack {
                    // Header mit zentriertem Text
                    HStack {
                        Spacer()
                        Text("TO THE PRODUCTS")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        Spacer()
                    }
                    .padding()
                    
                    // SVG Illustration
                    Image("illustration")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        .padding()
                    
                    // Titeltext
                    Text("WELCOME TO WARDROBE!")
                        .font(.title)
                        .fontWeight(.bold)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        .padding(.bottom, 20)
                    
                    Spacer()
                    
                    // Button zum Anzeigen der Produkte
                    Button(action: {
                        isSheetPresented.toggle()
                    }) {
                        Text("ALL PRODUCTS")
                            .font(.headline)
                            .frame(width: 200, height: 50)
                            .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                    .sheet(isPresented: $isSheetPresented) {
                        // Hier können Sie den Inhalt für das Produkt-Sheet hinzufügen
                        ProductView()
                    }
                    
                    Spacer()
                    
                    // Button zum Anzeigen der Videos
                    Button(action: {
                        isVideoSheetPresented.toggle()
                    }) {
                        Text("VIDEOS")
                            .font(.headline)
                            .frame(width: 200, height: 50)
                            .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                    .sheet(isPresented: $isVideoSheetPresented) {
                        // Hier können Sie den Inhalt für das Video-Sheet hinzufügen
                        VideoListItem(video: Video(id: "onlineshopping", name: "Onlineshopping", headline: "A real Shopping Adventure"))
                    }
                    
                    Spacer()
                    
                    // Button zum Anzeigen aller Produkte
                    Button(action: {
                        isCategorySheetPresented.toggle()
                    }) {
                        Text("CLOTHES")
                            .font(.headline)
                            .frame(width: 200, height: 50)
                            .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                    .sheet(isPresented: $isCategorySheetPresented) {
                        // Hier können Sie den Inhalt für das Sheet mit allen Produkten hinzufügen
                        CategoryProductView()
                    }
                    
                    Spacer()
                    
                   
                }
            }
        }
    }
}


struct FooterView: View {
    var body: some View {
        Text("Copyright © 2023 ProductInfoCenter. All rights reserved.")
            .font(.footnote)
            .foregroundColor(.gray)
            .padding()
    }
}


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
    

import SwiftUI

struct MenClothingView: View {
    @ObservedObject var viewModel = MensViewModel()

    var body: some View {
        List(viewModel.products) { product in
            VStack(alignment: .center) {
                URLImage(URL(string: product.image)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 200)
                }
                Text(product.title)
                    .font(.headline)
                Text("Price: $\(product.price)")
                Text("Category: \(product.category)")
                Text(product.description)
            }
        }
        .navigationTitle("Men's Clothing")
    }
}



import SwiftUI
import URLImage

struct WomanClothingView: View {
    @ObservedObject var viewModel = WomanClothingViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.products) { product in
                VStack(alignment: .center) {
                    URLImage(URL(string: product.image)!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 200)
                    }
                    Text(product.title)
                        .font(.headline)
                    Text("Price: $\(product.price)")
                    Text("Category: \(product.category)")
                    Text(product.description)
                }
            }
            .navigationTitle("Women's Clothing Products")
        }
    }
}


import Foundation

class WomanClothingViewModel: ObservableObject {
    @Published var products: [Product] = []

    init() {
        fetchWomanClothingProducts()
    }

    func fetchWomanClothingProducts() {
        if let urlString = "https://fakestoreapi.com/products/category/women's clothing".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode([Product].self, from: data)
                        DispatchQueue.main.async {
                            self.products = decodedData
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }.resume()
        }
    }
}


class MensViewModel: ObservableObject {
    @Published var products: [Product] = []

    init() {
        fetchProducts()
    }

    func fetchProducts() {
        if let urlString = "https://fakestoreapi.com/products/category/men's clothing".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode([Product].self, from: data)
                        DispatchQueue.main.async {
                            self.products = decodedData
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }.resume()
        }
    }


}
