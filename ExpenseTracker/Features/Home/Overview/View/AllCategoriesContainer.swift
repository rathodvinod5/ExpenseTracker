//
//  AllCategoriesContainer.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 27/06/24.
//

import SwiftUI
import Inject

struct AllCategoriesContainer: View {
    @ObservedObject private var IO = Inject.observer
    @EnvironmentObject var categoryData: CateogoriesViewModel
    
//    var categoriesItemsData: [CategoriesModel]
    
    var body: some View {
        ForEach(categoryData.categoriesItemsData) { datum in
            VStack(spacing: 10) {
                CategoriesListItems(title: datum.title, totalAmount: datum.totalAmount)
                
                ForEach(datum.items) { innerItem in
                    CategoriesListItems(title: innerItem.title, totalAmount: innerItem.value)
                }
            }
        }
        
            .enableInjection()
    }
}
