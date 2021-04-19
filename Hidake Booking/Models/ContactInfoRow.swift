//
//  ContactInfoRow.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-04-19.
//

import SwiftUI

struct ContactInfoRow: View {
    
    var infoLogo: String
    var infoContent: String
    
    var body: some View {
        HStack{
            Image(infoLogo)
            Text(infoContent)
        }
    }
}

/*
struct ContactInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactInfoRow()
    }
}
*/
