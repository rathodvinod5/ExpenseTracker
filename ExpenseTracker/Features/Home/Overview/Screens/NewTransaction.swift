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
    @State private var isPresented = false
    
    @Binding var showAddNewSheet: Bool
    
    var body: some View {
        let imageSize: CGFloat = 24
        var buttonsArray: [String] = ["EXPENSE", "INCOME", "TRANSFER"]
        
        VStack {
            VStack {
                HStack {
                    Button {
                        withAnimation {
                            showAddNewSheet.toggle()
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: imageSize))
                            .foregroundColor(Color(UIColor.systemGray))
                            .padding(6)
                    }
                    .padding(.leading, 6)
                    Spacer()
                    Text("NEW TRANSACTION")
                        .font(.system(size: 14))
                        .foregroundColor(Color(UIColor.systemGray))
                        .offset(x: -(imageSize / 2), y: 0)
                    Spacer()
                }
                
                VStack {
                    CurrencyInputContainer()
                        .padding(.bottom, 10)
                    
                    SwitchButtons(selectedButton: $currentIndex, buttonsArray: buttonsArray) { indexNumber in
                        withAnimation {
                            currentIndex = indexNumber
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                
                Divider()
                 .frame(height: 1)
                
            }
            
            VStack {

                ListItemComponent(
                    iconName: "archivebox",
                    title: "Category",
                    titleValue: "Miscelleneous",
                    iconBackgroundColor: Color(UIColor.systemGray4),
                    showRightComponent: false
                )
                .onTapGesture {
                    self.isPresented.toggle()
                }
                .fullScreenCover(isPresented: $isPresented) {
                    SelectCategories(isPresented: $isPresented)
                }
                
                Divider().frame(height: 1)
                ListItemComponent(
                    iconName: "archivebox",
                    title: "From",
                    titleValue: "Spending",
                    iconBackgroundColor: Color.teal,
                    showRightComponent: true
                )
                Divider().frame(height: 1)
                ListItemComponentAlt(
                    iconName: "note.text.badge.plus",
                    title: "Note",
                    type: "textbox",
                    iconColor: Color("CustomBlack"),
                    showRightComponent: false
                )
                Divider().frame(height: 1)
                ListItemComponentAlt(
                    iconName: "calendar",
                    title: "Today",
                    type: "plain",
                    iconColor: Color("CustomBlack"),
                    showRightComponent: true
                )
                Divider().frame(height: 1)
                ListItemComponentAlt(
                    iconName: "repeat.circle",
                    title: "Never Repeat",
                    type: "plain",
                    iconColor: Color("CustomBlack"),
                    showRightComponent: false
                )
                Divider().frame(height: 1)
            }
            .padding(.horizontal, 20)
            
            
            Spacer()
        }
        .padding(.vertical, 10)
        
            .enableInjection()
    }
}
