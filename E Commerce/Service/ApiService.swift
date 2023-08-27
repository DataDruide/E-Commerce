import Foundation

// The ApiService class handles fetching product data from a given URL using URLSession
class ApiService {
    
    // Method to fetch products from the specified URL and provide the results via a completion handler
    func fetchProducts(completion: @escaping ([Product]) -> Void) {
        // Check if the provided URL is valid
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            completion([])
            return
        }
        
        // Perform a data task using URLSession
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                // Initialize a JSON decoder to parse the received data
                let decoder = JSONDecoder()
                if let products = try? decoder.decode([Product].self, from: data) {
                    // Call the completion handler with the fetched products
                    completion(products)
                }
            } else {
                // Call the completion handler with an empty array in case of error
                completion([])
            }
        }.resume() // Start the data task
    }
}
