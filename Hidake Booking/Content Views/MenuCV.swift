//
//  MenuCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-11.
//

import SwiftUI

struct MenuCV: View {
    
    var easyActivities = ["Mt. Jade", "Jia-Ming Lake", "Mt. Chi-Lai", "Mt. Snow"]
    var mediumActivities = ["Mt. El", "Chen-KI Lake"]
    var advancedActivities = ["High Land"]
    var campingActivities = ["Yosemite Park", "Grand Canyon", "Iceland Trail", "Silfa"]
    var draftingActivities = ["Hua-Lian", "Miso", "White Water"]
    
    var body: some View {
        
        List {
            CategoryView(categoryImage: "easy", categoryName: "EASY", activities: easyActivities, activityIcon: "👨🏻‍🦯")
            CategoryView(categoryImage: "medium", categoryName: "MEDIUM", activities: mediumActivities, activityIcon: "🏃🏻‍♂️")
            CategoryView(categoryImage: "advanced", categoryName: "ADVANCED", activities: advancedActivities, activityIcon: "🦊")
            CategoryView(categoryImage: "camping", categoryName: "CAMPING", activities: campingActivities, activityIcon: "🏖")
            CategoryView(categoryImage: "waterDrafting", categoryName: "DRAFTING", activities: draftingActivities, activityIcon: "♨️")
            
        }.padding(.top, 30)
        .navigationTitle("Advantures")
        .navigationBarBackButtonHidden(true)
        
        
    }
}

struct MenuCV_Previews: PreviewProvider {
    static var previews: some View {
        MenuCV()
    }
}
