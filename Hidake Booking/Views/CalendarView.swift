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
    
    @Binding var dateString: String
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> FSCalendar {
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        //calendar.allowsMultipleSelection = true
        
        
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
        var formatter = DateFormatter()
        
        init(_ parent: CalendarRepresentable) {
            self.parent = parent
        }
        
        // Not displaying dates before current day
        func minimumDate(for calendar: FSCalendar) -> Date {
            return Date()
        }
        
        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
            formatter.dateFormat = "yyyy-MM-dd"
            
            if date ==  formatter.date(from: "2021-04-08"){
                return 2
            }
        
            return 0
        }
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            formatter.dateFormat = "yyyy-MM-dd"
            print("Date:  \(formatter.string(from: date))")
            parent.selectedDate = date
            
            parent.dateString = formatter.string(from: date)
        }
        
        func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
            
           // NavigationLink
            
            return true
        }
        
        /*func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
            
        }*/
        
        func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
            print("Cancel Date:  \(formatter.string(from: date))")
        }
        
        
        // show different colour of dates Not working at the moment
        func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDetaultColorFor date: Date) -> UIColor? {
            formatter.dateFormat = "yyyy-MM-dd"
            guard let example = formatter.date(from: "2021-04-08") else {return nil}
                if date.compare(example) == .orderedSame {
                    return .red
                } else {
                    return nil
                }
            
            
        }
        
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
