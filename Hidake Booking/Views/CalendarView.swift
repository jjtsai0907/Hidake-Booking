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


struct CalendarRepresentable: UIViewRepresentable {
    typealias UIViewType = FSCalendar
    var calendar = FSCalendar()
    @Binding var selectedDate: Date
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> FSCalendar {
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        
        
        calendar.appearance.eventDefaultColor = .orange
        //calendar.appearance.eventOffset
        
        
        return calendar
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    
    /*func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        selectedDate = date
        print("Hellow \(date)")
    }*/
    
    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
        var parent: CalendarRepresentable
        
        init(_ parent: CalendarRepresentable) {
            self.parent = parent
        }
        
        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
            
            if date == parent.selectedDate {
                return 1
            }
        
            return 0
        }
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            parent.selectedDate = date
        }
        
        func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
            
           // NavigationLink
            
            return true
        }
        
        /*func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
            
        }*/
        
    }
    
    
}


/*
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
}


*/


/*
let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
calendar.dataSource = self
calendar.delegate = self
view.addSubview(calendar)
self.calendar = calendar
*/
