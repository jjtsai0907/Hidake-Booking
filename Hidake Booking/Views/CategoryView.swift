//
//  CategoryView.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-11.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct CategoryView: View {
    
    var categoryImage: String
    var categoryName: String
    var activities: [String]
    var activityIcon: String
    @State var showingCalender = false
    @State var selectedActivity = ""
    
    @State var clicked = false
    
    
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
            
            if clicked {
                DisclosureGroup("We offer:", isExpanded: $clicked){
                    ScrollView {
                        VStack (alignment: .leading){
                            
                            
                            ForEach(activities, id: \.self){ activity in
                                
                                HStack {
                                    Text("\(activityIcon) \(activity)")
                                        .font(.title)
                                        .onTapGesture {
                                            
                                            selectedActivity = activity
                                            print("CategoryView: \(activity) clicked")
                                            if selectedActivity != "目前無團"{
                                                showingCalender.toggle()
                                            }
                                            
                                            
                                        }
                                    
                                    
                                    
                                }
                                
                                
                                NavigationLink(destination: CalenderCV(activity: "\(selectedActivity)"), isActive: $showingCalender){
                                    
                                }.hidden()
                            }
                            
                            
                            
                        }
                    }
                }.padding(.horizontal, 10)
                
            }
            
            
        }.onAppear(){
            
            
        }
        .onTapGesture {
            clicked.toggle()
            print("CategoryView:  \(categoryName) pressed!")
        }
        
    }
}


/*
 struct CategoryView_Previews: PreviewProvider {
 static var previews: some View {
 CategoryView()
 }
 }
 */
