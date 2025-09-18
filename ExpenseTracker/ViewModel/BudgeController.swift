//
//  BudgeController.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 18/09/25.
//

import SwiftData
import Foundation

class BudgeControllerViewModel {
    let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func addExpense(name: String, amount: Double, date: Date, category: Category? = nil) {
        let expense = Expense(name: name, amount: amount, date: date, category: category);
        context.insert(expense);
        try? context.save()
    }
    
    func addMonthlyBudget(month: Int, year: Int, amount: Double) {
        let budget = MonthlyBudget(month: month, year: year, limit: amount);
        context.insert(budget);
        try? context.save()
    }
    
    func addMonthlyBudget(month: Int, year: Int, limit: Double) {
        let monthlyBudget = MonthlyBudget(month: month, year: year, limit: limit)
        context.insert(monthlyBudget)
        try? context.save()
    }
}
