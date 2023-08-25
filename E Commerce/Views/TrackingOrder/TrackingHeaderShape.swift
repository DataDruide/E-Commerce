import SwiftUI
struct TrackingHeaderShape: View {
    var body: some View {
        CustomShape()
            .fill(Color.gray.opacity(0.05))
            .frame(height: 60)
            .overlay(
                HStack {
                    Button(action: {
                        // Button action for image
                    }) {
                        Image("icon-x")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    
                    Text("Tracking your Order")
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
            )
    }
}

struct TrackingHeaderShape_Previews: PreviewProvider {
    static var previews: some View {
        TrackingHeaderShape()
    }
}
