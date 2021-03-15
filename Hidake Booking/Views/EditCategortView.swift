//
//  EditCategortView.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-14.
//

import SwiftUI

struct EditCategortView: View {
    
    var categoryImage: String
    var categoryName: String
    var activities: [String]
    var activityIcon: String
    @State var showingCalender = false
    @State var selectedActivity = ""
    
    @State private var showingAddActivityCV = false
    
    var body: some View {
        
        
        VStack{
            
            ZStack {
                
                Image("\(categoryImage)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                
                HStack {
                    Spacer()
                    VStack{
                        Spacer()
                        Text("\(categoryName)")
                            .bold()
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }.padding(8)
                
            }.padding(.bottom, 20)
            
            
            
            
            VStack (alignment: .leading){
                
                
                ForEach(activities, id: \.self){ activity in
                    
                    
                    
                    
                    Text("\(activityIcon) \(activity)")
                        .font(.title)
                        .onTapGesture {
                            print("CategoryView: \(activity) clicked")
                            selectedActivity = activity
                            showingCalender.toggle()
                            
                        }
                    
                    if selectedActivity != "目前無團" || selectedActivity == "" {
                        NavigationLink(destination: CalenderCV(activity: "\(selectedActivity)"), isActive: $showingCalender){
                            
                        }
                    }
                }
                
                
            }.padding(.horizontal, 10)
           
            
            
            
        }
        
        Button(action: {
            addNewTour()
            showingAddActivityCV.toggle()
        }){
            
            HStack {
                Image(systemName: "plus.circle")
                Text("新增\(categoryName)地點...")
                    .padding(.leading, 20)
            }
            
        }

        .padding(15)
        
        NavigationLink(destination: AddActivityCV(category: categoryName), isActive: $showingAddActivityCV, label: {})
    }
    
    func addNewTour () {
        print("add")
    }
}

/*
 struct EditCategortView_Previews: PreviewProvider {
 static var previews: some View {
 EditCategortView()
 }
 }
 */
