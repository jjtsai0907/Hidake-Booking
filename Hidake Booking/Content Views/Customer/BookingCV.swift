//
//  BookingCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-04-09.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct BookingCV: View {
    @Binding var bookingCategory: String
    var db = Firestore.firestore()
    
    var body: some View {
        
        if bookingCategory == "奇萊山" {
            Webview(url: "https://docs.google.com/forms/d/e/1FAIpQLScyAzaWzjCE8iRi-49PD0a1o7SDDjlkfbCV7Ymc63VPS9TT4Q/viewform?entry.1022174772=%E6%98%AF,+%E6%88%91%E5%90%8C%E6%84%8F%E3%80%82")
        } else if bookingCategory == "玉山" {
            
            Webview(url:"https://docs.google.com/forms/d/e/1FAIpQLSdH3q2i7mTa-1rvlECVigSLMPthnRfz0DOQ723CjpGsd5q3lA/viewform?usp=pp_url&entry.1022174772=%E6%98%AF,+%E6%88%91%E5%90%8C%E6%84%8F%E3%80%82")
        } else if bookingCategory == "雪山" {
            Webview(url:"https://docs.google.com/forms/d/e/1FAIpQLSf6fhOXAIdGWGHvc2yOkZYJ4IfoNMF-eruCqaylVkuhpRLZzw/viewform?usp=pp_url&entry.1022174772=%E6%98%AF,+%E6%88%91%E5%90%8C%E6%84%8F%E3%80%82")
            
        } else if bookingCategory == "嘉明湖" {
            Webview(url:"https://docs.google.com/forms/d/e/1FAIpQLSd7If1XnVNrgrjZ04RE18_XmGI_gqeJz29TgQsT3vmy2grKkQ/viewform?usp=pp_url&entry.1022174772=%E6%98%AF,+%E6%88%91%E5%90%8C%E6%84%8F%E3%80%82")
        } else if bookingCategory == "加羅湖" {
            
            Webview(url:"https://docs.google.com/forms/d/e/1FAIpQLSejtSZeUoMpC9g0ABWsf9-qLOFCvx5PZUZ2SlB4Te4E3ecq6Q/viewform?usp=pp_url&entry.2068587343=%E6%98%AF,+%E6%88%91%E5%90%8C%E6%84%8F%E3%80%82")
        } else if bookingCategory == "松蘿湖" {
            
            Webview(url:"https://docs.google.com/forms/d/e/1FAIpQLSdr8cyUemMjaHeXFHIEQ7FF0tCgkK6uRqTSrmsxXl46xo9LHg/viewform?usp=pp_url&entry.2068587343=%E6%98%AF,+%E6%88%91%E5%90%8C%E6%84%8F%E3%80%82")
        }
     else if bookingCategory == "北部" {
        
        Webview(url:"https://docs.google.com/forms/d/e/1FAIpQLSfLv-AiNxAbJRMb8fH7UdxzxmLbsNiyQouNgYqJR8c8xHqUFw/viewform?usp=pp_url&entry.1223179306=%E9%81%B8%E9%A0%85+1")
    }
     else if bookingCategory == "中部" {
        
        Webview(url:"https://docs.google.com/forms/d/e/1FAIpQLSe3LUjKVeW_sVzYYmyRIF-SS7BMqqoxuiB42a-G8OQqeFCPbw/viewform?usp=pp_url&entry.452315444=05/17+-+05/18%EF%BC%88%E6%88%90%E5%9C%98%E5%8F%AF%E5%A0%B1%E5%90%8D%EF%BC%89")
    }
     else if bookingCategory == "南部" {
        
        Webview(url:"https://docs.google.com/forms/d/e/1FAIpQLSc-PeFcjKfRz1g0h3ecpoVJn-EKTY1uu8G05--rU3ZJgR2G-w/viewform?usp=pp_url&entry.1223179306=%E9%81%B8%E9%A0%85+1")
    }
     else if bookingCategory == "東部" {
        
        Webview(url:"https://docs.google.com/forms/d/e/1FAIpQLSd30MWpcarVE2itnXwewOVfyexhrr0Rfy3K9t2ZsxrDR5Sw8Q/viewform?usp=pp_url&entry.1558471817=%E5%90%A6(%E8%91%B7%E9%A3%9F)")
    }
        
        
        
        else {
            Webview(url:"https://www.hidake.shop/")
            
            
        
        }
        
        
    }
    
}

/*
struct BookingCV_Previews: PreviewProvider {
    static var previews: some View {
        BookingCV()
    }
}
 
 
*/
