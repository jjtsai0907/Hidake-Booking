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
    
    var body: some View {
        
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
            
            
            
        }.onTapGesture {
            
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
