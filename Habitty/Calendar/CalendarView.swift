//
//  CalendarView.swift
//  CalendarView
//
//  Created by Amber Spadafora on 11/9/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct CalendarView: View {

    var weekdays: [Int: String] = [0:"S",
                                   1:"M",
                                   2:"T",
                                   3:"W",
                                   4:"T",
                                   5:"F",
                                   6:"S"
    ]
    
    @ObservedObject var monthFormatter = MonthFormatter(baseDate: Date())
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.monthFormatter.baseDate = MonthFormatter.calendar.date(byAdding: .month, value: -1, to: self.monthFormatter.baseDate) ?? Date()
                }) {
                    Image("left").renderingMode(.original).resizable().frame(width: 45, height: 45)
                }
                Text("\(DateFormatter.getFormattedString(from: self.monthFormatter.baseDate))")
                
                Button(action: {
                    self.monthFormatter.baseDate = MonthFormatter.calendar.date(byAdding: .month, value: +1, to: self.monthFormatter.baseDate) ?? Date()
                }) {
                    Image("right").renderingMode(.original).resizable().frame(width: 45, height: 45)
                }
            }
            
            Text("")
            
            // weekday labels
            HStack {
                ForEach(0..<7) { num in
                    Text(self.weekdays[num] ?? "").frame(width: 50)
                }
            }
            
            // days of the month
            ForEach(self.monthFormatter.displayMonth, id: \.self) { week in
                HStack {
                    // columns
                    ForEach(0..<7) { dayIndex in
                        Text("\(week[dayIndex].number)").frame(width: 50, height: 50)
                    }
                }
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
