//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 21/08/25.
//
import SwiftData
import Foundation

@Model
class Expense {
    var id: UUID
    var name: String
    var amount: Double
    var date: Date
    var category: Category? // Optional relationship to Category

    init(
        id: UUID = UUID(),
        name: String,
        amount: Double,
        date: Date = Date.now,
        category: Category? = nil
    ) {
        self.id = id
        self.name = name
        self.amount = amount
        self.date = date
        self.category = category
    }
}
