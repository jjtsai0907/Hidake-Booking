//
//  Row.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-05-31.
//

import SwiftUI

struct Row: View {
    
    var icon: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(title)
        }
        
    }
}

/*struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row()
    }
}*/
