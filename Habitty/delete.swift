//
//  delete.swift
//  Habitty
//
//  Created by Amber Spadafora on 11/9/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct delete: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, world!").alignmentGuide(.leading, computeValue: {d in d[.trailing]})
            Text("This is a longer line of text")
        }
        .background(Color.red)
        //.frame(width: 400, height: 400)
        .background(Color.blue)
    }
}

struct delete_Previews: PreviewProvider {
    static var previews: some View {
        delete()
    }
}
