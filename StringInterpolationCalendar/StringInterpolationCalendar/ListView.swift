//
//  ListView.swift
//  StringInterpolationCalendar
//
//  Created by Clark Adams on 7/4/24.
//

import SwiftUI

struct ListView: View {
    let entries: [Entry]
    
    var body: some View {
        List(entries) { entry in
            RowView(data: entry)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
        }
        .listStyle(.plain)
    }
}

struct RowView: View {
    let data: Entry
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(data.heading)
                .font(.headline)
            
            Text(data.content)
                .font(.body)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(data.selected ? .blue.opacity(0.2) : .clear)
        )
    }
}

#Preview {
    ListView(entries: [
        Entry(selected: false, heading: "Heading", content: "Some text..."),
        Entry(selected: true, heading: "Selected Heading", content: "Selected text...")
    ])
}
