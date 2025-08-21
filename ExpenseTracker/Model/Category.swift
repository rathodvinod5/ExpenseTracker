//
//  Category.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 21/08/25.
//
import SwiftData
import Foundation

@Model
class Category {
    var id: UUID
    var name: String
    @Relationship(inverse: \Expense.category) var expenses: [Expense] // Bidirectional relationship

    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
        self.expenses = []
    }
}
