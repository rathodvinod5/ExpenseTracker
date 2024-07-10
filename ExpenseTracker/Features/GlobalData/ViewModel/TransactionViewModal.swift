//
//  TransactionViewModal.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 10/07/24.
//

import Foundation

class TransactionViewModal: ObservableObject {
    @Published var allTransactions: [TimeInterval: TransactionModel] = [:]
    @Published var allData: [Int: YearModel] = [:]
    
    func getYearMonthDay(from epochTime: TimeInterval) -> (year: Int, month: Int, day: Int)? {
        // Convert epoch time to a Date object
        let date = Date(timeIntervalSince1970: epochTime)
        
        // Create a Calendar instance
        let calendar = Calendar.current
        
        // Extract year, month, and day components from the Date
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        
        // Safely unwrap and return the components
        guard let year = components.year,
              let month = components.month,
              let day = components.day else {
            return nil
        }
        
        return (year, month, day)
    }
    
    
    func addTransaction(transactonAmount: Float, transactionType: TransactonEnum, fromWallet: String,
                        toWallet: String, description: String, category: String) {
        
        let transactionTime: TimeInterval = Date().timeIntervalSince1970
//        let transactionTimeInString: String = String(transactionTime).replacingOccurrences(of: ".", with: "")
        print("epoch: ", transactionTime)
        
        let newTransaction = TransactionModel(
            id: UUID(),
            transactionId: transactionTime,
            transactonAmount: transactonAmount,
            transactionType: transactionType,
            fromWallet: fromWallet,
            toWallet: toWallet,
            description: description,
            category: category
        )
        allTransactions[transactionTime] = newTransaction
        
        if let (year, month, day) = getYearMonthDay(from: transactionTime) {
            print("date: ", year, month, day)
            
            let newDayData = DailyTransactionModel(
                id: UUID(),
                transactionItem: [transactionTime]
            )
            
            if (allData[year] == nil) {
                let newMonthData = MonthModel(
                    id: UUID(),
                    transactionItems: [day : newDayData]
                )
                let newYearData = YearModel(
                    id: UUID(),
                    monthlyTransactionItems: [month : newMonthData]
                )
                allData[year] = newYearData
                print("in fresh")
            } else if(allData[year]?.monthlyTransactionItems[month] == nil) {
                allData[year]?.monthlyTransactionItems[month] = MonthModel(
                    id: UUID(),
                    transactionItems: [day : newDayData]
                )
                print("month is nill: ", allData[year]?.monthlyTransactionItems[month])
            } else if(allData[year]?.monthlyTransactionItems[month]?.transactionItems[day] == nil){
                allData[year]?.monthlyTransactionItems[month]?.transactionItems[day] = newDayData
                print("day is nill: ", allData[year]?.monthlyTransactionItems[month]?.transactionItems[day])
            } else {
                allData[year]?.monthlyTransactionItems[month]?.transactionItems[day]?.transactionItem.append(transactionTime)
                print("everything is present: ", allData[year]?.monthlyTransactionItems[month]?.transactionItems[day]?.transactionItem)
            }
            
        } else {
            return
        }
    }
}
