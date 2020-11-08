//
//  ContentView.swift
//  Habitty
//
//  Created by Amber Spadafora on 11/8/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("Read 15 minutes")
                CheckboxView().frame(width: 45)
            }
            HStack {
                Text("Read 15 minutes")
                CheckboxView().frame(width: 45)
            }
            HStack {
                Text("Read 15 minutes")
                CheckboxView().frame(width: 45)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
