//
//  DetailsCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-12.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct DetailsSheet: View {
    
    @State var showingTour = false
    @State var showingIncludedCost = false
    @State var showingExtraCosts = false
    @State var showingInfo = false
    @State var showingGeers = false
    
    @State private var scheduleTitle = ""
    @State private var imageURL = ""
    @State private var scheduleDetails = ""
    @State private var includedCost = ""
    @State private var extraCost = ""
    @State private var geers = ""
    @State private var info = ""
    
    
    
    
    var activity: String
    
    
    
    var body: some View {
        
        VStack {
            
           
            Image(uiImage: imageURL.load())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(20)
                .padding(.top, 10)
            
            Spacer()
            
            Form {
                Section {
                    VStack {
                        Button(action: {
                            showingTour.toggle()
                        }){
                            HStack (alignment: .center){
                                Image(systemName: "sun.max.fill")
                                Text("行程規劃")
                                    .font(.title)
                                    .padding(.top, 8)
                                
                            }.foregroundColor(Color("themeBlue"))
                            
                        }.padding(.vertical, 10)
                        
                        if showingTour {
                            withAnimation{
                                Text(scheduleDetails)
                            }
                        }
                        
                        
                    }
                }
                
                Section {
                    VStack {
                        Button(action: {
                            showingIncludedCost.toggle()
                        }){
                            HStack {
                                Image(systemName: "checkmark")
                                Text("費用包含")
                                    .font(.title)
                            }.foregroundColor(Color("themeBlue"))
                        }.padding(.vertical, 10)
                        
                        
                        if showingIncludedCost {
                            Text(includedCost)
                        }
                        
                    }
                }
                
                
                Section {
                    VStack {
                        
                        Button(action: {
                            showingExtraCosts.toggle()
                        }){
                            HStack {
                                Image(systemName: "bubble.left.and.bubble.right")
                                Text("自理費用")
                                    .font(.title)
                            }.foregroundColor(Color("themeBlue"))
                        }.padding(.vertical, 10)
                   
                        if showingExtraCosts {
                            Text(extraCost)
                            
                        }
                        
                    }
                }
                
                
                Section {
                    VStack {
                        
                        Button(action: {
                            showingGeers.toggle()
                        }){
                            HStack {
                                Image(systemName: "bandage.fill")
                                Text("所需裝備")
                                    .font(.title)
                            }.foregroundColor(Color("themeBlue"))
                        }.padding(.vertical, 10)
                   
                        if showingGeers {
                            Text(geers)
                            
                        }
                        
                    }
                }
                
                
                Section {
                    VStack {
                        
                        Button(action: {
                            showingInfo.toggle()
                        }){
                            HStack {
                                Image(systemName: "exclamationmark.triangle.fill")
                                Text("注意事項")
                                    .font(.title)
                            }.foregroundColor(.red)
                        }.padding(.vertical, 10)
                   
                        if showingInfo {
                            Text(info)
                            
                        }
                        
                    }
                }
                
            }
            
        }.onAppear(){
            print("Detailsssss")
            
            let db = Firestore.firestore()
            db.collection("\(activity)SCHEDULE").document("schedule").getDocument { (snap, err) in
                if err != nil {
                    print("GetData DetailSheet, info collection error: \(String(describing: err))")
                    return
                } else {
                    
                    
                    if snap != nil {
                        
                           let result = Result {
                            try snap!.data(as: Schedule.self)
                            }
                            
                            switch result {
                            case .success(let schedule):
                                if let schedule = schedule {
                                    imageURL = schedule.imageURL
                                    scheduleTitle = schedule.scheduleTitle
                                    scheduleDetails = schedule.scheduleDetails
                                    includedCost = schedule.includedCost
                                    extraCost = schedule.extraCost
                                    geers = schedule.geers
                                    info = schedule.info
                                    
                                    print("DetailSheet, getting data from Firebase : \(schedule.includedCost)")
                                    
                                } else {
                                    print("DetailSheet, getting data from Firebase : No data")
                                }
                            case .failure(let error):
                                print("DetailSheet, getting data from Firebase, Error: \(error)")
                            }
                            
                            
                            
                        
                    }
                    
                }
            }
            
            
        }
    
        
        
    }
}

/*
 struct DetailsCV_Previews: PreviewProvider {
    static var previews: some View {
        DetailsSheet()
    }
}
*/
