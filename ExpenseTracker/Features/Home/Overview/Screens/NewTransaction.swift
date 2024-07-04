//
//  NewTransaction.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 02/07/24.
//

import SwiftUI
import Inject

struct NewTransaction: View {
    @ObservedObject private var IO = Inject.observer
    
    @State private var currentIndex = 0
    
    @Binding var showAddNewSheet: Bool
    
    var body: some View {
        let imageSize: CGFloat = 28
        var buttonsArray: [String] = ["EXPENSE", "INCOME", "TRANSFER"]
        
        VStack {
            VStack {
                HStack {
                    Button {
                        showAddNewSheet.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: imageSize))
                            .foregroundColor(Color(UIColor.systemGray))
                            .padding(6)
                    }
                    Spacer()
                    Text("NEW TRANSACTION")
                        .font(.system(size: 14))
                        .foregroundColor(Color(UIColor.systemGray))
                        .offset(x: -(imageSize / 2), y: 0)
                    Spacer()
                }
                Rectangle()
                    .fill(.red)
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
            }
            
            SwitchButtons(selectedButton: $currentIndex, buttonsArray: buttonsArray) { indexNumber in
                withAnimation {
                    currentIndex = indexNumber
                }
            }
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        
            .enableInjection()
    }
}
