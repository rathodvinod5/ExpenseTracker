//
//  CategoryModels.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 28/06/24.
//

import Foundation

struct CategoryModel {
    var id: UUID
    var title: String
    var color: String
    var icon: String
}

struct ParentCategoryModel {
    var id: UUID
    var title: String
    var color: String
    var icon: String
}
