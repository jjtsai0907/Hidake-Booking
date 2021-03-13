//
//  TabCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-13.
//

import SwiftUI

struct TabCV: View {
    var body: some View {
        
        TabView {
            
        
            MenuCV()
                .tabItem {
                    Image(systemName: "sun.min.fill")
                    Text("行程")
                }
        
            AnnouncementCV()
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("公告")
                }
            
            MeCV()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("我的")
                }
        }
    }
}




struct TabCV_Previews: PreviewProvider {
    static var previews: some View {
        TabCV()
    }
}
