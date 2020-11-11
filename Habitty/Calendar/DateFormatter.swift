//
//  DateFormatter.swift
//  Habitty
//
//  Created by Amber Spadafora on 11/10/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static func getFormattedString(from date: Date) -> String {
        var dateFormatter: DateFormatter {
            let df = DateFormatter()
            df.dateFormat = "MMMM dd YYYY"
            return df
        }
        return dateFormatter.string(from: date)
    }
    
}
