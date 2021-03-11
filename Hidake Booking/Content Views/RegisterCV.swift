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
            
            TextFieldView(placeHolder: "Google Email: ", textValue: $emailValue)
            TextFieldView(placeHolder: "Password: ", textValue: $passwordValue)
            TextFieldView(placeHolder: "Full Name: ", textValue: $nameValue)
            TextFieldView(placeHolder: "Line ID: ", textValue: $lineIDlValue)
            
            
            Button(action: {
                print("RegisterCV: Register Button Pressed!")
                registered = true
            }){
                Text("Sign Up")
                    .padding(.horizontal, 40)
                    .padding(.vertical, 8)
                    .foregroundColor(.white)
                    .font(Font.headline.weight(.bold))
                
            }.background(Color("themeBlue"))
            .shadow(radius: 25)
            .cornerRadius(10)
            .padding(.top, 30)
        }
        
        
        
        
        
        NavigationLink(destination: MenuCV(), isActive: $registered, label: {
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
