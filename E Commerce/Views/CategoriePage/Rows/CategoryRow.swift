import SwiftUI

struct CategoryRow: View {
    let title: String
    let imageName: String
    
    @State private var isShowingItemDetailsSheet = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.primary)
            
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 75, height: 96)
                .clipped()
                .cornerRadius(10)
            
            Button(action: {
                isShowingItemDetailsSheet.toggle()
            }) {
                Text("Details anzeigen")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $isShowingItemDetailsSheet) {
                ItemDetailsView()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(color: Color(.black).opacity(0.1), radius: 5, x: 0, y: 2)
    }
}
