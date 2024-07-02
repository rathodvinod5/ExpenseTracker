//
//  CategoryViewModel.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 28/06/24.
//

import Foundation
import Combine
import SwiftUI

class CategoryViewModel: ObservableObject {
//    @Published var allCategories: [String: CategoryModel]
    @Published var parentCategories: [ParentCategoryModel] = [
        ParentCategoryModel(id: UUID(), title: "Miscelleneous", color: Color.yellow, icon: "Misc"),
        ParentCategoryModel(id: UUID(), title: "Entertainment", color: Color.pink, icon: "Movies"),
        ParentCategoryModel(id: UUID(), title: "Transportation", color: Color.purple, icon: "flight"),
        ParentCategoryModel(id: UUID(), title: "Food and Drinks", color: Color.blue, icon: "food"),
        ParentCategoryModel(id: UUID(), title: "Housing", color: Color.yellow, icon: "house"),
        ParentCategoryModel(id: UUID(), title: "Income", color: Color.teal, icon: "money"),
        ParentCategoryModel(id: UUID(), title: "LyfeStyle", color: Color.red, icon: "clothing"),
        ParentCategoryModel(id: UUID(), title: "Savings", color: Color.indigo, icon: "bank")
    ];
    
    
    // init() {
    //     allCategories[]
    // }
}
