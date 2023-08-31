
import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(placeholder)
                .font(.caption)
                .foregroundColor(.secondary)
            
            TextField("", text: $text)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .font(.body)
        }
    }
}
