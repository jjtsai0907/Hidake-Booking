//
//  AnnouncementCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-13.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


struct AnnouncementCV: View {
    
    
    
    
    @ObservedObject var announcements = GetAnnouncements()
    
    var body: some View {
        
        
        List (announcements.announcementList) { announcement in
            VStack {
                
                
                Text("\(announcement.info)")
                
                
                
            }
            
            
        }
        
        
    }
}


/*
 struct AnnouncementCV_Previews: PreviewProvider {
 static var previews: some View {
 AnnouncementCV()
 }
 }*/
