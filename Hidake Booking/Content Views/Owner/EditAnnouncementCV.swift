//
//  EditAnnouncementCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-24.
//

import SwiftUI
import FirebaseFirestore


struct EditAnnouncementCV: View {
    @State var announcementValue = ""
    let db = Firestore.firestore()
    
    var body: some View {
        
        VStack {
            TextFieldView(placeHolder: "Enter: ", textValue: $announcementValue)
            
            Button(action: {
                let announcement = Announcement()
                
                announcement.info = announcementValue
                
                
                
                do {
                    try db.collection("ANNOUNCEMENTS").document(announcement.id).setData(from: announcement)
                    announcementValue = ""
                    
                } catch let error {
                    print("Error writing city to Firestore: \(error)")
                }
                
            }){
                Text("Upload Announcement")
            }
        }
        
        
    }
}

struct EditAnnouncementCV_Previews: PreviewProvider {
    static var previews: some View {
        EditAnnouncementCV()
    }
}
