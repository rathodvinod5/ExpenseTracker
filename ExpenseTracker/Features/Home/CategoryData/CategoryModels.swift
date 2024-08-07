//
//  CategoryModels.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 28/06/24.
//

import Foundation
import SwiftUI

struct CategoryModel {
    var id: UUID
    var title: String
    var tag: String
    var color: Color
    var icon: String
    var parentCategory: String
}

struct ParentCategoryModel {
    var id: UUID
    var title: String
    var tag: String
    var color: Color
    var icon: String
    var items: [String]
}
