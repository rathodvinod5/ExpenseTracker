//
//  TextWithLabel.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 22/03/24.
//

import Foundation
import SwiftUI
import UIKit
//import Inject

struct AmountText: View {
//    @ObservedObject private var IO = Inject.observer
    
    let amount: Int
    let text: String

    var body: some View {
        VStack(spacing: 5) {
            Text("\u{20B9}" + String(amount))
                .font(.system(size: 17, weight: .semibold))
            Text(text)
                .font(.system(size: 11))
                .foregroundColor(Color(uiColor: .systemGray))
        }
        
//        .enableInjection()
    }
}
