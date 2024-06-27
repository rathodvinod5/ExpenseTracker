//
//  AllCategoriesContainer.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 27/06/24.
//

import SwiftUI
import Inject

struct AllCategoriesContainer: View {
    @ObservedObject private var IO = Inject.observer
    
    var body: some View {
        Text("AllCategoriesContainer")
        
            .enableInjection()
    }
}
