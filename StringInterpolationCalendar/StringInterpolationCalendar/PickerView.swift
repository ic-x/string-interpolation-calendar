//
//  PickerView.swift
//  StringInterpolationCalendar
//
//  Created by Clark Adams on 7/4/24.
//

import SwiftUI

struct PickerView: View {
    @StateObject private var viewModel: PickerViewModel = .init()

    var body: some View {
        VStack() {
            VStack(alignment: .leading) {
                DatePicker("Date & Time", selection: $viewModel.selectedDate, displayedComponents: [.date, .hourAndMinute])
                    .font(.headline)
                    .padding(.bottom)
    
                Text("Localization")
                    .font(.headline)
                Picker("Select localization", selection: $viewModel.selectedLocalization) {
                    ForEach(Localization.allCases, id: \.self) { localization in
                        Text(localization.flag).tag(localization)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.bottom)
                
                Text("Date Style")
                    .font(.headline)
                Picker("Select date style", selection: $viewModel.selectedDateStyle) {
                    ForEach(Style.allCases, id: \.self) { style in
                        Text(style.description).tag(style)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.bottom)
                
                Text("Time Style")
                    .font(.headline)
                Picker("Select time style", selection: $viewModel.selectedTimeStyle) {
                    ForEach(Style.allCases, id: \.self) { style in
                        Text(style.description).tag(style)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.bottom)
                
                Toggle("Spell Out", isOn: $viewModel.spellOutOn)
                    .font(.headline)
                    .padding(.bottom)
            }
            .padding(.horizontal)
                        
            ListView(entries: viewModel.dates)
        }
        .padding()
    }
}

#Preview {
    PickerView()
}
