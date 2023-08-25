import SwiftUI

struct CheckBoxView: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            HStack(spacing: 5) { // Use HStack for horizontal alignment
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(isChecked ? Color(red: 0.4, green: 0.03, blue: 0.37) : .gray, lineWidth: 1)
                        .frame(width: 20, height: 20)
                        .background(isChecked ? Color(red: 0.4, green: 0.03, blue: 0.37) : .white)
                    
                    if isChecked {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                    }
                }
                Spacer()
                Text("Checkbox Label") // Replace with your checkbox label
            }
        }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView(isChecked: .constant(false))
    }
}
