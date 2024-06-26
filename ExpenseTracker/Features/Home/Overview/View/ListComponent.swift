//
//  ListComponent.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 26/06/24.
//

import SwiftUI
import Inject

struct ListComponent: View {
    @ObservedObject private var IO = Inject.observer
    @ObservedObject var categoryData: CateogoriesViewModel = CateogoriesViewModel()
    
    
    var body: some View {
        VStack {
            VStack {
                CustomBarMark()
                    .environmentObject(categoryData)
            }
            .frame(maxWidth: .infinity)
            .padding(20)
            .background(.white)
            .cornerRadius(20)
            
            ExpenseContainer()
                .environmentObject(categoryData)
        }
        
            .enableInjection()
    }
    
}
