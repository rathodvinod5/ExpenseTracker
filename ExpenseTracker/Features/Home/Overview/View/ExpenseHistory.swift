//
//  ExpenseHistory.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 22/03/24.
//

import SwiftUI
import Inject

struct ExpenseHistory: View {
    @ObservedObject private var IO = Inject.observer
    
    var body: some View {
        VStack(alignment: .center, spacing: 10.0, content: {
            HStack {
                AmountText(amount: 1234, text: "INCOME")
                Spacer()
                AmountText(amount: 1234, text: "EXPENSE")
                Spacer()
                AmountText(amount: 1234, text: "BALANCE")
            }
            .padding(10)
            .background(Color(uiColor: .systemGray6))
            .cornerRadius(6)
            
            ExpenseListItems(title: "Laptop EMI", amount: 15000, cat: "EMI", catType: "Spending")
            ExpenseListItems(title: "Rent", amount: 20000, cat: "Rent", catType: "Spending")
            ExpenseListItems(title: "Groceries", amount: 5000, cat: "Groceries", catType: "Spending")
            ExpenseListItems(title: "Groceries", amount: 5000, cat: "Groceries", catType: "Spending")
        })
        .padding(16)
        .background(Color.white)
        .cornerRadius(10.0)
        .shadow(color: Color(UIColor.systemGray3), radius: 15)
        .padding(.horizontal, 20)
        .padding(.vertical, 30)
        
        .enableInjection()
    }
}

#Preview {
    ExpenseHistory()
}
