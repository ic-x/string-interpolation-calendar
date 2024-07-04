//
//  Localization.swift
//  StringInterpolationCalendar
//
//  Created by Clark Adams on 7/4/24.
//

import Foundation

enum Localization: String, CaseIterable {
    case en_US, zh_CN, es_ES, de_DE, ru_RU
    
    var flag: String {
        switch self {
        case .en_US: return "🇺🇸"
        case .zh_CN: return "🇨🇳"
        case .es_ES: return "🇪🇸"
        case .de_DE: return "🇩🇪"
        case .ru_RU: return "🇷🇺"
        }
    }

    var locale: Locale {
        switch self {
        case .en_US: return Locale(identifier: "en_US")
        case .zh_CN: return Locale(identifier: "zh_CN")
        case .es_ES: return Locale(identifier: "es_ES")
        case .de_DE: return Locale(identifier: "de_DE")
        case .ru_RU: return Locale(identifier: "ru_RU")
        }
    }
    
    var relativeDays: [String] {
        switch self {
        case .en_US: return ["Day before yesterday", "Yesterday", "Today", "Tomorrow", "Day after tomorrow"]
        case .zh_CN: return ["前天", "昨天", "今天", "明天", "后天"]
        case .es_ES: return ["Anteayer", "Ayer", "Hoy", "Mañana", "Pasado mañana"]
        case .de_DE: return ["Vorgestern", "Gestern", "Heute", "Morgen", "Übermorgen"]
        case .ru_RU: return ["Позавчера", "Вчера", "Сегодня", "Завтра", "Послезавтра"]
        }
    }
}
