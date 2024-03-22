//
//  ExpenseListItems.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 22/03/24.
//

import SwiftUI
import Inject

struct ExpenseListItems: View {
    @ObservedObject private var IO = Inject.observer
    let title: String
    let amount: Int
    let cat: String
    let catType: String
    
    var body: some View {
        HStack {
            Image(systemName: "paperplane.circle.fill")
                .foregroundColor(.teal)
                .font(.system(size: 48))
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(cat)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(Color(UIColor.systemGray2))
                
                Text(catType)
                    .font(.system(size: 13))
                    .foregroundColor(Color(UIColor.systemGray2))
            }
            .padding(.leading, 6)
            
            Text("\u{20B9}" + String(amount))
                .font(.system(size: 18, weight: .medium))
//                .foregroundColor(Color(red: 58/255, green: 58/255, blue: 60/255))
            
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 2)
        
        .enableInjection()
    }
}

//#Preview {
//    ExpenseListItems(title: "", amount: <#Int#>, cat: <#String#>, catType: <#String#>)
//}
