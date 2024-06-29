//
//  FloatingButton.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 28/06/24.
//

import SwiftUI

struct FloatingButton: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    // Action when button is tapped
                    print("Button tapped")
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color.black)
                        .background(Color.white)
                        .clipShape(
                            Circle()
                        )
                        .padding(10)
                        .shadow(radius: 5)
                }
                .padding(.trailing, 10)
                .padding(.bottom, 10)
            }
        }
    }
}
