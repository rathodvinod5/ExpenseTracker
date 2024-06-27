//
//  ExpenseContainer.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 26/06/24.
//

import SwiftUI
import Inject

struct ExpenseContainer: View {
    @ObservedObject private var IO = Inject.observer
    
    @State var selectedButton = 0
    var categoriesItemsData: [CategoriesModel]
    
    var body: some View {
        VStack {
            DonutChartContainer()
            
            SwitchButtons(selectedButton: $selectedButton, onTapHandler: { indexNumber in
                    withAnimation {
                        selectedButton = indexNumber
                    }
            })
            .padding(.bottom, 20)
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            if selectedButton == 0 {
                HeadCategoriesContainer()
            } else {
                AllCategoriesContainer()
            }
            
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(.white)
        .cornerRadius(20)
        .padding(.top, 20)
        .onAppear() {
            print("category: \(categoriesItemsData.count)")
        }
        
        
            .enableInjection()
    }
}

