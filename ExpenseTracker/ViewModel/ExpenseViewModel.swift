//
//  ExpenseViewModel.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 21/08/25.
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
class ExpenseViewModel: ObservableObject {
    @Query var expenses: [Expense]
    @Environment(\.modelContext) private var context

//    private let context: ModelContext

    init() {
        // Initializes query automatically
//        self.context = context
    }

    func addExpense(title: String, amount: Double) {
        let newExpense = Expense(name: title, amount: amount)
        
        context.insert(newExpense)
        saveContext()
    }

    func deleteExpense(at offsets: IndexSet) {
        for index in offsets {
            let expense = expenses[index]
            context.delete(expense)
        }
        saveContext()
    }

    func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}

