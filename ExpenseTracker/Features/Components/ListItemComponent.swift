//
//  ListItemComponent.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 05/07/24.
//

import SwiftUI
import Inject

struct ListItemComponent: View {
    @ObservedObject private var IO = Inject.observer
    
    let iconName: String
    let title: String
    let titleValue: String
    let iconBackgroundColor: Color
    let showRightComponent: Bool
    
    var body: some View {
        HStack {
            Circle()
                .fill(Color(iconBackgroundColor))
                .frame(width: 40, height: 40)
                .overlay {
                    Image(systemName: iconName)
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                }
            Text("\(title): ")
                .font(.system(size: 14))
                .foregroundColor(Color("SecondaryBlack"))
            
            Text(titleValue)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color("CustomBlack"))
            Spacer()

            if showRightComponent {
                Circle()
                    .fill(Color(UIColor.systemGray4))
                    .frame(width: 30, height: 30)
                    .overlay {
                        Image(systemName: "arrow.left.arrow.right")
                            .font(.system(size: 14))
                            .foregroundColor(Color("CustomBlack"))
                    }
            }
        }
        .padding(.top, 10)
        .frame(maxWidth: .infinity)
        
        .enableInjection()
    }
}
