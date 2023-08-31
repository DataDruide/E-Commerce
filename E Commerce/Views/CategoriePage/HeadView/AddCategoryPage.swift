import SwiftUI


struct AddCategoryPage: View {
    
    @State private var isSheetPresented = false // Zustand für das Sheet
    @State private var isVideoSheetPresented = false // Zustand für das Sheet
    
  @State var videos : [Video] = Bundle.main.decode("videos.json") // Hier machen wir uns die Videos zugänglich
        var body: some View {
        NavigationView {
            ZStack {
                Image("Case") // BackroundImage
                    .resizable()
                    .scaledToFill()
                    .overlay(Rectangle())
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(.black.opacity(0.55))
                    .contrast(0.6)
                    .offset(x: 20)
                    .opacity(0.12)
                
                VStack {
                    // Header with centered text
                    HStack {
                        Spacer()
                        Text("TO THE PRODUCTS")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        Spacer()
                    }
                    .padding()
                    
                    Image("illustration") // SVG Illustration
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        .padding()
                    
                    Text("WELCOME TO WARDROBE!") // TitleText
                        .font(.title)
                        .fontWeight(.bold)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        .padding(.bottom, 20)
                    Spacer()
                    Button(action: {
                        isSheetPresented.toggle() // Ändert den Zustand des Sheets
                    }) {
                        Text("PRODUKTE")
                            .font(.headline)
                            .frame(width: 200, height: 50)
                            .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                    .sheet(isPresented: $isSheetPresented) {
                        ProductView() // Zeigt das Sheet mit der ProductView an
                    }
                    
                    Button(action: {
                        isVideoSheetPresented.toggle() // Ändert den Zustand des Sheets
                    }) {
                        Text("VIDEOS")
                            .font(.headline)
                            .frame(width: 200, height: 50)
                            .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                    .sheet(isPresented: $isVideoSheetPresented) {
                        VideoListItem(video: Video(id: "onlineshopping", name: "Onlineshopping", headline: "A real Shopping Adventuere"))
                    }
                }
                .padding()
                    
                    Spacer() // Add some spacing to separate the buttons from the footer
                    
                    // Footer
                    FooterView()
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
    
    // Trash
    
//    Button(action: {
//        isWomenCategoryPresented = true
//    }) {
//        Text("Damen")
//            .font(.headline)
//            .frame(width: 200, height: 50)
//            .background(Color(red: 0.4, green: 0.03, blue: 0.37))
//            .overlay(
//                Rectangle()
//                    .stroke(.white, lineWidth: 2)
//            )
//            .foregroundColor(.white)
//            .cornerRadius(10)
//    }
//    .sheet(isPresented: $isWomenCategoryPresented) {
//        CategoryView(category: .women)
//    }
//
//    Button(action: {
//        isMenCategoryPresented = true
//    }) {
//        Text("Herren")
//            .font(.headline)
//            .frame(width: 200, height: 50)
//            .background(Color(red: 0.4, green: 0.03, blue: 0.37))
//            .overlay(
//                Rectangle()
//                    .stroke(.white, lineWidth: 2)
//            )
//            .foregroundColor(.white)
//            .cornerRadius(10)
//    }
//    .sheet(isPresented: $isMenCategoryPresented) {
//        CategoryView(category: .men)
//    }
//}
