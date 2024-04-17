//
//  Item.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 27/03/24.
//
import SwiftUI
import Foundation

struct Item: Identifiable {
    let id: UUID
    let category: String
    let name: String
    let title: String
    let amount: Double
}
