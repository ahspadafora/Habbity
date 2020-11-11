//
//  CheckboxView.swift
//  Habitty
//
//  Created by Amber Spadafora on 11/8/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct CheckboxView: View {
    @State private var isChecked: Bool = false
    
    var imageName: String {
        return isChecked ? "checked" : "unchecked"
    }
    
    var wasTapped: ()->()
    
    var body: some View {
        Image(imageName).resizable().scaledToFit()
            .onTapGesture {
            self.isChecked.toggle()
                self.wasTapped()
        }
    }
}

struct CheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxView {
            print("was tapped")
        }
    }
}
