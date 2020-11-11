//
//  WeekView.swift
//  Habitty
//
//  Created by Amber Spadafora on 11/10/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct WeekView: View {
    
    var weekdays: [Int: String] = [0:"S",
                                   1:"M",
                                   2:"T",
                                   3:"W",
                                   4:"T",
                                   5:"F",
                                   6:"S"
    ]
    
    var week: [Day]
    
    var body: some View {
        HStack {
            ForEach(0..<7) { dayIndex in
                VStack {
                    Text(self.weekdays[dayIndex] ?? "").frame(width: 35)
                    Image("star")
                }
            }
        }.frame(width: 275)

    }
}

struct WeekView_Previews: PreviewProvider {
    
    static var previews: some View {
        let week = [Day(date: Date(), number: "1", isWithinDisplayedMonth: false, habits: Habits(habits: []))]
        return WeekView(week: week)
    }
}
