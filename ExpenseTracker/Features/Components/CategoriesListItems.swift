//
//  CategoriesListItems.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 28/06/24.
//

import SwiftUI
import Inject

struct CategoriesListItems: View {
//    @ObservedObject private var IO = Inject.observer
    
    var title: String
    var totalAmount: Float
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(Color("SecondaryBlack"))
                .fontWeight(.medium)
            Spacer()
            Text(formatCurrency(amount: totalAmount))
                .foregroundColor(Color("CustomBlack"))
        }
        
//            .enableInjection()
    }
    
    func formatCurrency(amount: Float) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "₹" // Set Indian Rupee symbol
        
        // Depending on the requirement, you may set maximumFractionDigits
        formatter.maximumFractionDigits = 2
        
        return formatter.string(from: NSNumber(value: amount)) ?? ""
    }
}
