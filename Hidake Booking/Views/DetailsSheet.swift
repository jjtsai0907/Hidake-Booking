//
//  DetailsCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-12.
//

import SwiftUI

struct DetailsSheet: View {
    
    @State var showingTour = false
    @State var showingIncludedCost = false
    @State var showingExtraCosts = false
    @State var showingInfo = false
    @State var showingGeers = false
    
    var body: some View {
        
        VStack {
            Image("camping")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(20)
                .padding(.top, 10)
            
            Spacer()
            
            Form {
                
                Section {
                    VStack {
                        Button(action: {
                            showingTour.toggle()
                        }){
                            HStack (alignment: .center){
                                Image(systemName: "sun.max.fill")
                                Text("行程規劃")
                                    .font(.title)
                                    .padding(.top, 8)
                                
                            }.foregroundColor(Color("themeBlue"))
                            
                        }.padding(.vertical, 10)
                        
                        if showingTour {
                            withAnimation{
                                Text("""
                                            第一天
                                            
                                            07:00 台中高鐵集合
                                            09:30 屯原登山口
                                            11:30 雲海保線所 (中餐自理)
                                            14:00 能高越嶺古道8.8K
                                            17:30 天池山莊/晚餐 宿山莊/營地

                                            -
                                            第二天

                                            04:00 - 05:00 天池山莊（早餐、整裝出發）
                                            06:00 能高天池
                                            07:00 奇萊南峰
                                            08:00 能高天池
                                            09:30 南華山
                                            11:00 天池山莊（休息、午餐自理）
                                            12:30 光被八表
                                            14:30 天池山莊
                                            17:30 晚餐 宿山莊/營地

                                            -
                                            第三天

                                            06:00 - 06:30 天池山莊（早餐、整裝出發）
                                            09:30 雲海保線所
                                            11:30 屯原登山口
                                            12:00 下山盥洗
                                            13:30 慶功宴
                                            16:30 台中高鐵
                                            """)
                            }
                        }
                        
                        
                    }
                }
                
                Section {
                    VStack {
                        Button(action: {
                            showingIncludedCost.toggle()
                        }){
                            HStack {
                                Image(systemName: "checkmark")
                                Text("費用包含")
                                    .font(.title)
                            }.foregroundColor(Color("themeBlue"))
                        }.padding(.vertical, 10)
                        
                        
                        if showingIncludedCost {
                            Text("""
✔台中高鐵 屯原登山口來回接駁(送下山盥洗)
✔入山入園代辦行政費用
✔天池山莊兩晚床位/營地費用
✔天池山莊伙食睡袋二晚 二早 一點心
✔專業高山嚮導
✔三日登山險(投保200萬意外險+20萬醫療險)
✔下山慶功宴

""")
                        }
                        
                    }
                }
                
                
                Section {
                    VStack {
                        
                        Button(action: {
                            showingExtraCosts.toggle()
                        }){
                            HStack {
                                Image(systemName: "bubble.left.and.bubble.right")
                                Text("自理費用")
                                    .font(.title)
                            }.foregroundColor(Color("themeBlue"))
                        }.padding(.vertical, 10)
                   
                        if showingExtraCosts {
                            Text("三日午餐")
                            
                        }
                        
                    }
                }
                
                
                Section {
                    VStack {
                        
                        Button(action: {
                            showingGeers.toggle()
                        }){
                            HStack {
                                Image(systemName: "bandage.fill")
                                Text("所需裝備")
                                    .font(.title)
                            }.foregroundColor(Color("themeBlue"))
                        }.padding(.vertical, 10)
                   
                        if showingGeers {
                            Text("")
                            
                        }
                        
                    }
                }
                
                
                Section {
                    VStack {
                        
                        Button(action: {
                            showingInfo.toggle()
                        }){
                            HStack {
                                Image(systemName: "exclamationmark.triangle.fill")
                                Text("注意事項")
                                    .font(.title)
                            }.foregroundColor(.red)
                        }.padding(.vertical, 10)
                   
                        if showingInfo {
                            Text("三日午餐")
                            
                        }
                        
                    }
                }
                
            }
            
        }
        
        
    }
}

struct DetailsCV_Previews: PreviewProvider {
    static var previews: some View {
        DetailsSheet()
    }
}
