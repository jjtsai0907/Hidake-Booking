//
//  ContactSheet.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-04-19.
//

import SwiftUI

struct ContactSheet: View {
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            ContactInfoRow(infoLogo: "☀️", infoContent: "Line: 534rskov")
            //ContactInfoRow(infoLogo: "☀️", infoContent: "Line: 534rskov")
            ContactInfoRow(infoLogo: "☀️", infoContent: "IG: hidake_taiwan")
                .padding(.bottom,20)
            ContactInfoRow(infoLogo: "", infoContent: "需要合作請直接連絡")
            ContactInfoRow(infoLogo: "🦁", infoContent: "創辦人:Leonardo")
            ContactInfoRow(infoLogo: "🔥", infoContent: "Line: wkin0535")
        }
        
    }
}

struct ContactSheet_Previews: PreviewProvider {
    static var previews: some View {
        ContactSheet()
    }
}
