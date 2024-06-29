//
//  CustomBarMark.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 26/06/24.
//

import SwiftUI



struct CustomBarMark: View {
    let data: [(money: String, title: String, height: CGFloat, color: Color)] = [
        ("₹10500", "INCOME", 160,.blue),
        ("₹20200", "EXPENSES", 180,.red),
        ("₹30000", "LEFT", 200,.green)
    ]

    var body: some View {
        BarChartView(data: data)
    }
}
