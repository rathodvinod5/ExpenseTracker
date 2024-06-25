//
//  SettingsBlocks.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 25/06/24.
//

import SwiftUI
import Inject

struct SettingsBlocks: View {
    @ObservedObject private var IO = Inject.observer
    
    var blockTitle: String
    var isSpends: Bool = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(blockTitle)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(blockTitle == "Spends" ? Color("CustomBlack") : Color("CustomBlack"))
                .padding(.bottom, 10)
            
            if isSpends {
                SpendingListItems(title: "Breakdown", show: true)
                SpendingListItems(title: "Categories", show: true)
                SpendingListItems(title: "Members Spending", show: true)
            } else {
                TransactionListItem(title: "Show scheduled transaction")
                TransactionListItem(title: "Show member in shared budget")
                TransactionListItem(title: "Show wallet name")
            };
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 24)
        .padding(.leading, 26)
        .padding(.trailing, 20)
        .padding(.bottom, 10)
        .background(Color.white)
        .padding(.top, 30)
        
        .enableInjection()
    }
}
