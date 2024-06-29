//
//  CategoryViewModel.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 28/06/24.
//

import Foundation
import Combine

class CategoryViewModel: ObservableObject {
    @Published var allCategories: [String: CategoryModel]
    
    
    // init() {
    //     allCategories[]
    // }
}
