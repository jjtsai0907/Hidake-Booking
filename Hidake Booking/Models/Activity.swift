//
//  Activity.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-24.
//

import Foundation

class Activity: Codable, Identifiable, ObservableObject {
    
    var id: String = UUID().uuidString
    var groupName: String = "Default"
    var date: String = "Default"
    var seatsLeft: Int = 0
    
    /*init(info: String) {
        self.info = info
        
    }*/
    
}
