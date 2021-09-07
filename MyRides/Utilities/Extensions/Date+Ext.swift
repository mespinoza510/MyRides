//
//  Date+Ext.swift
//  MyRides
//
//  Created by Marco Espinoza on 8/26/21.
//

import Foundation

extension Date {
    
    enum DateType {
        case time, monthAndDay, monthDayYear
    }
    
    func convertDateFormat(to timeFormat: DateType) -> String {
        let dateFormatter = DateFormatter()
        
        switch timeFormat {
        case .time:
            dateFormatter.dateFormat = TimeFormatString.hourAndMinute
        case .monthAndDay:
            dateFormatter.dateFormat = TimeFormatString.monthAndDay
        case .monthDayYear:
            dateFormatter.dateFormat = TimeFormatString.monthDayYear
        }
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: self)
    }
    
    func isSameDay(as date: Date) -> Bool {
        let components1 = Calendar.current.dateComponents([.month, .day, .year], from: self)
        let components2 = Calendar.current.dateComponents([.month, .day, .year], from: date)
        
        return components1.day == components2.day && components1.month == components2.month && components1.year == components2.year
    }
}
