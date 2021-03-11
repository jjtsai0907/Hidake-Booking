//
//  TextFieldView.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-10.
//

import SwiftUI

struct TextFieldView: View {
    
    var placeHolder : String
    @State var textValue : Binding<String>
    @State var color = Color.black.opacity(0.07)
    
    var body: some View {
        
        TextField(placeHolder, text: textValue)
            .disableAutocorrection(true)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(Color("themeBlue")))
            .padding(.horizontal, 20)
    }
}

/*
struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}*/
