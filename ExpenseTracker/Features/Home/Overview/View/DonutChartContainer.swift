//
//  DonutChartContainer.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 27/06/24.
//

import SwiftUI

struct DonutChartContainer: View {
    let sections: [(value: Double, color: Color)] = [
            (value: 30, color: .red),
            (value: 20, color: .green),
            (value: 50, color: .blue)
        ]

        var body: some View {
            DonutChart(sections: sections, width: 200, height: 200)
        }
}
