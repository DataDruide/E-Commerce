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
                            .font(Font.custom("Sedgwick Ave Display", size: 34))
                            .kerning(0.25)                            .fontWeight(.bold)
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
                        .font(Font.custom("Sedgwick Ave Display", size: 28))
                        .kerning(0.25)                        .fontWeight(.bold)
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
