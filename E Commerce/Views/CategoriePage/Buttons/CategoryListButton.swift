
import SwiftUI



struct CategoryListButton: View {
    @State private var isShowingItemDetailsSheet = false

    var body: some View {
        Button(action: {
            isShowingItemDetailsSheet = true
        }) {
            Image(systemName: "arrow.right.circle.fill")
                .resizable()
                .foregroundColor(.black)
                .frame(width: 28, height: 28)
        }
        .sheet(isPresented: $isShowingItemDetailsSheet) {
            ItemDetailsView()
        }
    }
}

struct CategoryListButton_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListButton()
    }
}
