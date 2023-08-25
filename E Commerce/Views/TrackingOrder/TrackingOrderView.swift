import SwiftUI
import MapKit

struct TrackingOrderView: View {
    @State private var isPresentingTrackingOrderView = false
    @ObservedObject var viewModel = TrackingOrderViewModel()
    @State private var trackingNumber = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    TrackingHeaderShape()
                    Image("map")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)

                    Section(header: Text("Order Items")) {
                        VStack(spacing: 10) {
                            ForEach(viewModel.orders.indices, id: \.self) { index in
                                HStack(alignment: .center, spacing: 10) {
                                    CheckBoxView(isChecked: $viewModel.orders[index].isPackaged)
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(Color(red: 0.4, green: 0.03, blue: 0.37))

                                    Text(viewModel.orders[index].text)
                                        .font(Font.custom("Montserrat", size: 13))
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                                }
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    }

                    Section {
                        Button(action: {
                            openGoogleMaps()
                        }) {
                            Image(systemName: "map")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(width: 60, height: 60)
                                .background(Color.purple)
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        }
                        .offset(x: 140, y: -340)
                        .padding(.bottom, 20)

                        Divider()

                        VStack(spacing: 20) {
                            TextField("Enter Tracking Number", text: $trackingNumber)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)

                            Button("Search") {
                                // Implement search logic using the trackingNumber
                            }
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .padding(.horizontal)
                        }
                    }

                    Section(header: Text("Here you can Cancel your Order ")) {
                        Button(action: {
                            isPresentingTrackingOrderView.toggle()
                            viewModel.saveCheckboxes()
                        }) {
                            Text("Cancel Order")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                                .cornerRadius(25)
                                .shadow(color: .gray, radius: 0.5, x: 0.25, y: 0.25)
                        }
                        .padding(.horizontal, 20)
                        .sheet(isPresented: $isPresentingTrackingOrderView) {
                            TrackingOrderView()
                        }
                    }
                    Spacer(minLength: 150)
                }
                .padding(20)
            }
        }
    }

    func openGoogleMaps() {
        if let url = URL(string: "comgooglemaps://") {
            UIApplication.shared.open(url)
        }
    }
}

struct TrackingOrderView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingOrderView()
    }
}
