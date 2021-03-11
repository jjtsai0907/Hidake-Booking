//
//  MenuCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-11.
//

import SwiftUI

struct MenuCV: View {
    var body: some View {
        
        List {
            CategoryView(categoryImage: "easy", categoryName: "EASY")
            CategoryView(categoryImage: "medium", categoryName: "MEDIUM")
            CategoryView(categoryImage: "advanced", categoryName: "ADVANCED")
            CategoryView(categoryImage: "camping", categoryName: "CAMPING")
            CategoryView(categoryImage: "waterDrafting", categoryName: "DRAFTING")
            
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
