//
//  CategoryView.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-11.
//

import SwiftUI

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
                                
                                Text("\(activityIcon) \(activity)")
                                    .font(.title)
                                    .onTapGesture {
                                        print("\(activity) clicked")
                                        selectedActivity = activity
                                        showingCalender.toggle()
                                        
                                    }
                                
                                NavigationLink(destination: CalenderCV(activity: "\(selectedActivity)"), isActive: $showingCalender){
                                    
                                }
                            }
                            
                            
                            
                        }
                    }
                }.padding(.horizontal, 10)
                
            }
            
            /*
             if edittingFoodType {
             
             DisclosureGroup("Selected:    \(updatedFoodType)", isExpanded: $edittingFoodType){
             ScrollView{
             VStack{
             
             ForEach(foodTypes, id: \.self){ type in
             Text(type)
             .bold()
             .frame(maxWidth: .infinity)
             .padding(5)
             .onTapGesture {
             self.updatedFoodType = "\(type)"
             print("updatedFoodType: \(self.updatedFoodType)")
             
             }
             
             }
             
             
             }
             
             }.frame(height: 200)
             }
             
             
             }else{
             Text(truckProfileDatas.datas.truckFoodType)
             .padding(.leading, 38)
             }
             */
            
        }.onTapGesture {
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
