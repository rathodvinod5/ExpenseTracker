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
    
    @StateObject var transactionViewModal: TransactionViewModal = TransactionViewModal()
    @State private var currentIndex = 0
    @State private var isPresented = false
    @State private var showHalfModal: Bool = false
    @State private var showHalfModal2: Bool = false
    @State private var transactionType: String = "expense"
    @State var selectedCategory: CategoryModel = CategoryModel(
        id: UUID(),
        title: "Miscelleneous",
        tag: "miscelleneous",
        color: Color(UIColor.systemGray4),
        icon: "archivebox.fill", 
        parentCategory: "miscelleneous"
    )
    @State var selectedWallet: WalletModel = WalletModel(
        id: UUID(),
        title: "Spending",
        tag: "spending",
        icon: "wallet.pass.fill",
        backgroundColor: Color(UIColor.systemBlue)
    )
    @State var secondarySelectedWallet: WalletModel = WalletModel(
        id: UUID(),
        title: "Spending",
        tag: "spending",
        icon: "wallet.pass.fill",
        backgroundColor: Color(UIColor.systemBlue)
    )
    
    @Binding var showAddNewSheet: Bool
    
//    init() {
//        selectedCategory = categoryViewModel.allCategories["miscelleneous"]!
//    }
    
//    @State private var selectedCategory: CategoryModel = {
//        // Access categoryViewModel here if needed
//        return categoryViewModel.allCategories["miscelleneous"]!
//    }()
    
    var body: some View {
        let imageSize: CGFloat = 24
        let buttonsArray: [String] = ["EXPENSE", "INCOME", "TRANSFER"]
        
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
                    iconName: selectedCategory.icon,
                    title: "Category",
                    titleValue: selectedCategory.title,
                    iconBackgroundColor: selectedCategory.color,
                    showRightComponent: false
                )
                .onTapGesture {
                    withAnimation {
                        self.isPresented.toggle()
                    }
                }
                .fullScreenCover(isPresented: $isPresented) {
                    SelectCategories(isPresented: $isPresented, selectedCategory: $selectedCategory)
                }
                
                    
                Divider().frame(height: 1)
                ListItemComponent(
                    iconName: selectedWallet.icon,
                    title: currentIndex == 1 ? "To" : "From",
                    titleValue: selectedWallet.title,
                    iconBackgroundColor: selectedWallet.backgroundColor,
                    showRightComponent: true
                )
                .onTapGesture {
                    self.showHalfModal.toggle()
                }
                .sheet(isPresented: $showHalfModal) {
                    SheetContents(
                        selectedWallet: $selectedWallet,
                        showHalfModal: $showHalfModal
                    )
                        .padding(.top, -10)
                        .presentationDetents([.medium, .large])
                }
                Divider().frame(height: 1)
                
                if currentIndex == 2 {
                    ListItemComponent(
                        iconName: secondarySelectedWallet.icon,
                        title: "To",
                        titleValue: secondarySelectedWallet.title,
                        iconBackgroundColor: secondarySelectedWallet.backgroundColor,
                        showRightComponent: true
                    )
                    .onTapGesture {
                        self.showHalfModal2.toggle()
                    }
                    .sheet(isPresented: $showHalfModal2) {
                        SheetContents(
                            selectedWallet: $secondarySelectedWallet,
                            showHalfModal: $showHalfModal2
                        )
                            .padding(.top, -10)
                            .presentationDetents([.medium, .large])
                    }
                    Divider().frame(height: 1)
                }
                
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
            
            Capsule()
                .fill(Color("CustomBlack"))
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .frame(alignment: .leading)
                .overlay {
                    Text("SAVE")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(Color.white)
                }
                .onTapGesture {
                    transactionViewModal.addTransaction(
                        transactonAmount: 120,
                        transactionType: TransactonEnum.expense,
                        fromWallet: "Spending",
                        toWallet: "Savings",
                        description: "Testing",
                        category: "miscelleneous"
                    )
                    withAnimation {
                        showAddNewSheet.toggle()
                    }
                }
                .padding(.top, 20)
                .padding(.bottom, 30)
                .padding(.horizontal, 30)
            
        }
        .padding(.vertical, 10)
        
        .enableInjection()
    }
}

