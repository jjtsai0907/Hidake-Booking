//
//  Announcement.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-23.
//

import Foundation

class Announcement: Codable, Identifiable, ObservableObject {
    
    var id: String = UUID().uuidString
    var info: String = "Default"
    var imageURL: String = ""
    var website: String = ""
    
    /*init(info: String) {
        self.info = info
        
    }*/
    
}

