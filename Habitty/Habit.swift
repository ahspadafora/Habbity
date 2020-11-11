//
//  Habit.swift
//  Habitty
//
//  Created by Amber Spadafora on 11/9/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import Foundation

class Habit: ObservableObject, Identifiable {
    var description: String
    @Published var isCompleted: Bool
    var id = UUID()
    
    
    init(description: String) {
        self.description = description
        self.isCompleted = false
    }
}

class Habits: ObservableObject {
//    func updateTotalComplete() {
//        objectWillChange.send()
//    }
    @Published var habits: [Habit]
    
    var totalComplete: Int {
        return habits.filter { $0.isCompleted == true }.count
    }
    init(habits: [Habit]) {
        self.habits = habits
    }
}
