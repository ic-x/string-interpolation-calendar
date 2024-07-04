//
//  PickerViewModel.swift
//  StringInterpolationCalendar
//
//  Created by Clark Adams on 7/4/24.
//

import Foundation

final class PickerViewModel: ObservableObject {
    @Published var selectedDate: Date = .init()
    @Published var selectedLocalization: Localization = .en_US
    @Published var selectedDateStyle: Style = .short
    @Published var selectedTimeStyle: Style = .short
    @Published var spellOutOn: Bool = false
    
    var dates: [Entry] {
        return [-2, -1, 0, 1, 2].enumerated().compactMap {
            guard let date: Date = Calendar.current.date(byAdding: .day, value: $1, to: selectedDate) else {
                return nil
            }
            
            return Entry(
                selected: $0 == 2,
                heading: selectedLocalization.relativeDays[$0],
                content: "\(date, locale: selectedLocalization.locale, dateStyle: selectedDateStyle.rawStyle, timeStyle: selectedTimeStyle.rawStyle, spellOutOn: spellOutOn)"
            )
        }
    }
}
