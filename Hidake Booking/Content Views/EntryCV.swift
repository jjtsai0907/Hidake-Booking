//
//  ContentView.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-10.
//

import SwiftUI
import Firebase


struct EntryCV: View {
    
    @ObservedObject var info : AppDelegate
    
    @State var userUID = Auth.auth().currentUser?.uid
    
    @State private var index = 0
    @State private var showingOwnerCV = false
    
  
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                //Text(info.email)
                
                //Text(info.customerUID)
                
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                //Spacer()
                
                /*
                // Switch Between Buttons
                HStack {
                    
                    Button(action: {
                        withAnimation(.spring()){
                            index = 0
                        }
                    }){
                        
                        VStack {
                            Text("登入")
                                .bold()
                                .font(.title3)
                                .foregroundColor(index == 0 ? Color("themeBlue") : .gray)
                            
                            ZStack {
                                Capsule()
                                    .fill(Color.black.opacity(0.04))
                                    .frame(height: 4)
                                
                                if index == 0 {
                                    Capsule()
                                        .fill(Color("themeBlue"))
                                        .frame(height: 4)
                                    
                                }
                            }
                        }
                    }
                    
                    
                    
                    Button(action: {
                        withAnimation(.spring()){
                            index = 1
                        }
                    }){
                        
                        VStack {
                            Text("註冊")
                                .bold()
                                .font(.title3)
                                .foregroundColor(index == 1 ? Color("themeBlue") : .gray)
                            
                            ZStack {
                                Capsule()
                                    .fill(Color.black.opacity(0.04))
                                    .frame(height: 4)
                                
                                if index == 1 {
                                    Capsule()
                                        .fill(Color("themeBlue"))
                                        .frame(height: 4)
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                    
                    
                }
                
                Spacer()
                
                if index == 0 {
                    LoginCV()
                } else {
                    RegisterCV()
                }
                
                Spacer()
                */
                
                
                NavigationLink(destination: TabCV(), label: {
                    Text("我要預約行程")
                        .padding(.horizontal, 40)
                        .padding(.vertical, 8)
                        .foregroundColor(.white)
                        .font(Font.headline.weight(.bold))
                    
                }).background(Color("themeBlue"))
                .shadow(radius: 25)
                .cornerRadius(10)
                .padding(.top, 30)
                
                
                
                NavigationLink(destination: OwnerCV(), isActive: $showingOwnerCV, label: {
                    
                })
                
                
                
            
                
            }.padding(.top, 20)
            .navigationTitle("")
            .navigationBarItems(trailing: Button(action: {
                
                
                
                    showingOwnerCV = true
               
                
            }){
                Text("管理員")
            })
            
            
        }
        
    }
}


/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EntryCV()
    }
}
*/
