//
//  ContentView.swift
//  Habitty
//
//  Created by Amber Spadafora on 11/8/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//


/*
 TO DO: Handle the case of when it becomes a new day
 */

import SwiftUI

struct ContentView: View {
    
    //@ObservedObject var habits: Habits = Habits(habits: [])
    @ObservedObject var day: Day = Day(date: Date(), number: "", isWithinDisplayedMonth: true, habits: Habits(habits: []))
    
    var habitsCount: Int {
        return self.day.habits.habits.count
        //return self.habits.habits.count
    }
    @State private var isShowingAddView = false
    
    var body: some View {
        GeometryReader { geo in
            
            NavigationView {
                VStack {
                    HStack() {
                        Text(DateFormatter.getFormattedString(from: Date()))
                            .font(.largeTitle).offset(x: 18)
                        Spacer()
                    }
                    
                    HStack() {
                        Text("Today did you...")
                            .font(.title).offset(x: 18)
                        Spacer()
                    }
                    
                    VStack {
                        if self.habitsCount != 0 {
                            List(self.day.habits.habits) { habit in
                                HStack {
                                    Text(habit.description)
                                    Spacer()
                                    CheckboxView(wasTapped: {
                                        self.day.updateTotalCompletedHabits()
                                        habit.isCompleted.toggle()
                                    }).frame(height: 35).padding()
                                }.frame(height: 40)
                            }.environment(\.defaultMinListRowHeight, 45)
                            ProgressView(day: self.day)
                            .frame(width: 250)
                        } else {
                            Spacer()
                            Text("Click the + button to create your first habit").font(.title).padding()
                            Spacer()
                        }
                        
                    }
                    
                }
                    
                .navigationBarTitle("Daily Habits")
                .navigationBarItems(trailing: Button(action: {
                    self.isShowingAddView = true
                }, label: {
                    Image("add").renderingMode(.original)
                }))
                .sheet(isPresented: self.$isShowingAddView) {
                    AddView(habits: self.day.habits)
            }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
