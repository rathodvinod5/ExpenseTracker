//
//  SwitchComponent.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 25/06/24.
//

import SwiftUI
import Inject

struct SwitchComponent: View {
    @ObservedObject private var IO = Inject.observer
    
    @Binding var isOn: Bool // Binding to a boolean state variable

        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 15) // Rounded rectangle for tablet-like appearance
                    .frame(width: 45, height: 30) // Adjusted size: width 60, height 30
                    .foregroundColor(isOn ? Color.green : Color.gray) // Green when on, gray when off
                    .onTapGesture {
                        withAnimation {
                            self.isOn.toggle() // Toggle state with animation
                        }
                    }

                RoundedRectangle(cornerRadius: 15) // Inner circle for switch
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24) // Adjusted size: width 26, height 26
                    .offset(x: isOn ? 8 : -8, y: 0) // Move circle based on state
            }
            
            .enableInjection()
        }
}
