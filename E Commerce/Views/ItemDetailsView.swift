//import SwiftUI
//
//struct ItemDetailsView: View {
//    @State private var isLiked = false // Variable zur Speicherung des Zustands
//  
//    var body: some View {
//        ZStack {
//            VStack {
//                Spacer()
//                ItemHeaderDetailsShape()
//                
//                
//                HStack {
//                    Text("Fashionnova Sundress $65")
//                        .font(Font.custom("Space Grotesk", size: 17))
//                        .kerning(0.15)
//                        .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
//                        .frame(width: 259, height: 61, alignment: .leading)
//                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
//
//                    
//                    Button(action: {
//                                    isLiked.toggle() // Umkehrung des Zustands beim Klicken
//                                }) {
//                                    Image(systemName: "heart")
//                                        .font(Font.system(size: 20))
//                                        .foregroundColor(isLiked ? .red : Color(red: 0.4, green: 0.03, blue: 0.37)) // Wenn geliked, wird rot, sonst Standardfarbe
//                                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
//                                }
//                                
//                               
//
//                }
//                .padding(.horizontal, 20)
//                .padding(.vertical, 10)
//                
//                HStack {
//                    VStack(alignment: .leading, spacing: 0) {
//                        Text("Size")
//                            .font(
//                                Font.custom("Nunito Sans", size: 15)
//                                    .weight(.semibold)
//                            )
//                            .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
//                        
//                        HStack {
//                            ForEach(["XS", "S", "M", "L", "XL", "XLL"], id: \.self) { size in
//                                Text(size)
//                                    .font(Font.custom("Montserrat", size: 13))
//                                    .foregroundColor(Color(red: 0.73, green: 0.73, blue: 0.73))
//                                    .padding(5)
//                            }
//                        }
//                    }
//                    .padding()
//                    
//                    VStack(alignment: .leading, spacing: 8) {
//                        Text("Color")
//                            .font(
//                                Font.custom("Montserrat", size: 15)
//                                    .weight(.medium)
//                            )
//                            .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
//                        
//                        HStack(alignment: .center, spacing: 6) {
//                            ForEach(1...4, id: \.self) { index in
//                                Image("color\(index)")
//                                    .frame(width: 14, height: 14)
//                                    .background(Color(red: 0.9, green: 0.2, blue: 0.2))
//                                    .cornerRadius(7)
//                                    .overlay(
//                                        Rectangle()
//                                            .stroke(.black, lineWidth: 0.5)
//                                    )
//                            }
//                        }
//                    }
//                    .padding()
//                }
//                
//                HStack {
//                    Image("lkw")
//                        .frame(width: 20, height: 20)
//                    Text("Free delivery *T&C applies. Learn more")
//                        .font(Font.custom("Montserrat", size: 11))
//                        .foregroundColor(Color(red: 0.73, green: 0.73, blue: 0.73))
//                        .frame(width: 239, alignment: .leading)
//                }
//                .padding(.horizontal)
//                .padding(.top, 10)
//                
//                Spacer() // Add spacer to push the following VStack to the bottom
//                
//                ItemDetailsFooterShape()
//                    .padding(.all, 8) // Minimize the space between frames
//             //   AddToBagButton()
//                Spacer()
//            }
//        }
//        .frame(width: 360, height: 800)
//        .background(Color.white)
//        .cornerRadius(20)
//    }
//}
//
//
//
//struct ItemDetailsFooterShape: View {
//    var body: some View {
//        HStack {
//            Button(action: {
//                // Minus button action
//            }) {
//                Image(systemName: "minus")
//                    .frame(width: 24, height: 24)
//                    .foregroundColor(Color.white)
//            }
//            .padding() // Minimize the space between frames
//
//            
//            Text("1")
//                .font(
//                    Font.custom("Montserrat", size: 15)
//                        .weight(.medium)
//                )
//                .foregroundColor(Color.white)
//                .padding() // Minimize the space between frames
//
//            
//            Button(action: {
//                // Plus button action
//            }) {
//                Image(systemName: "plus")
//                    .frame(width: 24, height: 24)
//            }
//            .padding() // Minimize the space between frames
//            .foregroundColor(Color.white)
//
//
//            
//            Button(action: {
//                // Whiteframe button action
//            }) {
//                ZStack {
//                    Image("whiteframe")
//                        .frame(width: 35, height: 35)
//                        .background(.white)
//                        .cornerRadius(4)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 4)
//                                .inset(by: 0.5)
//                                .stroke(Color.black, lineWidth: 1)
//                        )
//
//                }
//                .frame(width: 24, height: 24, alignment: .center)
//                .shadow(color: Color(red: 0.63, green: 0.14, blue: 0.59), radius: 1, x: 0, y: 5)
//            }
//        }
//        .padding(0)
//        .frame(width: 360, height: 50, alignment: .center)
//        .background(Color(red: 0.4, green: 0.03, blue: 0.37))
//        .cornerRadius(25)
//
//
//    }
//}
//
//import SwiftUI
//
//struct CustomShape1: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        
//        let radius: CGFloat = 20.0
//        let width = rect.width
//        let height = rect.height
//        
//        path.move(to: CGPoint(x: radius, y: 0))
//        path.addLine(to: CGPoint(x: width - radius, y: 0))
//        path.addArc(center: CGPoint(x: width - radius, y: radius), radius: radius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
//        path.addLine(to: CGPoint(x: width, y: height - radius))
//        path.addArc(center: CGPoint(x: width - radius, y: height - radius), radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
//        path.addLine(to: CGPoint(x: radius, y: height))
//        path.addArc(center: CGPoint(x: radius, y: height - radius), radius: radius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
//        path.addLine(to: CGPoint(x: 0, y: radius))
//        path.addArc(center: CGPoint(x: radius, y: radius), radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
//        
//        return path
//    }
//}
//
//struct ItemHeaderDetailsShape: View {
//    var body: some View {
//        ZStack(alignment: .leading) {
//            Color.gray.opacity(0.051)
//            
//            HStack {
//                Button(action: {
//                    // Handle button tap
//                }) {
//                    Image(systemName: "arrow.left")
//                        .padding()
//                        .background(Color(red: 0.4, green: 0.03, blue: 0.37))
//                        .foregroundColor(.white)
//                        .clipShape(Circle())
//                }
//                Spacer()
//                Text("Item Details")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color(red: 0.4, green: 0.03, blue: 0.37))
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                Spacer()
//
//            }
//        }
//        .frame(height: 75)
//        .clipShape(CustomShape1())
//    }
//}
//
//struct ItemHeaderDetailsShape_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemHeaderDetailsShape()
//    }
//}
////struct AddToBagButton: View {
////    @State private var showingAddedToBagSheet = false
////
////    var body: some View {
////        Button(action: {
////            showingAddedToBagSheet = true
////        }) {
////            Text("Add to bag")
////                .font(.system(size: 15, weight: .medium))
////                .foregroundColor(.white)
////                .frame(width: 320, height: 45)
////                .background(Color(red: 0.4, green: 0.03, blue: 0.37))
////                .cornerRadius(25)
////        }
////        .padding(.horizontal, 69)
////        .sheet(isPresented: $showingAddedToBagSheet) {
////            AddedToBag()
////        }
////    }
////}
