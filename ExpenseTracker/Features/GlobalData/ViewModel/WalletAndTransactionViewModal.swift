//
//  WalletAndTransactionViewModal.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 09/07/24.
//

import Foundation
import SwiftUI

class WalletAndTransactionViewModal: ObservableObject {
    @Published var allWallets: [WalletModel] = []
    
    
    var colorsMap: [String: Color] = [
        "blue": Color(red: 144/255, green: 202/255, blue: 249/255),
        "gray": Color(UIColor.systemGray4),
        "pink": Color(red: 244/255, green: 143/255, blue: 177/255),
        "lime": Color(red: 205/255, green: 220/255, blue: 57/255),
        "orange": Color(red: 255/255, green: 179/255, blue: 64/255),
        "red": Color(red: 255/255, green: 105/255, blue: 97/255),
        "teal": Color(red: 93/255, green: 230/255, blue: 255/255),
        "purple": Color(red: 191/255, green: 90, blue: 242/255)
    ]
    
    init() {
        initialiseAllWallets()
    }
    
    func initialiseAllWallets(){
        allWallets = [
            WalletModel(
                id: UUID(),
                title: "Spending",
                tag: "spending",
                icon: "wallet.pass.fill",
                backgroundColor: colorsMap["blue"] ?? Color.blue
            ),
            WalletModel(
                id: UUID(),
                title: "Savings",
                tag: "savings",
                icon: "case.fill",
                backgroundColor: colorsMap["teal"] ?? Color.teal
            ),
            WalletModel(
                id: UUID(),
                title: "Credit",
                tag: "credit",
                icon: "creditcard.fill",
                backgroundColor: colorsMap["red"] ?? Color.red
            ),
            WalletModel(
                id: UUID(),
                title: "Purple",
                tag: "purple",
                icon: "indianrupeesign",
                backgroundColor: colorsMap["purple"] ?? Color.purple
            )
        ]
    }
    
}
