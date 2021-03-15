//
//  AddActivityCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-14.
//

import SwiftUI

struct AddActivityCV: View {
    
    //var activity: String
    @State var selectedDate = Date()
    
    var groups = ["Group A   台幣 6500 ", "Group B   台幣 6800 "]
    
    @State var showingDetails = false
    
    @State var showingTour = false
    @State var showingIncludedCost = false
    @State var showingExtraCosts = false
    @State var showingInfo = false
    
    
    
    //
    
    //New
    
    var category: String
    
    @State private var activityTitleValue = ""
    @State private var addScheduleValue = ""
    @State private var addIncludedCostValue = ""
    @State private var addExtraCostValue = ""
    @State private var addInfoValue = ""
    
    
    
    @State private var activityDateValue = Date()
    @State private var activityNameValue = ""
    @State private var activitySeatValue = ""
    
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    
    var body: some View {
        
        VStack {
            
            Form {
                
                
                Section {
                    Text("新增活動名稱")
                    TextField("活動名稱...", text: $activityTitleValue)
                    
                }
                
                
                Section {
                    
                    Text("新增行程細節")
                    
                    Image("camping")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding(20)
                        .padding(.top, 10)
                    
                    HStack {
                        Image(systemName: "sun.max.fill")
                        Text("行程規劃：")
                    }
                    
                    TextField ("ex: 第一天... 7:00集合...", text: $addScheduleValue)
                    
                    
                    HStack {
                        Image(systemName: "checkmark")
                        Text("費用包含：")
                    }
                    
                    TextField ("ex: 台中高鐵 屯原登山口來回接駁(送下山盥洗)...", text: $addIncludedCostValue)
                    
                    
                    HStack {
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("自理費用：")
                    }
                    
                    TextField ("ex: 三日午餐...", text: $addExtraCostValue)
                    
                    
                    
                    HStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                        Text("注意事項：")
                    }
                    
                    TextField ("ex: 退費準則...", text: $addInfoValue)
                    
                    
                    
                }
            }
            
            Button(action: {
                print("CalenderCV: pressed")
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
            
        }.navigationTitle("新增\(category)活動")
        
    }
}
        /*
         Section {
         DatePicker("Pick a date", selection: $activityDateValue, in: Date()..., displayedComponents: .date)
         .datePickerStyle(GraphicalDatePickerStyle())
         .padding(30)
         
         Text("\(activityDateValue, formatter: dateFormatter)")
         TextFieldView(placeHolder: "團名...", textValue:  $activityNameValue)
         TextFieldView(placeHolder: "成團人數...", textValue: $activitySeatValue)
         
         
         }
         
         
         Section {
         List {
         
         ForEach (groups, id: \.self) { group in
         HStack{
         Text("\(group)")
         Spacer()
         Text(" 剩餘名額 5 ")
         .foregroundColor(.red)
         }
         
         }
         }
         
         
         
         }*/
        
        
        /*HStack{
         
         
         /* Button(action: {
         print("CalenderCV: pressed")
         showingDetails.toggle()
         
         }){
         Text("編輯行程")
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
         })*/
         
         Spacer()
         
         Button(action: {
         print("CalenderCV: pressed")
         }){
         Text("新增")
         .bold()
         .padding(.horizontal, 40)
         .padding(.vertical, 8)
         .foregroundColor(.white)
         }.background(Color("themeBlue"))
         .shadow(radius: 25)
         .cornerRadius(10)
         
         .padding(.trailing, 30)
         }.padding(.bottom, 30)
         
         
         
         }*/
        
        
        

/*
 struct AddActivityCV_Previews: PreviewProvider {
 static var previews: some View {
 AddActivityCV()
 }
 }*/
