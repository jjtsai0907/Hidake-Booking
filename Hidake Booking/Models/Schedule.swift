//
//  Schedule.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-05-30.
//

import Foundation

class Schedule: Codable, Identifiable, ObservableObject {
    
    var id: String = UUID().uuidString
    var imageURL: String = ""
    var scheduleTitle = ""
    var scheduleDetails = ""
    var includedCost = ""
    var extraCost = ""
    var geers = ""
    var info = ""
    
 
    /*init(info: String) {
        self.info = info
        
    }*/
    
}
