//
//  EditMenuCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-14.
//

import SwiftUI

struct EditMenuCV: View {
    
    @State private var showingBooking = false
    
    
    var easyActivities = ["玉山", "嘉明湖", "奇萊山", "雪山"]
    var mediumActivities = ["目前無團"]
    var advancedActivities = ["目前無團"]
    var campingActivities = ["加羅湖", "松蘿湖"]
    var draftingActivities = ["栗松溫泉"]
    
    var body: some View {
        
        
       
            
            List {
                
                
                EditCategortView(categoryImage: "easy", categoryName: "初階百岳", activities: easyActivities, activityIcon: "👨🏻‍🦯")
                
                EditCategortView(categoryImage: "medium", categoryName: "中階百岳", activities: mediumActivities, activityIcon: "🏃🏻‍♂️")
                EditCategortView(categoryImage: "advanced", categoryName: "高階百岳", activities: advancedActivities, activityIcon: "🦊")
                EditCategortView(categoryImage: "camping", categoryName: "露營之旅", activities: campingActivities, activityIcon: "🏖")
                EditCategortView(categoryImage: "waterDrafting", categoryName: "野溪溫泉", activities: draftingActivities, activityIcon: "♨️")
                
                ZStack {
                    Image("camping")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(15)
                    
                    HStack {
                        Spacer()
                        VStack{
                            Spacer()
                            Text("包團")
                                .bold()
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }
                    
                    NavigationLink(
                        destination: Text("Destination"),
                        isActive: $showingBooking,
                        label: {
                            Text("")
                        })
                }.onTapGesture {
                    showingBooking = true
                }
                
            }.padding(.top, 30)
            .navigationTitle("Advantures")
            
    }
}

struct EditMenuCV_Previews: PreviewProvider {
    static var previews: some View {
        EditMenuCV()
    }
}
