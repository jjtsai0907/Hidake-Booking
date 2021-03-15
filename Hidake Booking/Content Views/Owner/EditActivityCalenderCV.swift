//
//  EditActivityCalenderCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-15.
//

import SwiftUI

struct EditActivityCalenderCV: View {
    
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
            /*DatePicker("Pick a date", selection: $activityDateValue, in: Date()..., displayedComponents: .date)
            .datePickerStyle(GraphicalDatePickerStyle())
            .padding(30)
            
            Text("\(activityDateValue, formatter: dateFormatter)")*/
            TextFieldView(placeHolder: "日期...5/4-5/6", textValue:  $activityDateValue)
            TextFieldView(placeHolder: "團名...", textValue:  $activityNameValue)
            TextFieldView(placeHolder: "成團人數...", textValue: $activitySeatValue)
            
            
            Button(action: {
                print("EditActivityCalenderCV: pressed")
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
