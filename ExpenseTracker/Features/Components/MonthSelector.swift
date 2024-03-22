//
//  MonthSelector.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 22/03/24.
//

import SwiftUI

struct MonthSelector: View {
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
                .font(.system(size: 20, weight: .semibold))
            Spacer()
            Text("January")
                .foregroundColor(Color(red: 58/255, green: 58/255, blue: 60/255))
//                                    .foregroundColor(Color(UIColor.systemBlue))
                .font(.system(size: 20, weight: .semibold))
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.black)
                .font(.system(size: 20, weight: .semibold))
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        .frame(height: 54)
        .background(
            Capsule().fill(Color.white)
                .shadow(color: Color(UIColor.systemGray3), radius: 15)
        )
        .padding(.horizontal, 20)
    }
}

#Preview {
    MonthSelector()
}
