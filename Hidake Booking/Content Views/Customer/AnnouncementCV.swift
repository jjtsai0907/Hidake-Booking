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
    //@StateObject var announcement = Announcement()
    @State var announcementValue = ""
    
    var body: some View {
        VStack {
            TextField("Enter: ", text: $announcementValue)
            
            Button(action: {
                let announcement = Announcement()
                
                announcement.info = announcementValue
                
                
                do {
                    try db.collection("ANNOUNCEMENTS").document(announcement.id).setData(from: announcement)
                    
                    
                } catch let error {
                    print("Error writing city to Firestore: \(error)")
                }
                
            }){
                Text("Upload Announcement")
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
