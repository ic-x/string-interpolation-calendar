//
//  Style.swift
//  StringInterpolationCalendar
//
//  Created by Clark Adams on 7/4/24.
//

import Foundation

enum Style: String, CaseIterable {
    case short, medium, full
    
    var description: String {
        switch self {
        case .short: return "short"
        case .medium: return "medium"
        case .full: return "full"
        }
    }
    
    var rawStyle: DateFormatter.Style {
        switch self {
        case .short: return .short
        case .medium: return .medium
        case .full: return .full
        }
    }
}
