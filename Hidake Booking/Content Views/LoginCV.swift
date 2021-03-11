//
//  LoginCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-10.
//

import SwiftUI

struct LoginCV: View {
    
    
    // TextValue
    @State private var loginEmailValue = ""
    @State private var loginPasswordValue = ""
    @State private var loggedIn = false
    
    var body: some View {
        
        
        VStack{
            TextFieldView(placeHolder: "Google Email: ", textValue: $loginEmailValue)
            TextFieldView(placeHolder: "Password: ", textValue: $loginPasswordValue)
            
            
            Button(action: {
                loggedIn = true
            
                print("Hey")
                print(loggedIn)
            }){
                Text("Log In")
                    .bold()
                    .padding(.horizontal, 40)
                    .padding(.vertical, 8)
                    .foregroundColor(.white)
                    
            }.background(Color("themeBlue"))
            .shadow(radius: 25)
            .cornerRadius(10)
            .padding(.top, 30)
            
            
            
        }
        
        
        NavigationLink(destination: MenuCV(), isActive: $loggedIn, label: {
            Text("")
        })
        
        
    }
}


/*
struct LoginCV_Previews: PreviewProvider {
    static var previews: some View {
        LoginCV()
    }
}*/
