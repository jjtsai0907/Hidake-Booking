//
//  MenuCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-11.
//

import SwiftUI

struct MenuCV: View {
    
    @State private var showingBooking = false
    
    var oneDayCategory = ["目前無團"]
    var easyCategory = ["玉山", "嘉明湖", "奇萊山", "雪山"]
    var mediumCategory = ["目前無團"]
    var advancedCategory = ["目前無團"]
    var campingCategory = ["北部", "中部", "東部", "南部"]
    var draftingCategory = ["栗松溫泉"]
    
    var body: some View {
        
        List {
            
            CategoryView(categoryImage: "oneDay", categoryName: "新手登山", activities: oneDayCategory, activityIcon: "🧒🏻")
            CategoryView(categoryImage: "easy", categoryName: "初階百岳", activities: easyCategory, activityIcon: "👨🏻‍🦯")
            CategoryView(categoryImage: "medium", categoryName: "中階百岳", activities: mediumCategory, activityIcon: "🏃🏻‍♂️")
            CategoryView(categoryImage: "advanced", categoryName: "高階百岳", activities: advancedCategory, activityIcon: "🦊")
            CategoryView(categoryImage: "camping", categoryName: "露營之旅", activities: campingCategory, activityIcon: "🏖")
            CategoryView(categoryImage: "hotSpring", categoryName: "野溪溫泉", activities: draftingCategory, activityIcon: "♨️")
            
            ZStack {
                Image("privateGroup")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                
                HStack {
                    Spacer()
                    VStack{
                        Spacer()
                        Text("私人包團")
                            .bold()
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }.navigationTitle("Activities")
                
                NavigationLink(
                    destination: PrivateBookingCV(),
                    isActive: $showingBooking,
                    label: {
                        Text("")
                    })
            }.onTapGesture {
                
                
                showingBooking = true
            }
            
        }.navigationTitle("Activities")
        .padding(.top, 30)
        
        
        
        
    }
}

struct MenuCV_Previews: PreviewProvider {
    static var previews: some View {
        MenuCV()
    }
}
