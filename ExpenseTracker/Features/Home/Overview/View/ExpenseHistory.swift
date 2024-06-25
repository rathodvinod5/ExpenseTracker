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
    
    @ObservedObject var expenseViewModelData: ItemListViewModel
    
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
            
            ForEach(expenseViewModelData.items, id: \.id) {item in
                ExpenseListItems(title: item.title, amount: String(item.amount), cat: item.category, catType: item.name)
            }
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
