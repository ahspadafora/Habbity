//
//  MonthFormatter.swift
//  CalendarView
//
//  Created by Amber Spadafora on 11/8/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import Foundation

class MonthFormatter: ObservableObject {
    
    static let calendar = Calendar(identifier: .gregorian)
    // displayMonth is an array of weeks that make the current month (including days from the prev. and next month to fill keep the calendar grid rectangle
    @Published var displayMonth: [[Day]]
    
    var baseDate: Date = Date() {
        didSet {
            self.displayMonth = MonthFormatter.generateDisplayMonth(for: baseDate)
            print(self.displayMonth)
        }
    }
    
    init(baseDate: Date) {
        self.displayMonth = MonthFormatter.generateDisplayMonth(for: baseDate)
    }
    
    // TO-DO: Add an argument for habits 
    static func generateDisplayMonth(for date: Date) -> [[Day]] {
        let month = MonthFormatter.generateDaysInMonth(for: date)
        
        var weeks: [[Day]] = []
        let _ = stride(from: 0, to: month.count, by: 7).map {
            let count = Int(min($0 + 7, month.count))
            weeks.append(Array(month[$0..<count]))
        }
        
        return weeks
    }
    
    static func monthMetaData(for date: Date) throws -> MonthMetaData {
        guard let numberOfDaysInMonth = calendar.range(of: .day, in: .month, for: date)?.count,
            let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: date)) else {
                throw CalendarDataError.metaDataGeneration
        }
        let firstDayWeekday = calendar.component(.weekday, from: firstDayOfMonth)
        return MonthMetaData(numberOfDays: numberOfDaysInMonth, firstDay: firstDayOfMonth, firstDayWeekday: firstDayWeekday)
        
        
    }
    
    static func generateDaysInMonth(for date: Date) -> [Day] {
        guard let metaData = try? monthMetaData(for: date) else {
            fatalError("An error occurred when generating the meta data for \(date)")
        }
        
        let numberOfDaysInMonth = metaData.numberOfDays
        let offSetInFirstRow = metaData.firstDayWeekday
        print("offSetInFirstRow = \(offSetInFirstRow) \n \n")
        let firstDayOfMonth = metaData.firstDay
        print("firstDayOfMonth = \(firstDayOfMonth) \n \n")
        
        var days: [Day] = (1..<(numberOfDaysInMonth + offSetInFirstRow)).map { day in
            // if day is less than offset than it is not in current month
            let isWithinDisplayedMonth = (day >= offSetInFirstRow)
            print("isWithinDisplayedMonth = \(isWithinDisplayedMonth)")
            
            let dayOffset = isWithinDisplayedMonth ? day - offSetInFirstRow : -(offSetInFirstRow - day)
            return generateDay(offsetBy: dayOffset, for: firstDayOfMonth, isWithinDisplayedMonth: isWithinDisplayedMonth)
            
        }
        days += generateStartOfNextMonth(using: firstDayOfMonth)
        return days
    }
    
    static func generateDay(offsetBy dayOffset: Int, for baseDate: Date, isWithinDisplayedMonth: Bool) -> Day {
        let date = calendar.date(byAdding: .day, value: dayOffset, to: baseDate) ?? baseDate
        let dateFormatter = DateFormatter()
        //dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = "d"
        //TO-DO: Inject habits from somewhere
        return Day(date: date, number: dateFormatter.string(from: date), isWithinDisplayedMonth: isWithinDisplayedMonth, habits: Habits(habits: []))
    }
    
    static func generateStartOfNextMonth(using firstDayOfDisplayedMonth: Date) -> [Day] {
        guard let lastDayInMonth = calendar.date(
            byAdding: DateComponents(month: 1, day: -1),
            to: firstDayOfDisplayedMonth)
            else {
                return []
        }
        
        let additionalDays = 7 - calendar.component(.weekday, from: lastDayInMonth)
        guard additionalDays > 0 else {
            return []
        }
        let days: [Day] = (1...additionalDays)
            .map {
                generateDay(
                    offsetBy: $0,
                    for: lastDayInMonth,
                    isWithinDisplayedMonth: false)
        }
        return days
    }
    
    enum CalendarDataError: Error {
        case metaDataGeneration
    }
    
}
