
import SwiftUI


struct TermSection: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
            Text(content)
                .font(.body)
                .foregroundColor(.primary)
        }
    }
}
