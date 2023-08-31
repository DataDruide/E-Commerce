
import SwiftUI


// Helper Button View for agreement
struct AgreementButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isSelected ? .green : .primary)
                    .font(.system(size: 20))
                Text(title)
                    .foregroundColor(.blue)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 10)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }
        }
    }
}
