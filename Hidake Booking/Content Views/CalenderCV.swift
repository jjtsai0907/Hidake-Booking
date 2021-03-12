//
//  CalenderCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-12.
//

import SwiftUI

struct CalenderCV: View {
    
    var activity: String
    @State var selectedDate = Date()
    
    var groups = ["Group A   6500NTD ", "Group B   6800NTD"]
    
    @State var showingDetails = false
    
    
    var body: some View {
        
        VStack {
            
            
            
            DatePicker("Pick a date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding(30)
            
            
            List {
                
                ForEach (groups, id: \.self) { group in
                    HStack{
                        Text("\(group)")
                        Spacer()
                        Text("5 Seats Left")
                            .foregroundColor(.red)
                    }
                    
                }

            }
            
            
            HStack{
                
                
                Button(action: {
                    print("CalenderCV: pressed")
                    showingDetails.toggle()
                    
                }){
                    Text("Details")
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
                    Text("Register")
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
