//
//  ProgressView.swift
//  Habitty
//
//  Created by Amber Spadafora on 11/9/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct ProgressView: View {
    
    @ObservedObject var day: Day
    
    var numberOfTotalHabits: Int {
        return day.habits.habits.count
    }
    var numberOfCompletedHabits: Int {
        return day.habits.habits.filter{$0.isCompleted}.count
    }
    
    var percentageOfHabitsComplete: CGFloat {
        return CGFloat(day.habits.totalComplete) / CGFloat(day.habits.habits.count)
    }
    
    var body: some View {
        ZStack {
            Text("\(numberOfCompletedHabits)/\(numberOfTotalHabits) habits done").font(.title)
            Circle().stroke(Color.gray, lineWidth: 12).padding()
            Circle().trim(from: 0.0, to: self.percentageOfHabitsComplete)
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round)).padding().foregroundColor(Color.blue)
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        let day = Day(date: Date(), number: "1", isWithinDisplayedMonth: true, habits: Habits(habits: [Habit(description: "read for 10 mins"), Habit(description: "practice coding")]))
        return ProgressView(day: day)
    }
}
