//
//  Entry.swift
//  StringInterpolationCalendar
//
//  Created by Clark Adams on 7/4/24.
//

import Foundation

struct Entry: Identifiable {
    let id = UUID()
    var selected: Bool
    
    var heading: String
    var content: String
}
