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
    
    let db = Firestore.firestore()
    
    
    var body: some View {
        
        Button(action: {
            
            let city = Announcement(info: "吃大便吧")
            
            
            do {
                try db.collection("ANNOUNCEMENTS").document(city.id).setData(from: city)
                
                
            } catch let error {
                print("Error writing city to Firestore: \(error)")
            }
            
        }){
            Text("Upload Announcement")
        }
    }
}


/*
 struct AnnouncementCV_Previews: PreviewProvider {
 static var previews: some View {
 AnnouncementCV()
 }
 }*/
