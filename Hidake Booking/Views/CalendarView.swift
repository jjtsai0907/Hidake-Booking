//
//  CalendarView.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-19.
//

import Foundation
import FSCalendar
import UIKit
import SwiftUI


class calendars: UIViewController, FSCalendarDelegate{
    var calendar = FSCalendar()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calendar.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width)
        view.addSubview(calendar)
    }
    
    
}

struct CalendarController: UIViewControllerRepresentable {
    
    @Binding var selectedDate : Date
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CalendarController>) -> calendars {
        return calendars()
    }

    func updateUIViewController(_ uiViewController: calendars, context: UIViewControllerRepresentableContext<CalendarController>) {
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        selectedDate = date
        print("Hellow \(date)")
    }
    
    
}





/*
let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
calendar.dataSource = self
calendar.delegate = self
view.addSubview(calendar)
self.calendar = calendar
*/
