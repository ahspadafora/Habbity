//
//  ProgressView.swift
//  Habitty
//
//  Created by Amber Spadafora on 11/9/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct ProgressView: View {
    
    var numberOfTotalHabits = 5
    var numberOfCompletedHabits = 5
    
    var percentageOfHabitsComplete: CGFloat {
        return CGFloat(numberOfCompletedHabits) / CGFloat(numberOfTotalHabits)
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
        ProgressView()
    }
}
