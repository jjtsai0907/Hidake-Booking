//
//  CalenderCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-12.
//

import SwiftUI
import FSCalendar

struct CalenderCV: View {
    
    var activity: String
    @State var selectedDate = Date()
    
    var groups = ["Group A   台幣 6500 ", "Group B   台幣 6800 "]
    
    @State var showingDetails = false
    var calendar: FSCalendar!
    
    
    @State var dateString = ""
    
    
    var body: some View {
        
        VStack {
            
         
            CalendarRepresentable(selectedDate: $selectedDate, dateString: $dateString)
                .padding()
                .frame(height: 400)
                
                    
            //Text("\(selectedDate)")
            //Text("\(dateString)")
            
            
            Spacer()
            
            //Text("\(dateString)  Event: 1. go hiking 2. Eating")
            //FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
            
            /*DatePicker("Pick a date", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding(30)*/
            
            
            List {
                
                ForEach (groups, id: \.self) { group in
                    HStack{
                        if dateString == "2021-04-08" {
                        //Text("\(dateString)")
                        Text("\(group)")
                        Spacer()
                        Text(" 剩餘名額 5 ")
                            .foregroundColor(.red)
                    }
                    }
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
        
        
        
        
    }
}

/*
 struct CalenderCV_Previews: PreviewProvider {
 static var previews: some View {
 CalenderCV()
 }
 }*/
