//
//  GetDatas.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-23.
//

import Foundation
import Firebase
import FirebaseFirestore
import SwiftUI
import FirebaseFirestoreSwift






class GetAnnouncements : ObservableObject {
    
    @Published var announcementList = [Announcement]()
    
    
    init() {
        
        let db = Firestore.firestore()
        db.collection("ANNOUNCEMENTS").addSnapshotListener { (snap, err) in
            if err != nil {
                print("GetData, info collection error: \(String(describing: err))")
                return
            } else {
                
                
                if snap != nil {
                    self.announcementList = []
                    
                    for i in snap!.documents {
                        
                        print("Loop: \(i.data().count)")
                       let result = Result {
                            try i.data(as: Announcement.self)
                        }
                        
                        switch result {
                        case .success(let announcement):
                            if let announcement = announcement {
                                print("CustomerMenuContentView, getting data from Firebase : \(announcement.info)")
                                self.announcementList.append(announcement)
                            } else {
                                print("CustomerMenuContentView, getting data from Firebase : No data")
                            }
                        case .failure(let error):
                            print("CustomerMenuContentView, getting data from Firebase, Error: \(error)")
                        }
                        
                        
                        
                    }
                }
                
            }
        }
        
       
    }
    
}





class GetJiaMingLakeDates : ObservableObject {
    
    @Published var jiaMingLakeList = [Activity]()
    
    
    init() {
        
        let db = Firestore.firestore()
        db.collection("嘉明湖").addSnapshotListener { (snap, err) in
            if err != nil {
                print("GetData, info collection error: \(String(describing: err))")
                return
            } else {
                
                
                if snap != nil {
                    self.jiaMingLakeList = []
                    
                    for i in snap!.documents {
                        
                        print("Loop: \(i.data().count)")
                       let result = Result {
                            try i.data(as: Activity.self)
                        }
                        
                        switch result {
                        case .success(let activity):
                            if let activity = activity {
                                print("CustomerMenuContentView, getting data from Firebase : \(activity.groupName)")
                                self.jiaMingLakeList.append(activity)
                            } else {
                                print("CustomerMenuContentView, getting data from Firebase : No data")
                            }
                        case .failure(let error):
                            print("CustomerMenuContentView, getting data from Firebase, Error: \(error)")
                        }
                        
                        
                        
                    }
                }
                
            }
        }
        
       
    }
    
}
