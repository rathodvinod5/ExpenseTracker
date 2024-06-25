//
//  SpendingListItems.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 05/04/24.
//

import SwiftUI
import Inject

struct SpendingListItems: View {
//    @ObservedObject private var IO = Inject.observer
    
    var title: String
    var show: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 18))
                .foregroundColor(Color("CustomBlack"))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Rectangle()
                    .fill(Color(UIColor.systemGray6))
                    .cornerRadius(4)
                    .frame(width: 40, height: 40)
                    .overlay {
                        Image(systemName: "eye.fill")
                            .foregroundColor(Color("CustomBlack"))
                            .font(.system(size: 16))
                    }
                
                Image(systemName: "line.3.horizontal")
                    .foregroundColor(Color(UIColor.systemGray2))
                    .font(.system(size: 22))
            }
            
        }
        .padding(.vertical, 4)
        
//        .enableInjection()
    }
}
