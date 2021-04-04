//
//  CalenderCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-12.
//

import SwiftUI
import FSCalendar
import FirebaseFirestoreSwift
import FirebaseFirestore

struct CalenderCV: View {
    
    var activity: String
    @State var category = ""
    @State var selectedDate = Date()
    
    var groups = ["Group A   台幣 6500 ", "Group B   台幣 6800 "]
    
    @State var showingDetails = false
    var calendar: FSCalendar!
    
    
    @State var dateString = ""
    
    @State var selectedDateActivities = [Activity]()
    
    
    
    /*
     @StateObject var jiaMingLakeList : GetJiaMingLakeDates {
        get {
            return GetJiaMingLakeDates(category: activity)
        }
    }
     */
    // ----
     
    @StateObject var jiaMingLakeList = GetJiaMingLakeDates()
    
    var body: some View {
        
        VStack {
            
         
            CalendarRepresentable(category: $category, selectedDateActivities: $selectedDateActivities, selectedDate: $selectedDate, dateString: $dateString)
                .padding()
                .frame(height: 400)
      
            Spacer()
            
            //Text("\(dateString)  Event: 1. go hiking 2. Eating")
            //FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
            
            /*DatePicker("Pick a date", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding(30)*/
            
            Text(dateString)
            
            List (selectedDateActivities) { group in
                HStack {
                    
                    
                    Text("\(group.groupName)")
                    
                    Spacer()
                    Text("剩餘名額 \(group.seatsLeft)")
                        .foregroundColor(.red)
                
                }
                
                
            }
        
            
            
            HStack{
                
                
                Button(action: {
                    print("CalenderCV: pressed")
                    showingDetails.toggle()
                    
                }){
                    Text("行程")
                        .bold()
                        .padding(.horizontal, 40)
                        .padding(.vertical, 8)
                        .foregroundColor(.white)
                }.background(Color("themeBlue"))
                .shadow(radius: 25)
                .cornerRadius(10)
                .padding(.leading, 30)
                .sheet(isPresented: $showingDetails, content: {
                    DetailsSheet()
                })
                
                Spacer()
                
                Button(action: {
                    print("CalenderCV: pressed")
                }){
                    Text("報名")
                        .bold()
                        .padding(.horizontal, 40)
                        .padding(.vertical, 8)
                        .foregroundColor(.white)
                }.background(Color("themeBlue"))
                .shadow(radius: 25)
                .cornerRadius(10)
                
                .padding(.trailing, 30)
            }.padding(.bottom, 30)
            
            
            
        }.navigationTitle(activity)
        .onAppear{
            category = activity
        }
        
        
        
        
    }
}

/*
 struct CalenderCV_Previews: PreviewProvider {
 static var previews: some View {
 CalenderCV()
 }
 }*/
