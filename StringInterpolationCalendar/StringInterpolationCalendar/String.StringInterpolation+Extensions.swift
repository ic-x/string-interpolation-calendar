//
//  String.StringInterpolation+Extensions.swift
//  StringInterpolationCalendar
//
//  Created by Clark Adams on 7/4/24.
//

import Foundation

extension String.StringInterpolation {
    mutating func appendInterpolation(_ date: Date, locale: Locale, dateStyle: DateFormatter.Style = .short, timeStyle: DateFormatter.Style = .short, spellOutOn: Bool = false) {
        var formattedDate: String
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateStyle = dateStyle
        dateFormatter.timeStyle = timeStyle
        
        if spellOutOn {
            let dateComponents = dateFormatter.calendar.dateComponents([.day, .month, .year, .weekday, .hour, .minute], from: date)
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .spellOut
            numberFormatter.locale = locale
            
            guard let day = dateComponents.day,
                  let month = dateComponents.month,
                  let year = dateComponents.year,
                  let hour = dateComponents.hour,
                  let minute = dateComponents.minute else {
                appendLiteral("")
                return
            }
            
            guard let daySpelled = numberFormatter.string(from: NSNumber(value: day)),
                  var monthSpelled = numberFormatter.string(from: NSNumber(value: month)),
                  let yearSpelledFull = numberFormatter.string(from: NSNumber(value: year)),
                  let yearSpelledShort = numberFormatter.string(from: NSNumber(value: year % 100)),
                  let hourSpelled = numberFormatter.string(from: NSNumber(value: hour)),
                  let minuteSpelled = numberFormatter.string(from: NSNumber(value: minute)) else {
                appendLiteral("")
                return
            }
            
            let weekdaySpelled: String
            
            if dateStyle == .short {
                monthSpelled = numberFormatter.string(from: NSNumber(value: month))!
            } else {
                dateFormatter.dateFormat = "MMMM"
                monthSpelled = dateFormatter.string(from: date)
            }
            
            if dateStyle == .full {
                dateFormatter.dateFormat = "EEEE"
                weekdaySpelled = dateFormatter.string(from: date)
            } else {
                weekdaySpelled = ""
            }
            
            switch (locale.identifier, dateStyle) {
            case ("en_US", .short):
                formattedDate = "\(monthSpelled) \(daySpelled) \(yearSpelledShort) \(hourSpelled):\(minuteSpelled)"
            case ("en_US", .medium), ("en_US", .full):
                formattedDate = "\(weekdaySpelled) \(monthSpelled) \(daySpelled) \(yearSpelledFull) \(hourSpelled):\(minuteSpelled)"
            case ("es_ES", .short):
                formattedDate = "\(daySpelled) \(monthSpelled) \(yearSpelledShort) \(hourSpelled):\(minuteSpelled)"
            case ("es_ES", .medium), ("es_ES", .full):
                formattedDate = "\(weekdaySpelled) \(daySpelled) \(monthSpelled) \(yearSpelledFull) \(hourSpelled):\(minuteSpelled)"
            case ("fr_FR", _), ("ru_RU", _), ("de_DE", _):
                formattedDate = "\(weekdaySpelled) \(daySpelled) \(monthSpelled) \(yearSpelledFull) \(hourSpelled):\(minuteSpelled)"
            case ("zh_CN", _):
                formattedDate = "\(yearSpelledFull) \(monthSpelled) \(daySpelled) \(weekdaySpelled) \(hourSpelled):\(minuteSpelled)"
            default:
                formattedDate = "\(daySpelled) \(monthSpelled) \(yearSpelledFull) \(hourSpelled):\(minuteSpelled)"
            }
        } else {
            formattedDate = dateFormatter.string(from: date)
        }
        
        appendLiteral(formattedDate)
    }
}
