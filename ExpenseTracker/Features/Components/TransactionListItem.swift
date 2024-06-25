//
//  TransactionListItems.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 25/06/24.
//

import SwiftUI
import Inject

struct TransactionListItem: View {
    @ObservedObject private var IO = Inject.observer
    
    var title: String
    
    @State private var isSwitchOn = false
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 18))
                .foregroundColor(Color("CustomBlack"))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            SwitchComponent(isOn: $isSwitchOn)
        }
        .padding(.vertical, 4)
        
        .enableInjection()
    }
}

