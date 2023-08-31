//
//  BackendSimulator.swift
//  E Commerce
//
//  Created by Marcel Zimmermann on 31.08.23.
//

import Foundation
import SwiftUI
class BackendSimulator: ObservableObject {
    @Published var serverStatus: String = "Idle"
    @Published var serverDelay: Int = 0
    @Published var selectedProvider: PaymentProvider?
    @Published var isProcessing: Bool = false
    @Published var paymentSuccess: Bool = false
    @Published var validationSuccess: Bool = false
    
    private var timer: Timer?
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
            self?.simulateServerRequest()
        }
    }
    
    func simulateServerRequest() {
        if isProcessing { // Check if payment process is already in progress
            return // Exit the function if payment process is ongoing
        }
        
        if let provider = selectedProvider {
            serverStatus = "Requesting payment from \(provider.name)..."
            serverDelay = Int.random(in: 1...5)
            isProcessing = true
            paymentSuccess = false
            validationSuccess = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(serverDelay)) { [weak self] in
                self?.serverStatus = "Payment successful with \(provider.name)"
                self?.isProcessing = false
                self?.paymentSuccess = true
                self?.validationSuccess = true
            }
        }
    }

}
