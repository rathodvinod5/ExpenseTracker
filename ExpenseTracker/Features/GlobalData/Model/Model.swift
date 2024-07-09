//
//  Model.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 09/07/24.
//

import Foundation
import SwiftUI

struct WalletModel: Identifiable {
    var id: UUID;
    var title: String;
    var tag: String;
    var icon: String;
    var backgroundColor: Color
}
