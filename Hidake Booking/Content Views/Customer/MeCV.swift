//
//  MeCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-13.
//

import SwiftUI

struct MeCV: View {
    
    @State var showingSuggection = false
    @State var showingAbout = false
    @State var showingContact = false
    
    
    var body: some View {
        Form {
            
            
            Section (header: Text("意見與支援")){
               
                NavigationLink(destination: Webview(url: "https://docs.google.com/forms/d/e/1FAIpQLSdIoVab35aF_I7JILv2HqzcnWNKfwkAT9VjCS3Ef_IVDIyhsg/viewform?usp=pp_url&entry.98179411=g"), isActive: $showingSuggection, label: {Text("給我們意見")})
                        /*.onTapGesture {
                            showingSuggection = true
                        }*/
                NavigationLink(destination: Webview(url: "https://www.hidake.shop/"), isActive: $showingAbout, label: {Text("關於我們")})
                        /*.onTapGesture {
                            showingAbout = true
                        }*/
                        
                    Text("聯絡我們                ")
                        .onTapGesture {
                            showingContact = true
                        }.sheet(isPresented: $showingContact, content: {ContactSheet()})
                
                
                }
                
               
          
            
        }
        
    }
    
}

struct MeCV_Previews: PreviewProvider {
    static var previews: some View {
        MeCV()
    }
}
