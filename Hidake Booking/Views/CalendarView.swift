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
import FirebaseFirestore



struct CalendarRepresentable: UIViewRepresentable {
    
    @Binding var category: String
    @Binding var selectedDateActivities: [Activity]
    
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
            formatter.dateFormat = "MM-dd"
            
            if date ==  formatter.date(from: "04-08"){
                return 2
            }
        
            return 0
        }
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            formatter.dateFormat = "MM-dd"
            print("Calender Date:  \(formatter.string(from: date))")
            parent.selectedDate = date
            
            parent.dateString = formatter.string(from: date)
            
            
            print("Calender1")
            
            Firestore.firestore().collection("\(parent.category)\(parent.dateString)").addSnapshotListener { (snap, err) in
                if err != nil {
                    print("CalendarView, get selected date date error: \(String(describing: err))")
                    return
                } else {
                    
                    print("Calender2")
                    if snap != nil {
                        self.parent.selectedDateActivities = []
                        print("Calender3")
                        for i in snap!.documents {
                            
                            print("CalendarView Loop: \(i.data().count)")
                           let result = Result {
                                try i.data(as: Activity.self)
                            }
                            
                            switch result {
                            case .success(let announcement):
                                if let announcement = announcement {
                                    print("CalendarView, getting data from Firebase : \(announcement.groupName)")
                                    self.parent.selectedDateActivities.append(announcement)
                                    print("Calender5")
                                } else {
                                    print("CalendarView, getting data from Firebase : No data")
                                    print("Calender6")
                                }
                            case .failure(let error):
                                print("CalendarView, getting data from Firebase, Error: \(error)")
                            }
                            
                            
                            
                        }
                    }
                    print("Calender4")
                }
            }
            
            
            
            
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
            formatter.dateFormat = "MM-dd"
            guard let example = formatter.date(from: "04-08") else {return nil}
                if date.compare(example) == .orderedSame {
                    return .red
                } else {
                    return nil
                }
            
            
        }
        
    }
    
    
}

