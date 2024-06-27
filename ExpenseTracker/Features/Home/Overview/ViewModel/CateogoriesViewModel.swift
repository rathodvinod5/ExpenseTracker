//
//  CateogoriesViewModel.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 27/06/24.
//
import SwiftUI
import Foundation
import Combine

class CateogoriesViewModel: ObservableObject {
    @Published var categoriesItemsData: [CategoriesModel] = []
    
    init() {
        categoriesItemsData = [
            CategoriesModel(id: UUID(), title: "Housing", totalAmount: 15000,
                items: [
                    CategoryItem(id: UUID(), title: "Rent", value: 22000),
                    CategoryItem(id: UUID(), title: "Telephone", value: 2000)
                ]
            ),
            CategoriesModel(id: UUID(), title: "Income", totalAmount: 15000,
                items: [
                    CategoryItem(id: UUID(), title: "Salary", value: 22000),
                    CategoryItem(id: UUID(), title: "Interest", value: 2000)
                ]
            ),
            CategoriesModel(id: UUID(), title: "Lyfestyle", totalAmount: 15000,
                items: [
                    CategoryItem(id: UUID(), title: "Clothing", value: 22000),
                    CategoryItem(id: UUID(), title: "Travel", value: 2000)
                ]
            ),
            CategoriesModel(id: UUID(), title: "Food and drinks", totalAmount: 15000,
                items: [
                    CategoryItem(id: UUID(), title: "Drinks", value: 22000),
                    CategoryItem(id: UUID(), title: "Groceries", value: 2000)
                ]
            )
        ]
    }
}
