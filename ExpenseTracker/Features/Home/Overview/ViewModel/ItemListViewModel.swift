//
//  ItemListViewModel.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 27/03/24.
//
import SwiftUI
import Foundation
import Combine

class ItemListViewModel: ObservableObject {
    @Published var items: [Item] = [
//        Item(id: UUID(), category: "Electronics", name: "Laptop", title: "MacBook Pro", amount: 15000.00),
//        Item(id: UUID(), category: "Clothing", name: "Shirt", title: "Casual Shirt", amount: 29.99),
//        Item(id: UUID(), category: "Books", name: "Book", title: "Swift Programming", amount: 39.99),
//        Item(id: UUID(), category: "Books", name: "Book", title: "Swift Programming", amount: 39.99)
    ]
    
    init () {
        self.items = [
            Item(id: UUID(), category: "Electronics", name: "Laptop", title: "MacBook Pro", amount: 15000.00),
            Item(id: UUID(), category: "Clothing", name: "Shirt", title: "Casual Shirt", amount: 29.99),
            Item(id: UUID(), category: "Books", name: "Book", title: "SwiftUI", amount: 39.99),
            Item(id: UUID(), category: "Books", name: "Book", title: "Java", amount: 39.99),
            Item(id: UUID(), category: "Clothing", name: "Shirt", title: "Casual Shirt", amount: 29.99),
        ]
    }
}
