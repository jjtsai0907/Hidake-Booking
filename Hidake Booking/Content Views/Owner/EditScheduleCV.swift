//
//  AddActivityCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-14.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct EditScheduleCV: View {
    
    var activity: String
    let db = Firestore.firestore()
    
    
    @State var selectedDate = Date()
    
    //var groups = ["Group A   台幣 6500 ", "Group B   台幣 6800 "]
    
    @State var showingDetails = false
    
    @State var showingTour = false
    @State var showingIncludedCost = false
    @State var showingExtraCosts = false
    @State var showingInfo = false
    
    
    
    //
    
    //New
    
    //var category: String
    
    @State private var scheduleTitle = ""
    @State private var scheduleDetails = "ex: 第一天... 7:00集合..."
    @State private var includedCost = "ex: 台中高鐵 屯原登山口來回接駁(送下山盥洗)..."
    @State private var extraCost = "ex: 三日午餐..."
    @State private var geers = "ex: 舒適登山鞋..."
    @State private var info = "ex: 退費準則..."
    
    
    //@State var showImagePicker = false
    //@State var imageInBlackBox = UIImage(imageLiteralResourceName: "upload_sign")
    //@State var downloadedImageURL = ""
    
    var body: some View {
        
        VStack {
            
            Form {
                
                
                /*Section {
                    Image(uiImage: imageInBlackBox)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding(20)
                        .padding(.top, 10)
                        .onTapGesture {
                            showImagePicker.toggle()
                        }.sheet(isPresented: $showImagePicker){
                            AnnouncementImageViewPicker(isPresented: self.$showImagePicker, selectedImage: self.$imageInBlackBox, downloadedImageURL: $downloadedImageURL)
                            
                        }
                }*/
                
                Section {
                    
                    
                    Row(icon: "sun.max.fill", title: "行程規劃：")
                    TextEditor (text: $scheduleDetails)
                    
                    
                    Row(icon: "checkmark", title: "費用包含：")
                    TextEditor (text: $includedCost)
                    
                    Row(icon: "bubble.left.and.bubble.right", title: "自理費用：")
                    TextEditor (text: $extraCost)
                    
                    Row(icon: "checkmark", title: "所需裝備")
                    TextEditor (text: $geers)
                    
                    Row(icon: "exclamationmark.triangle.fill", title: "注意事項：")
                    TextEditor (text: $info)
                    
                }
                
                
                    
                
            }
            
                
                Button(action: {
                    print("ScheduleCV : pressed")
                    
                    let schedule = Schedule()
                    
                    //schedule.imageURL = downloadedImageURL
                    schedule.scheduleTitle = scheduleTitle
                    schedule.scheduleDetails = scheduleDetails
                    schedule.includedCost = includedCost
                    schedule.extraCost = extraCost
                    schedule.geers = geers
                    schedule.info = info
                    
                    do {
                        try db.collection("\(activity)SCHEDULE").document("schedule").setData(from: schedule)
                        scheduleDetails = ""
                        includedCost = ""
                        extraCost = ""
                        geers = ""
                        info = ""
                        //imageInBlackBox = UIImage(imageLiteralResourceName: "upload_sign")
                        print("ScheduleCV: uploaded the announcement!")
                        
                    } catch let error {
                        print("Error writing city to Firestore: \(error)")
                    }
                    
                    
                    
                    
                    
                    
                    
                }){
                    Text("變更")
                        .bold()
                        .padding(.horizontal, 40)
                        .padding(.vertical, 8)
                        .foregroundColor(.white)
                }.background(Color("themeBlue"))
                .shadow(radius: 25)
                .cornerRadius(10)
                .padding()
            }
            
            
            
        .navigationTitle("編輯\(activity)行程")
        
    }
}
      
        
        
        

/*
 struct AddActivityCV_Previews: PreviewProvider {
 static var previews: some View {
 AddActivityCV()
 }
 }*/
