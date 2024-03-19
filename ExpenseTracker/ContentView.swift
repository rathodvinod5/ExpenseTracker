//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 01/03/24.
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

struct ContentView: View {
    @ObservedObject private var IO = Inject.observer
    
    @State private var showSheet = false
    @State private var showSettingsSheet = false
    @State private var showTextInput = true
    @State private var selectedButton = 0
    @State private var textInput: String = ""
    
//    @FocusState private var emailFieldIsFocused: Bool = false
    
    init() {
          UIScrollView.appearance().bounces = false
       }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
                .ignoresSafeArea()
            
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
                                        .sheet(isPresented: $showSettingsSheet) {
                                            Text("Hello")
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
                        
                        if showTextInput == true {
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
                            }
                            .padding(.horizontal, 30)
                            .frame(height: 54)
                        } else {
                            HStack {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, weight: .semibold))
                                Spacer()
                                Text("January")
                                    .font(.system(size: 20, weight: .semibold))
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, weight: .semibold))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 20)
                            .frame(height: 54)
                            .background(Capsule().fill(Color.white))
                            .padding(.horizontal, 30)
//                            .overlay(Capsule().stroke(Color.green, lineWidth: 1))
                                
                        }
                        
                    }
                }
                .scrollBounceBehavior(.basedOnSize)
            }
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        
        .enableInjection()
    }
}

#Preview {
    ContentView()
}


