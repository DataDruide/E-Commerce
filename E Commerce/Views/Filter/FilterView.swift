
import SwiftUI

struct FilterView: View {
    @State private var selectedCategory: String = ""
    @State private var selectedStatus: String = ""
    @State private var isFeaturedOnly: Bool = false
    @State private var isChildProtectionEnabled: Bool = false
    @State private var isAdultContentEnabled: Bool = false
    
    let categories = ["Category 1", "Category 2", "Category 3"]
    let statusOptions = ["Open", "In Progress", "Completed"]
    
    var body: some View {
        VStack {
            Text("Filter")
                .font(.title)
                .foregroundColor(Color(red: 0.4, green: 0.03, blue: 0.37))
                .padding(.top, 20)
            
            Section(header: Text("Select Category")) {
                Picker(selection: $selectedCategory, label: Text("Category")) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.horizontal, 20)
            }
            
            Section(header: Text("Select Status")) {
                Picker(selection: $selectedStatus, label: Text("Status")) {
                    ForEach(statusOptions, id: \.self) { status in
                        Text(status)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.horizontal, 20)
            }
            
            Section(header: Text("Additional Filters")) {
                Toggle("Featured Only", isOn: $isFeaturedOnly)
                    .padding(.horizontal, 20)
                
                Toggle("Child Protection", isOn: $isChildProtectionEnabled)
                    .padding(.horizontal, 20)
                
                Toggle("Adult Content", isOn: $isAdultContentEnabled)
                    .padding(.horizontal, 20)
            }
            
            Button(action: {
                applyFilters()
            }) {
                Text("Apply Filters")
                    .padding()
                    .background(Color(red: 0.4, green: 0.03, blue: 0.37))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.vertical, 20)
            }
            
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(20)
        .padding()
    }
    
    func applyFilters() {
        // Implement your filter logic here based on selectedCategory, selectedStatus, and additional filters
        print("Applying filters...")
        print("Selected Category: \(selectedCategory)")
        print("Selected Status: \(selectedStatus)")
        print("Featured Only: \(isFeaturedOnly)")
        print("Child Protection Enabled: \(isChildProtectionEnabled)")
        print("Adult Content Enabled: \(isAdultContentEnabled)")
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}

