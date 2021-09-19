//
//  GlobalEnvironment.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-09-19.
//

import Foundation
import Firebase

class GlobalEnvironment: ObservableObject {
    
    let db = Firestore.firestore()
    
    
    func getAllCategories() {
        db.collection("種類").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Global getAllCategories(): Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let items = document.get(document.documentID) as! [String]
                    for item in items {
                        print(item)
                    }
                }
            }
        }
    }
    
    
   /* func getStringArray () {
        
        db.collection("種類").document().getDocument(completion: { documentSnapshot, error in
           if let err = error {
                print(err.localizedDescription)
                return
            }

           if let doc = documentSnapshot {
               //let title = doc.get("movie") as! String
               let items = doc.get(selectedCategory) as! [String]
               //print(title)
               for item in items {
                   print(item)
               }
           }
       })
    
    }
    */
}
