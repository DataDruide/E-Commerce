
import Foundation
@MainActor
class TrackingOrderViewModel: ObservableObject {
    // Store the list of orders
    @Published var orders: [Order]
    
    init() {
        // Initialize orders with sample data
        self.orders = [
            Order(id: 1, text: "Order 1 has been packaged", isPackaged: false),
            Order(id: 2, text: "Order on its way to the warehouse", isPackaged: false),
            Order(id: 3, text: "Order has arrived at the warehouse", isPackaged: false),
            Order(id: 4, text: "Order is out for delivery", isPackaged: false),
            Order(id: 5, text: "Order has been delivered", isPackaged: false)
        ]
    }
    
    // Toggle the checkbox status for the order at a specific index
    func checkCheckBox(for index: Int) {
        orders[index].isPackaged.toggle()
    }
    
    // Save the updated checkbox statuses
    func saveCheckboxes() {
        // Implement saving logic here
        // For example, you can update a database or server with the updated checkbox statuses
    }
}
