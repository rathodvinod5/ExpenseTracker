//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 01/03/24.
//

import SwiftUI
import Inject

//extension Color {
//    init(hex: UInt, alpha: Double = 1) {
//        self.init(
//            .sRGB,
//            red: Double((hex >> 16) & 0xff) / 255,
//            green: Double((hex >> 08) & 0xff) / 255,
//            blue: Double((hex >> 00) & 0xff) / 255,
//            opacity: alpha
//        )
//    }
//}
//
struct ContentView: View {
    @ObservedObject private var IO = Inject.observer
    
    var body: some View {
        Overview()
        
        .enableInjection()
    }
}

#Preview {
    ContentView()
}

