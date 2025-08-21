//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 01/03/24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    var body: some Scene {
        @StateObject var viewModel = ExpenseViewModel()

        WindowGroup {
            ContentView()
//                .modelContainer(for: )
                .modelContainer(for: Expense.self)
//                .environment(\.modelContext, viewModel.context)
        }
        
    }
}
