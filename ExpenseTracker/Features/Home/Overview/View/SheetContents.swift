//
//  SheetContents.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 09/07/24.
//

import SwiftUI
import Inject

struct SheetContents: View {
    @ObservedObject private var IO = Inject.observer
    @StateObject var walletViewModal: WalletAndTransactionViewModal = WalletAndTransactionViewModal()
    @Binding var selectedWallet: WalletModel
    @Binding var showHalfModal: Bool
    
    var body: some View {
        VStack {
            Text("WALLETS")
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(Color(UIColor.systemGray))
            
            if walletViewModal.allWallets.count > 0 {
                ForEach(walletViewModal.allWallets, id: \.id) { wallet in
                    WalletItemWithIcon(
                        iconName: wallet.icon,
                        title: wallet.title,
                        type: "plain",
                        iconColor: wallet.backgroundColor,
                        showRightComponent: !(wallet.tag == "savings" || wallet.tag == "spending")
                    )
                    .onTapGesture {
                        withAnimation {
                            selectedWallet = wallet
                            showHalfModal.toggle()
                        }
                    }
                }
            }
            
            Button {
                
            } label: {
                Text("Add Wallet")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color("CustomBlack"))
            }
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity)
            .frame(alignment: .leading)
            .background(Color(UIColor.systemGray4))
            .clipShape(Capsule())
            .padding(.top, 20)
        }
        .padding(20)
        
            .enableInjection()
    }
}

