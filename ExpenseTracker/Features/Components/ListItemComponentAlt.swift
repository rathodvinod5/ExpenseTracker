//
//  ListItemComponentAlt.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 05/07/24.
//

import SwiftUI
import Inject

struct ListItemComponentAlt: View {
    @ObservedObject private var IO = Inject.observer
    @State var textInput: String = ""
    
    let iconName: String
    let title: String
    let type: String
    let iconColor: Color
    let showRightComponent: Bool
    let rightIcon: String = "arrow.left.arrow.right"
    
    var body: some View {
        HStack {
            Circle()
                .fill(Color.white)
                .frame(width: 40, height: 40)
                .overlay {
                    Image(systemName: iconName)
                        .font(.system(size: 20))
                        .foregroundColor(Color("CustomBlack"))
                }
            
            if type == "textbox" {
                TextField(title, text: $textInput)
                    .font(.system(size: 16))
                    .frame(maxWidth: .infinity)
                    .frame(height: 34)
            } else {
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(Color("SecondaryBlack"))
                
                Spacer()

                if showRightComponent {
                    Circle()
                        .fill(Color(UIColor.systemGray4))
                        .frame(width: 30, height: 30)
                        .overlay {
                            Image(systemName: rightIcon)
                                .font(.system(size: 14))
                                .foregroundColor(Color("CustomBlack"))
                        }
                }
            }
        }
        .padding(.top, 10)
        .frame(maxWidth: .infinity)
        
        .enableInjection()
    }
}

