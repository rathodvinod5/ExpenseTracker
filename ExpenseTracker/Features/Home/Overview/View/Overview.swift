//
//  Overview.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 22/03/24.
//

import SwiftUI
import Inject

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct Overview: View {
    @ObservedObject private var IO = Inject.observer
    
    @State private var showSheet = false
    @State private var showSettingsSheet = false
    @State private var showTextInput = false
    @State private var selectedButton = 0
    @State private var textInput: String = ""
    @State private var currentDetent = PresentationDetent.large
    
    @StateObject var expenseViewModelData: ItemListViewModel = ItemListViewModel()
    
//    var bottomPadding: CGFloat
    
//    @FocusState private var emailFieldIsFocused: Bool = false
    
    init() {
          UIScrollView.appearance().bounces = false
       }
    
    func closeSettingsModal() {
        withAnimation(.easeInOut(duration: 0.8)) {
            showSettingsSheet = false
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(uiColor: .systemGray6))
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            Rectangle()
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [Color(hex: 0xce93d8), Color(hex: 0x7b1fa2)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                .frame(height: 170)
                                .overlay(
                                    VStack{
                                        HStack{
                                            Button {
                                                showSettingsSheet.toggle()
                                            } label: {
                                                Image(systemName: "gearshape.fill")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 20, weight: .light))
                                            }
                                            .fullScreenCover(isPresented: $showSettingsSheet) {
                                                SettingsModalContents(
                                                    closeFullModal: self.closeSettingsModal
                                                )
    //                                                .presentationDetents([.medium, .large, .fraction(0.8), .fraction(200)], selection: $currentDetent)
                                            }

                                            
                                            HStack {
                                                Text("Overview: ")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 16))
                                                
                                                Button {
                                                    withAnimation {
                                                        showSheet.toggle()
                                                    }
                                                } label: {
                                                    HStack {
                                                        Text("My Households")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 16, weight: .bold))
                                                        Image(systemName: "chevron.down")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 14, weight: .bold))
                                                    }
                                                }
                                                .sheet(isPresented: $showSheet) {
                                                    Rectangle()
                                                        .presentationDetents([.height(250)])
                                                        .foregroundColor(.white)
                                                }
                                            
                                            }
                                            .padding().frame(maxWidth: .infinity)
                                            
                                            Image(systemName: "magnifyingglass")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20))
                                                .onTapGesture {
                                                    withAnimation {
                                                        showTextInput.toggle()
                                                    }
                                                }
                                        }
                                        .padding(.top, 20)
                                        .padding(.horizontal, 20)
                                        
                                        HStack {
                                            Capsule()
                                                .fill(Color(hex: 0xe1bee7, alpha: selectedButton == 0 ? 0.12 : 0))
                                                .frame(width: 120, height: 34)
                                                .overlay(
                                                    Text("SPENDING")
                                                        .foregroundColor(Color(hex: 0xf5f5f5))
                                                        .font(.system(size: 14).bold())
                                                )
                                                .onTapGesture {
                                                    withAnimation {
                                                        selectedButton = 0
                                                    }
                                                }
                                            Divider()
                                            Capsule()
                                                .fill(Color(hex: 0xe1bee7, alpha: selectedButton == 1 ? 0.12 : 0))
                                                .frame(width: 120, height: 34)
                                                .overlay(
                                                    Text("LIST")
                                                        .foregroundColor(Color(hex: 0xf5f5f5))
                                                        .font(.system(size: 14).bold())
                                                )
                                                .onTapGesture {
                                                    withAnimation {
                                                        selectedButton = 1
                                                    }
                                                }
                                        }
                                        .padding(.bottom, 20)
                                        .padding(.horizontal, 20)
                                        
                                        
                                    }
                                    .safeAreaInset(edge: .top, content: {})
                                    .padding(.top, 15)
                                )
                                .padding(.bottom, 20)
                            
                            if showTextInput {
                                HStack {
                                    TextField(
                                            "Search",
                                            text: $textInput
                                        )
                                    .frame(height: 54)
                                    .padding(.horizontal, 20)
                                    .background(.white)
    //                                .focused($emailFieldIsFocused)
                                    .textInputAutocapitalization(.never)
                                    .disableAutocorrection(true)
                                    .clipShape(Capsule())
                                    .shadow(color: Color(UIColor.systemGray3), radius: 15)
                                }
                                .padding(.horizontal, 20)
                                .frame(height: 54)
                            } else {
                                MonthSelector()
                            }
                            
                            ExpenseHistory(expenseViewModelData: expenseViewModelData)
                            ExpenseHistory(expenseViewModelData: expenseViewModelData)
                        }
    //                    .padding(.bottom, bottomPadding)
    //                    .padding(.bottom, 30)
                        
                    }
                    .padding(.bottom, geometry.safeAreaInsets.bottom)
                    .scrollBounceBehavior(.basedOnSize)
                }
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
        }
        
        .enableInjection()
    }
}

//#Preview {
//    Overview()
//}
