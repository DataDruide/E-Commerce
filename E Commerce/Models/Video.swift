//
//  Video.swift
//  E Commerce
//
//  Created by Marcel Zimmermann on 27.08.23.
//

import Foundation

struct Video : Codable, Identifiable {
    let id : String
    let name : String
    let headline : String
    
    // Computer Proberties
    
    var thumbnail : String {
        "video-\(id)"
    }
}
