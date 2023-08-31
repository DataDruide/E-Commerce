import SwiftUI

struct HomeView: View {
    @State private var isAddCategoriePageShowing = false
    @State private var isCellCenterViewShowing = false
    @State private var isPresentingSearchView = false
    @State private var isPresentingCreateProfileView = false
    @State private var isPresentingNotificationView = false
    @State private var isPresentingSettingView = false
    @State private var isPresentingHomeView = false
    @State private var isPresentingAddCategoryPage = false
    @State private var isPresentingTrackingOrderView = false

    @State private var elapsedTime: TimeInterval = 0
       let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
       
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Zuerst die obere ZStack mit Order-Tracking-Informationen
                    ZStack {
                        Image("illustration-01")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 166, height: 130)
                            .cornerRadius(8)
                        
                        VStack {
                            Group {
                                Text("ORDER 9650960549:")
                                    .font(.custom("Montserrat", size: 18).weight(.medium))
                                    .foregroundColor(.black)
                                
                                Text(timeString(time: elapsedTime))
                                    .font(.custom("Montserrat", size: 18).weight(.medium))
                                    .foregroundColor(.black)
                                    .onReceive(timer) { _ in
                                        elapsedTime += 1
                                    }
                            }
                        }
                        .frame(width: 190, height: 70)
                        .background(Color.gray).opacity(0.62)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 1)
                        )
                        
                        VStack {
                            Spacer()

                            Button(action: {
                                // Handle button action to toggle the sheet
                                isPresentingTrackingOrderView.toggle()
                            }) {
                                Text("SEE DETAILS")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(width: 200)
                                    .padding(.vertical, 16)
                                    .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                                    .cornerRadius(20)
                                    .blur(radius: 0.5)
                                    .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                            }
                            .offset(y: 2) // Adjust the offset as needed
                            .padding()
                        }
                        .sheet(isPresented: $isPresentingTrackingOrderView) {
                            TrackingOrderView()
                        }


                    }
                    .frame(width: 320, height: 160)
                    .background(Color(red: 0.11, green: 0.11, blue: 0.11))
                    .cornerRadius(8)
                    
                    // HStack mit den ersten beiden SetCards
                    HStack(spacing: 20) {
                        // Erste SetCard
                        ZStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Shop Our range of summer wears")
                                    .font(Font.custom("Montserrat", size: 12).weight(.medium).italic())
                                    .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                    .frame(width: 73, height: 76, alignment: .topLeading)
                                    .offset(x: -20, y: 30)
                                
                                Spacer()
                            }
                            .padding(.leading, 10) // Adjust the left padding as needed
                            
                            
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 80, height: 114)
                                .background(
                                    Image("setcard-01")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 80, height: 114)
                                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
                                        .clipped()
                                        .offset(x: 30, y: 15)
                                )
                        }
                        .frame(width: 152, height: 148)
                        .background(Color(red: 0.89, green: 0.9, blue: 0.13))
                        .cornerRadius(5)
                        
                        // Zweite SetCard
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 152, height: 148)
                                .background(
                                    Image("setcard-02")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 152, height: 148)
                                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
                                        .clipped()
                                )
                                .cornerRadius(5)
                            
                            Text("10% off Your favorite sneakers!")
                                .font(
                                    Font.custom("Montserrat", size: 15)
                                        .weight(.medium)
                                        .italic()
                                )
                                .kerning(0.15)
                                .foregroundColor(.white)
                                .frame(width: 78, height: 71, alignment: .topLeading)
                                .offset(x: 40, y: 25)
                            
                        }
                    }
                    .padding(.horizontal, 20) // Adjust horizontal padding
                    .padding(.bottom, 20) // Adjust bottom padding
                    
                    // "Recently Browsed" Abschnitt mit HStack
                    // body
                    // subtitle
                    Text("ONGOING SALES")
                        .offset(x: -105, y: 20)
                      .font(
                        Font.custom("Sedgwick Ave Display", size: 17)
                          .weight(.medium)

                      )
                      .foregroundColor(.black)

                    HStack(alignment: .center, spacing: 10) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 73, height: 86)
                            .background(
                                Image("setcard-03")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 73, height: 86)
                                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
                                    .clipped()
                            )
                        
                        // Caption für die erste Karte
                        Text("FASHIONNOVA SUNDRESS\n$65")
                            .font(Font.custom("Montserrat", size: 13))
                            .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                            .frame(width: 87, height: 35, alignment: .topLeading)
                        
                        // ... (weitere Elemente für die erste Karte)
                        
                        // Zweite Karte
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 73, height: 86)
                            .background(
                                Image("setcard-04")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 73, height: 86)
                                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
                                    .clipped()
                            )
                        
                        Text("GREEN VELVET DRESS $65")
                            .font(Font.custom("Nunito Sans", size: 13))
                            .kerning(0.4)
                            .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                            .frame(width: 87, height: 52, alignment: .topLeading)
                    }
                    .padding(5)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(10)
                    .offset(x:15)
                    
                    
                    // "Recommended Collection" Abschnitt
                    Text("OUR PROMOTIONS")
                        .font(Font.custom("Sedgwick Ave Display", size: 22))
                        .offset(x: -90, y: 40)
                        .foregroundColor(.black)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)

                    HStack {
                        HauptView()
                            .offset(x: 15, y: 20)

                      
                    }
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Spacer()
                            // subtitle
                            Text("Too cool for slow")
                                .offset(x: -28, y: -0)
                            
                                .font(
                                    Font.custom("Montserrat", size: 17)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                            Spacer()
                            // Caption
                            Text("JumpSuits")
                                .offset(x: -40, y: -0)
                            
                                .font(
                                    Font.custom("Montserrat", size: 17)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                            Spacer()
                            
                        }
                        
                    }
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Spacer()
                            // subtitle
                            Text("Can’t touch this!")
                                .offset(x: -20, y: -20)
                            
                                .font(
                                    Font.custom("Montserrat", size: 17)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                            Spacer()
                            // Caption
                            Text("Jump right in!")
                                .offset(x: -25, y: -20)
                            
                                .font(
                                    Font.custom("Montserrat", size: 17)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                            Spacer()
                            
                        }
                        
                    }
                    VStack {
                        HStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 153, height: 227)
                                .background(
                                    Image("setcard-07")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 153, height: 227)
                                        .clipped()
                                )
                            
                            
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 152, height: 226)
                                .background(
                                    Image("setcard-08")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 152, height: 226)
                                        .clipped()
                                )
                        }
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Spacer()
                                // subtitle
                                Text("Too cool for slow")
                                    .offset(x: -28, y: -0)
                                
                                    .font(
                                        Font.custom("Montserrat", size: 17)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                Spacer()
                                // Caption
                                Text("JumpSuits")
                                    .offset(x: -35, y: -0)
                                
                                    .font(
                                        Font.custom("Montserrat", size: 17)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                Spacer()
                                
                            }
                            
                        }
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Spacer()
                                // subtitle
                                Text("Can’t touch this!")
                                    .offset(x: -20, y: -0)
                                
                                    .font(
                                        Font.custom("Montserrat", size: 17)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                Spacer()
                                // Caption
                                Text("Jump right in!")
                                    .offset(x: -20, y: -0)
                                    .font(
                                        Font.custom("Montserrat", size: 17)
                                            .weight(.medium)
                                        
                                    )
                                    .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                Spacer()
                                
                            }
                            
                        }
                        VStack(alignment: .center, spacing: 20) {
                            VStack(alignment: .center, spacing: 7) {
                                Image("icon1")
                                    .frame(width: 29.61089, height: 35.31654)
                                
                                
                                // subtitle
                                Text("Too much Pressure?")
                                    .font(
                                        Font.custom("Sedgwick Ave Display", size: 17)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                
                                // body
                                Text("Tell us what you love to wear and we will help you pick brands and streamline your choices.")
                                    .font(Font.custom("Montserrat", size: 14))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                    .frame(width: 235, alignment: .top)
                                
                                HStack(alignment: .center, spacing: 10) {
                                    
                                    Text("Let’s Go!")
                                        .font(Font.custom("Nunito Sans", size: 15))
                                        .kerning(1.25)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal, 2)
                                .padding(.vertical, 6)
                                .frame(width: 110, height: 30, alignment: .center)
                                .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                                .cornerRadius(25)
                                
                                Button(action: {
                                    isAddCategoriePageShowing = true
                                    // Handle button action
                                }) {
                                    ZStack {
                                        Image(systemName: "cart.circle")
                                            .foregroundColor(Color.white)
                                            .frame(width: 40, height: 40)
                                            .background(Color.purple.clipShape(Circle()))
                                            .offset(x:140, y: -90)
                                        
                                    }
                                    .shadow(color: Color(red: 0.63, green: 0.14, blue: 0.59), radius: 1, x: 0, y: 5)
                                    
                                }
                                
                                
                                
                            }
                            .padding(0)
                        }
                        .padding(.horizontal, 32)
                        .padding(.vertical, 10)
                        .frame(width: 320, alignment: .top)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(10)
                    }
                }
                .padding(20)
                // Unterer Navigationsbereich
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .overlay(
                    HStack(alignment: .center, spacing: 45) {
                        Button(action: {
                            isPresentingAddCategoryPage.toggle()
                                    }) {
                                        Image(systemName: "house")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                            .foregroundColor(Color(red: 0.4, green: 0.03, blue: 0.37))
                                    }
                                    .tag(0)
                                    .sheet(isPresented: $isPresentingAddCategoryPage) {
                                        AddCategoryPage()
                                    }

                        
                        Button(action: {
                            isPresentingSearchView.toggle() // Toggle the state to show/hide the sheet
                        }) {
                          Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(red: 0.4, green: 0.03, blue: 0.37))
                        }
                        .sheet(isPresented: $isPresentingSearchView) {
                            SearchView()
                    }
                        Button(action: {
                            isPresentingCreateProfileView.toggle() // Toggle the state to show/hide the sheet
                        }) {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(red: 0.4, green: 0.03, blue: 0.37))
                        }
                        .sheet(isPresented: $isPresentingCreateProfileView) {
                            ProfileView()
                        }
                        .tag(2)
                        
                        Button(action: {
                            isPresentingNotificationView.toggle() // Toggle the state to show/hide the sheet
                        }) {
                            Image(systemName: "bell")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(red: 0.4, green: 0.03, blue: 0.37))
                        }
                        .sheet(isPresented: $isPresentingNotificationView) {
                            NotificationView()
                        }
                        .tag(3)

                        
                        Button(action: {
                            isPresentingSettingView.toggle() // Toggle the state to show/hide the sheet
                        }) {
                            Image(systemName: "gear")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(red: 0.4, green: 0.03, blue: 0.37))
                        }
                        .sheet(isPresented: $isPresentingSettingView) {
                            SettingView()
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
                        .padding(.bottom, 5)
                    , alignment: .bottom // Den unteren Navigationsbereich am unteren Rand platzieren
                )
            }
        }
    }
    
    // Function for Timer in the Homeview
    func timeString(time: TimeInterval) -> String {
            let hours = Int(time) / 3600
            let minutes = Int(time) / 60 % 60
            let seconds = Int(time) % 60
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
    HomeView()
    }
    
}


import SwiftUI

struct AdCardView: View {
    let adCard: AdCard
    @State private var isExpanded = false

    var body: some View {
        VStack {
            Image(adCard.imageName)
                .resizable()
                .scaledToFill()
                .onTapGesture {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }
                .frame(width: isExpanded ? 200 : 150, height: isExpanded ? 200 : 150)
                .cornerRadius(10)

            if isExpanded {
                Group {
                    Text(adCard.title)
                        .font(.headline)
                        .lineLimit(20)
                        .padding(.top, 10)
                        .multilineTextAlignment(.center)
                    Text(adCard.description)
                        .font(.subheadline)
                        .padding(.vertical, 20)
                        .multilineTextAlignment(.center)
                    
                }
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct HauptView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(adCards) { adCard in
                    AdCardView(adCard: adCard)
                }
            }
            .padding()
        }
    }
}

struct AdCard: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
}
let adCards: [AdCard] = [
    AdCard(imageName: "werbung-01", title: "Wochenangebot", description: "10 % diese Woche!"),
    AdCard(imageName: "werbung-02", title: "Monatknüller", description: "Neue Ware jede Woche."),
    // Weitere Werbekarten hinzufügen...
]
