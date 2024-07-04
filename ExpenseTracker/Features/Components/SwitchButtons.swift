//
//  SwitchButtons.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 27/06/24.
//

import SwiftUI

struct SwitchButtons: View {
    @Binding var selectedButton: Int
    let buttonsArray: [String]
    let onTapHandler: (Int) -> Void
    
    var body: some View {
        HStack {
            ForEach(0..<buttonsArray.count, id: \.self) { index in
                Text(buttonsArray[index])
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .foregroundColor(Color("CustomBlack"))
                    .font(.system(size: 11).bold())
                    .background(
                        Capsule()
                            .fill(Color(hex: 0x808080, alpha: selectedButton == Int(index) ? 0.12 : 0))
                    )
                    .onTapGesture {
                        onTapHandler(Int(index))
                    }
                    .id(index)
            }
            
//            Text("HEAD CATEGORIES")
//                .padding(.horizontal, 20)
//                .padding(.vertical, 10)
//                .foregroundColor(Color("CustomBlack"))
//                .font(.system(size: 11).bold())
//                .background(
//                    Capsule()
//                        .fill(Color(hex: 0x808080, alpha: selectedButton == 0 ? 0.12 : 0))
//                )
//                .onTapGesture {
//                    onTapHandler(0)
//                }
//            Spacer()
//            Text("CATEGORIES")
//                .padding(.horizontal, 20)
//                .padding(.vertical, 10)
//                .foregroundColor(Color("CustomBlack"))
//                .font(.system(size: 11).bold())
//                .background(
//                    Capsule()
//                        .fill(Color(hex: 0x808080, alpha: selectedButton == 1 ? 0.12 : 0))
//                )
//                .onTapGesture {
//                    onTapHandler(1)
//                }
        }
    }
}
