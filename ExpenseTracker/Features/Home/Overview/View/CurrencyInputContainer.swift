//
//  CurrencyInputContainer.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 05/07/24.
//

import SwiftUI

struct CurrencyInputContainer: View {
    @State var amount: String = ""
    @FocusState private var isEditing: Bool
    
    var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "INR" // Set currency code to INR for Indian Rupees
        formatter.locale = Locale(identifier: "en_IN") // Set locale for India
        return formatter
    }
    
    var body: some View {
        HStack {
            Text("₹") // Display rupee symbol
                .font(.title)
                .foregroundColor(Color(UIColor.systemGray)) // Adjust color as needed
                .padding()
                .background(Color(UIColor.systemGray6))
            
            
            TextField("0", value: $amount, formatter: currencyFormatter)
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(Color("SecondaryBlack"))
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad) // Keyboard type set to numbers only
                .frame(height: 50) // Adjust height as needed
//                        .focused($isEditing)
                .onAppear {
                    // Delay showing keyboard with animation
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            self.isEditing = true
                        }
                    }
                }
                .animation(.easeInOut(duration: 0.5)) // Animation for showing keyboard
                .onTapGesture {
                    // Handle tap gesture to trigger focus and show keyboard
                    withAnimation {
                        self.isEditing = true
                    }
                }
        }
        .background(
            RoundedRectangle(cornerRadius: 10).fill(Color.gray).opacity(0)
        )
        .border(Color(UIColor.systemGray6), width: 1)
        .padding(.top, 10)
        
    }
}
