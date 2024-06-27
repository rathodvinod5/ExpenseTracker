//
//  CategoriesModel.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 27/06/24.
//

import SwiftUI
import Foundation

struct CategoryItem: Identifiable {
    let id: UUID
    let title: String
    let value: Double
}

struct CategoriesModel: Identifiable {
    let id: UUID
    let title: String
    let totalAmount: Double
    let items: [CategoryItem]
}
