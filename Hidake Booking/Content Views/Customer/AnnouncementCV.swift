//
//  AnnouncementCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-13.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


struct AnnouncementCV: View {
    
    
    
    
    @ObservedObject var announcements = GetAnnouncements()
    
    var body: some View {
        
        
        List (announcements.announcementList) { announcement in
            
            VStack {
                //truckProfileDatas.datas.logoUrl.load()
                Image(uiImage: announcement.imageURL.load())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .cornerRadius(8)
                HStack {
                    Text("\(announcement.info)")
                        .bold()
                        .font(.title2)
                    Spacer()
                }.padding()
                
                    
                HStack {
                    if announcement.website != "" {
                        Spacer()
                        
                        NavigationLink(destination: Webview(url: announcement.website), label: {
                            Text("前往活動 >>")
                                .bold()
                                .font(.title3)
                                .foregroundColor(.blue)
                        })
                        
                        
                        
                    }
                    
                }.padding(.leading)
                .padding(.bottom)
              
            }.padding(.bottom, 20)
            
            
        }
        
        
    }
}


/*
 struct AnnouncementCV_Previews: PreviewProvider {
 static var previews: some View {
 AnnouncementCV()
 }
 }*/
