//
//  HeadCategoriesContainer.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 27/06/24.
//

import SwiftUI
import Inject

struct HeadCategoriesContainer: View {
    @ObservedObject private var IO = Inject.observer
    @EnvironmentObject var categoryData: CateogoriesViewModel
    
    @State var showFurtherItems: Bool = false
    @State var itemId: UUID = UUID()
    
//    var categoriesItemsData: [CategoriesModel] = categoryData.categoriesItemsData
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(categoryData.categoriesItemsData) { datum in
                VStack {
                    CategoriesListItems(title: datum.title, totalAmount: datum.totalAmount)
                        .onTapGesture {
                            showFurtherItems.toggle()
                            itemId = datum.id
                        }
                    
                    if showFurtherItems == true && itemId == datum.id {
                        VStack {
                            ForEach(datum.items) { innerItem in
                                CategoriesListItems(title: innerItem.title, totalAmount: innerItem.value)
                            }
                        }
                        .padding(.leading, 8)
                    }
                }
            }
        }
        
            .enableInjection()
    }
}
