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
            
            /*EditDetailsSheetCV()
                .tabItem {
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    Text("編輯行程")
                }*/
        }
        
        
    }
}

struct EditCV_Previews: PreviewProvider {
    static var previews: some View {
        TabEditCV()
    }
}
