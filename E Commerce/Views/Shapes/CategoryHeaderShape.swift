import SwiftUI



struct CategoryHeaderShape: View {
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                .clipShape(CustomShape())
            
        }
        .frame(maxWidth: .infinity)
    }
}



