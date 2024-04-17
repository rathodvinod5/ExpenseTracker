//
//  SpendingListItems.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 05/04/24.
//

import SwiftUI
import Inject

struct SpendingListItems: View {
    @ObservedObject private var IO = Inject.observer
    
    var title: String
    var show: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 18))
            
            Rectangle()
                .fill(Color(UIColor.systemGray6))
                .cornerRadius(4)
                .frame(width: 40, height: 40)
                
        }
        .padding(.vertical, 4)
        
        .enableInjection()
    }
}

//#Preview {
//    SpendingListItems()
//}
