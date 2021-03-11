//
//  ContentView.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-10.
//

import SwiftUI

struct EntryCV: View {
    
    
    @State private var index = 0
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                // Switch Between Buttons
                HStack {
                    
                    Button(action: {
                        withAnimation(.spring()){
                            index = 0
                        }
                    }){
                        
                        VStack {
                            Text("Login")
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
                            Text("Register")
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
                
            }.padding(.top, 20)
            
            
        }.navigationTitle("")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EntryCV()
    }
}
