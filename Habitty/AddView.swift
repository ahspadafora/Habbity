//
//  AddView.swift
//  Habitty
//
//  Created by Amber Spadafora on 11/9/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var habits: Habits
    @State private var habit: Habit = Habit(description: "")
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter a habit description", text: $habit.description)
                
                Button("Save") {
                    if self.habit.description != "" {
                        self.habits.habits.insert(self.habit, at: 0)
                    }
                    
                    self.presentationMode.wrappedValue.dismiss()
                }
                
            }
            .navigationBarTitle(Text("Add a habit").font(.largeTitle))
        }
    }
}

struct AddView_Previews: PreviewProvider {
    
    static var previews: some View {
        AddView(habits: Habits(habits: [Habit(description: "Drink coffee")]))
    }
}
