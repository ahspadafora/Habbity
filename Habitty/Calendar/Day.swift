//
//  Day.swift
//  Habitty
//
//  Created by Amber Spadafora on 11/8/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import Foundation

class MonthMetaData {
    let numberOfDays: Int
    let firstDay: Date
    let firstDayWeekday: Int
    
    init(numberOfDays: Int, firstDay: Date, firstDayWeekday: Int) {
        self.numberOfDays = numberOfDays
        self.firstDay = firstDay
        self.firstDayWeekday = firstDayWeekday
    }
}

class Day: Hashable, ObservableObject {
    static func == (lhs: Day, rhs: Day) -> Bool {
        return lhs.date == rhs.date
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(date)
    }
    
    let date: Date
    
    // the string to display on the calendar
    // to-do: replace with image
    let number: String
    
    
    let isWithinDisplayedMonth: Bool
    var habits: Habits {
        didSet {
            objectWillChange.send()
        }
    }
    
    func updateTotalCompletedHabits() {
        objectWillChange.send()
    }
    
    init(date: Date, number: String, isWithinDisplayedMonth: Bool, habits: Habits) {
        self.date = date
        self.number = number
        self.isWithinDisplayedMonth = isWithinDisplayedMonth
        self.habits = habits
    }
    
}


