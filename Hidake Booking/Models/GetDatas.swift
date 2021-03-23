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






class GetAnnouncements : ObservableObject {
    
    @Published var announcementList = [Announcement]()
    
    
    init() {
        
        let db = Firestore.firestore()
        db.collection("ANNOUNCEMENT").addSnapshotListener { (snap, err) in
            if err != nil {
                print("GetData, info collection error: \(String(describing: err))")
                return
            } else {
                
                
                if snap != nil {
                    self.announcementList = []
                    
                    for i in snap!.documents {
                        
                        print("Loop: \(i.data().count)")
                       /* let result = Result {
                            //try i.data(as: Announcement)
                            //try i.data(as: Announcement.self)
                        }
                        
                        switch result {
                        case .success(let meal):
                            if let meal = meal {
                                print("CustomerMenuContentView, getting data from Firebase : \(meal.name)")
                                self.announcementList.append(meal)
                            } else {
                                print("CustomerMenuContentView, getting data from Firebase : No data")
                            }
                        case .failure(let error):
                            print("CustomerMenuContentView, getting data from Firebase, Error: \(error)")
                        }
                        */
                        
                        
                    }
                }
                
            }
        }
        
       /*
        
                  
                        
                        let result = Result {
                            try i.data(as: MealClass.self)
                        }
                        switch result {
                        case .success(let meal):
                            if let meal = meal {
                                print("EditMenuContentView, getting data from Firebase: \(meal.name)")
                                self.mealList.append(meal)
                            } else {
                                print("EditMenuContentView, getting data from Firebase: No data")
                            }
                        case .failure(let error):
                            print("EditMenuContentView, getting data from Firebase: Error: \(error)")
                        }
                    }
                }
            }
            
        }*/
    }
    
}
