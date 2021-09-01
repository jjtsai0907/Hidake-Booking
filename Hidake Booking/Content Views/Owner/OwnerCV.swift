//
//  OwnerCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-13.
//

import SwiftUI
import Firebase
//import GoogleSignIn

struct OwnerCV: View {
    
    
    // TextValue
    @State private var ownerEmailValue = ""
    @State private var ownerPasswordValue = ""
    @State private var ownerLoggedIn = false
    
    @State private var showingAlert = false
    
    
    var body: some View {
        
        
        
        VStack{
            TextFieldView(placeHolder: "信箱: ", textValue: $ownerEmailValue)
            TextFieldView(placeHolder: "密碼: ", textValue: $ownerPasswordValue)
            
           
            
            Button(action: {
                
                if ownerEmailValue == "HHiiDDaakk2!0" && ownerPasswordValue == "HHiiDDaakk7!3" {
                    ownerLoggedIn = true
                } else {
                    showingAlert = true
                }
                
                
                //ownerLoggedIn = true
               /* Auth.auth().signIn(withEmail: ownerEmailValue, password: ownerPasswordValue) { authResult, error in
                    if let e = error {
                        print(e)
                        
                        
                    }else{
                        print("signed in")
                        print("current user email: \(String(describing: Auth.auth().currentUser?.email))")
                        print("current user uid: \(String(describing: Auth.auth().currentUser?.uid))")
                        
                        ownerLoggedIn = true
                        
                    }
                }*/
                
                /*GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
                
                GIDSignIn.sharedInstance()?.signIn()*/
                
            }){
                Text("登入")
                    .bold()
                    .padding(.horizontal, 40)
                    .padding(.vertical, 8)
                    .foregroundColor(.white)
                
            }.background(Color("themeBlue"))
            .shadow(radius: 25)
            .cornerRadius(10)
            .padding(.top, 30)
            .alert(isPresented: $showingAlert) {
                        Alert(title: Text("BACK OFF"), message: Text("我知道你不是管理員！"), dismissButton: .default(Text("離開!")))
                    }
            
            NavigationLink(destination: TabEditCV(), isActive: $ownerLoggedIn, label: {
                Text("")
            })
            
        }
        
        
        
        
        
    }
}


/*
struct OwnerCV_Previews: PreviewProvider {
    static var previews: some View {
        OwnerCV()
    }
}
*/

