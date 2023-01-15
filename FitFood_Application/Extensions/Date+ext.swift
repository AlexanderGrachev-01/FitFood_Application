//
//  Date+ext.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 16.01.2023.
//

import Foundation

extension Date {
    func getDateWithOffset(with offset: Int) -> Date {
        let offsetDate = Calendar.current.date(
            byAdding: .day,
            value: offset,
            to: self
        ) ?? Date()
        return offsetDate
    }
    
    func convertDateToModel() -> FFDateModel {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEEEE"
        
        let numberOfDay = calendar.component(.day, from: self)
        let dayOfWeek = formatter.string(from: self)
        let monthName = self.getMonthFromDate()
        let dateString = self.getDateFormatddMMyyyy()
        
        return FFDateModel(numberOfDay: String(numberOfDay),
                           dayOfWeek: dayOfWeek,
                           monthName: monthName,
                           dateString: dateString)
    }
    
    func getMonthFromDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        
        let monthName = formatter.string(from: self)
        return monthName
    }
    
    func getDateFormatddMMyyyy() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        let format = formatter.string(from: self)
        return format
    }
}
