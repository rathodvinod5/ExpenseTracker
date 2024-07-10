//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 10/07/24.
//

import Foundation
import SwiftUI

enum TransactonEnum {
    case expense, income, transfer
}

struct TransactionModel: Identifiable {
    var id: UUID;
    var transactionId: TimeInterval; // epoch time
    var transactonAmount: Float;
    var transactionType: TransactonEnum; // expense/income/transfer
    var fromWallet: String; // input tag of the wallet
    var toWallet: String; // input tag of the wallet
    var description: String;
    var category: String; // category tag
}

struct DailyTransactionModel: Identifiable {
    var id: UUID;
    var transactionItem: [TimeInterval]
}

struct MonthModel: Identifiable {
    var id: UUID;
    var transactionItems: [Int: DailyTransactionModel]
}

struct YearModel: Identifiable {
    var id: UUID;
    var monthlyTransactionItems: [Int: MonthModel]
}

struct AllDataModel: Identifiable {
    var id: UUID;
    var monthlyTransactionItems: [Int: YearModel]
}

