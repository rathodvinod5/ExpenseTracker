//
//  SpendingListItems.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 05/04/24.
//

import SwiftUI
import Inject

struct SpendingListItems: View {
//    @ObservedObject private var IO = Inject.observer
    
    var title: String
    var show: Bool
    
    @State var hideEye: Bool = false
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 18))
                .foregroundColor(Color("CustomBlack"))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Rectangle()
                    .fill(!hideEye ?  Color(UIColor.systemGray4) : Color(UIColor.systemGray6))
                    .cornerRadius(4)
                    .frame(width: 40, height: 40)
                    .overlay {
                        if hideEye {
                            Image(systemName: "eye.slash.fill")
                                .foregroundColor(Color("CustomBlack"))
                                .font(.system(size: 16))
                        } else {
                            Image(systemName: "eye.fill")
                                .foregroundColor(Color("CustomBlack"))
                                .font(.system(size: 16))
                        }
                    }
                    .onTapGesture {
                        withAnimation {
                            self.hideEye.toggle()
                        }
                    }
                
                Image(systemName: "line.3.horizontal")
                    .foregroundColor(Color(UIColor.systemGray2))
                    .font(.system(size: 22))
            }
            
        }
        .padding(.vertical, 4)
        
//        .enableInjection()
    }
}
