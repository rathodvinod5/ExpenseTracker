//
//  Monthly.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 18/09/25.
//
import Foundation
import SwiftData

@Model
class MonthlyBudget: Identifiable {
    var id: UUID
    var month: Int   // 1-12
    var year: Int
    var limit: Double   // budget limit for that month
    var transactions: [Expense] = []

    init(month: Int, year: Int, limit: Double) {
        self.id = UUID()
        self.month = month
        self.year = year
        self.limit = limit
    }
}
