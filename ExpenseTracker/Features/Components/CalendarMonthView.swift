//
//  CalendarMonthView.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 09/07/24.
//

import SwiftUI

struct CalendarMonthView: View {
    let daysInWeek = 7
    let columns = Array(repeating: GridItem(.flexible()), count: 7) // 7 columns for 7 days

    let calendar: Calendar
    @State private var currentDate: Date

    init(calendar: Calendar = .current, date: Date = Date()) {
        self.calendar = calendar
        _currentDate = State(initialValue: date)
    }

    var body: some View {
        VStack {
            Text(monthHeader)
                .font(.title)
                .padding()

            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0..<daysInMonth, id: \.self) { dayIndex in
                    let day = calendar.component(.day, from: startDateOfMonth.adding(days: dayIndex))
                    let isCurrentMonth = calendar.isDate(startDateOfMonth.adding(days: dayIndex), equalTo: startDateOfMonth, toGranularity: .month)
                    
                    Text("\(day)")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(isCurrentMonth ? .primary : .secondary)
                        .padding(5)
                        .background(isCurrentMonth ? Color.blue.opacity(0.2) : nil)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }

    private var monthHeader: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: currentDate)
    }

    private var startDateOfMonth: Date {
        calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate))!
    }

    private var daysInMonth: Int {
        let range = calendar.range(of: .day, in: .month, for: startDateOfMonth)!
        return range.count
    }
}

extension Date {
    func adding(days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: self) ?? self
    }
}
