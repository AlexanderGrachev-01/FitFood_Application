//
//  FFCalendarModel.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 16.01.2023.
//

import Foundation

class FFCalendarModel {
    private func getDaysArray(date: Date) -> [Date] {
        var daysArr = [Date]()
        for day in -10...10 {
            let day  = date.getDateWithOffset(with: day)
            daysArr.append(day)
        }
        return daysArr
    }
    
    public func getWeeksForCalendar(date: Date) -> [FFDateModel] {
        let daysArr = self.getDaysArray(date: date)
        let dateModelsArr = daysArr.map { $0.convertDateToModel() }
        return dateModelsArr
    }
}
