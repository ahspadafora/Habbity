//
//  ContentView.swift
//  Habitty
//
//  Created by Amber Spadafora on 11/8/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var habits: Habits = Habits(habits: [])
    
    var habitsCount: Int {
        return self.habits.habits.count
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
                            List(self.habits.habits) { habit in
                                HStack {
                                    Text(habit.description)
                                    Spacer()
                                    CheckboxView(wasTapped: {
                                        self.habits.updateTotalComplete()
                                        habit.isCompleted.toggle()
                                    }).frame(height: 35).padding()
                                }.frame(height: 40)
                            }.environment(\.defaultMinListRowHeight, 45)
                        } else {
                            Spacer()
                            Text("Click the + button to create your first habit").font(.title).padding()
                            Spacer()
                        }
                        
                    }
                    
                    ProgressView(numberOfTotalHabits: self.habitsCount, numberOfCompletedHabits: self.habits.totalComplete)
                        .frame(width: 250)
                    Spacer()
                }
                    
                .navigationBarTitle("Daily Habits")
                .navigationBarItems(trailing: Button(action: {
                    self.isShowingAddView = true
                }, label: {
                    Image("add").renderingMode(.original)
                }))
                    .sheet(isPresented: self.$isShowingAddView) {
                        AddView(habits: self.habits)
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
