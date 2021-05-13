//
//  EditCategortView.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-14.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct EditCategortView: View {
    
    var categoryImage: String
    var categoryName: String
    var activities: [String]
    var activityIcon: String
    @State private var showingAddCalenderCV = false
    //@State private var showingAddActivityCV = false
    @State var selectedActivity = ""
    
    
    
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
                    
                    HStack {
                        Text("\(activityIcon) \(activity)")
                            .font(.title)
                            .onTapGesture {
                                
                                selectedActivity = activity
                                print("CategoryView: \(activity) clicked")
                                
                                if selectedActivity != "目前無團" {
                                    showingAddCalenderCV = true
                                }
                                
                                
                            }
                        
                        
                        
                    }
                    
                    
                    
                    
                    if selectedActivity != "目前無團" {
                        NavigationLink(destination: EditActivityCalenderCV(activityName: selectedActivity), isActive: $showingAddCalenderCV){
                            EmptyView()
                        }.hidden()
                    }
                    
                    
                    
                    
                }
                
                
            }.padding(.horizontal, 10)
            
            
            
            
        }
        /*
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
         
         
         
         NavigationLink(destination: AddActivityCV(category: categoryName), isActive: $showingAddActivityCV, label: {}) */
        
        
        
        
        
       /* NavigationLink(destination: EditActivityCalenderCV(), isActive: $showingAddCalenderCV, label: {})
        */
        
        
        
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
