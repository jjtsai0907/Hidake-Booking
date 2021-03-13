//
//  RegisterCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-10.
//

import SwiftUI

struct RegisterCV: View {
    
    // TextValues
    @State private var emailValue = ""
    @State private var passwordValue = ""
    @State private var nameValue = ""
    @State private var lineIDlValue = ""
    
    @State private var registered = false
    
    
    var body: some View {
        
        
        VStack{
            
            TextFieldView(placeHolder: "Google 信箱: ", textValue: $emailValue)
            TextFieldView(placeHolder: "Google 密碼: ", textValue: $passwordValue)
            TextFieldView(placeHolder: "全名: ", textValue: $nameValue)
            TextFieldView(placeHolder: "Line ID: ", textValue: $lineIDlValue)
            
            
            Button(action: {
                print("RegisterCV: Register Button Pressed!")
                registered = true
            }){
                Text("註冊")
                    .padding(.horizontal, 40)
                    .padding(.vertical, 8)
                    .foregroundColor(.white)
                    .font(Font.headline.weight(.bold))
                
            }.background(Color("themeBlue"))
            .shadow(radius: 25)
            .cornerRadius(10)
            .padding(.top, 30)
        }
        
        
        
        
        
        NavigationLink(destination: TabCV(), isActive: $registered, label: {
            Text("")
        })
        
        
    }
}

/*
 struct RegisterCV_Previews: PreviewProvider {
 static var previews: some View {
 RegisterCV()
 }
 }
 */
