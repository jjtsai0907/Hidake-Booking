//
//  EditActivityCalenderCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-15.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct EditActivityCalenderCV: View {
    let db = Firestore.firestore()
    
    var activityName: String
    
    
    @State private var activityDateValue = ""
    @State private var activityNameValue = ""
    @State private var activitySeatValue = ""
    
    
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        
        VStack {
            
            TextFieldView(placeHolder: "日期...05-04", textValue:  $activityDateValue)
            TextFieldView(placeHolder: "團名...", textValue:  $activityNameValue)
            TextFieldView(placeHolder: "剩餘人數...", textValue: $activitySeatValue)
            
            
            Button(action: {
                
                let activity = Activity()
                activity.groupName = activityNameValue
                activity.date = activityDateValue
                activity.seatsLeft = Int(activitySeatValue) ?? 0
                activity.category = activityName
                print("EditActivityCalenderCV: pressed")
                do {
                    
                    
                    do {
                         db.collection("\(activityName)DATE_LIST").document("DATE_LIST").updateData(["dates": FieldValue.arrayUnion(["\(activityDateValue)"])])
                    }
                    try db.collection("\(activityName)\(activityDateValue)").document(activity.id).setData(from: activity)
                    
                   
                    activityNameValue = ""
                    activityDateValue = ""
                    activitySeatValue = ""
                    
                    
                } catch let error {
                    print("Error writing city to Firestore: \(error)")
                }
                
             
                
                
            }){
                Text("新增")
                    .bold()
                    .padding(.horizontal, 40)
                    .padding(.vertical, 8)
                    .foregroundColor(.white)
            }.background(Color("themeBlue"))
            .shadow(radius: 25)
            .cornerRadius(10)
            .padding()
        }.navigationTitle("\(activityName)加團")
        
    }
}

/*
 struct EditActivityCalenderCV_Previews: PreviewProvider {
 static var previews: some View {
 EditActivityCalenderCV()
 }
 }*/
