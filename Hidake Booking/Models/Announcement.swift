//
//  Announcement.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-23.
//

import Foundation

struct Announcement: Codable, Identifiable {
    
    var id: String = UUID().uuidString
    var info: String
    
    init(info: String) {
        self.info = info
        
    }
    
}
