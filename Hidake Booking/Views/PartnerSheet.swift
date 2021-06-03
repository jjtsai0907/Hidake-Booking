//
//  PartnerSheet.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-05-23.
//

import SwiftUI

struct PartnerSheet: View {
    var body: some View {
        VStack {
            
            HStack {
                Image("food")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            
            Spacer()
        }
        
       
    }
}

struct PartnerSheet_Previews: PreviewProvider {
    static var previews: some View {
        PartnerSheet()
    }
}
