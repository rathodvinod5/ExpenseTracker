//
//  SettingsModalContents.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 05/04/24.
//

import SwiftUI
import Inject

struct SettingsModalContents: View {
    @ObservedObject private var IO = Inject.observer
    
    @State private var contHeight: CGFloat = 36.0
    var closeFullModal: () -> Void
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color(uiColor: .systemGray6))
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                HStack {
                    VStack {
                        Image(systemName: "xmark")
                            .foregroundColor(Color("CustomBlack"))
                            .font(.system(size: 24))
                            .onTapGesture {
                                self.closeFullModal()
                            }
                    }
                    .frame(width: contHeight, height: contHeight)
                    
                    Spacer()
                    VStack{
                        Text("Overview Settings")
                            .textCase(.uppercase)
                            .font(.system(size: 15))
                            .foregroundColor(Color("CustomBlack"))
                    }
                    Spacer()
                    VStack {}
                    .frame(width: contHeight, height: contHeight)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .padding(.horizontal, 13)
                .background(Color.white)
                .shadow(color: Color(UIColor.systemGray3), radius: 15)
                
                VStack {
                    Text("SPENDING")
                        .font(.system(size: 14))
                        .foregroundColor(Color("CustomBlack"))
                        .padding(.bottom, 20)
                    
                    SpendingListItems(title: "Spending", show: true)
                    SpendingListItems(title: "Spending", show: true)
                    SpendingListItems(title: "Spending", show: true)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.white)
                .padding(.top, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        
        .enableInjection()
    }
}

//#Preview {
//    SettingsModalContents()
//}
