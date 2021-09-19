//
//  EditCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-13.
//

import SwiftUI

struct TabEditCV: View {
    var body: some View {
        
        TabView {
            
            EditMenuCV()
                .tabItem {
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    Text("編輯目錄")
                }
            
            EditAnnouncementCV()
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("新增公告")
                }
            AddLocationCV()
                .tabItem {
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    Text("新增地點")
                }
        }
        
        
    }
}

struct EditCV_Previews: PreviewProvider {
    static var previews: some View {
        TabEditCV()
    }
}
