//
//  SelectCategories.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 06/07/24.
//

import SwiftUI
import Inject

struct SelectCategories: View {
    @ObservedObject private var IO = Inject.observer
    @StateObject var categoryViewModel: CategoryViewModel = CategoryViewModel()
    @Binding var isPresented: Bool
    @Binding var selectedCategory: CategoryModel
    @State var hideIconsMap: [String: Bool] = [
        "miscellaneous": true,
        "entertainment": true,
        "foodanddrinks": true,
        "housing": true,
        "income": true,
        "lifestyle": true,
        "savings": true,
        "transportation": true
    ]
    
    var body: some View {
        let allCategories = categoryViewModel.categoriesMap
        
        ZStack {
//            // Background blur effect
//            GlassmorphicBackground()
            
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            GlassmorphicBackgroundNew()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.7)) // Adjust opacity as needed
            
            ScrollView {
                VStack {
                    ZStack {
                        VStack(alignment: .center) {
                            Text("CATEGORIES")
                                .font(.system(size: 14))
                                .foregroundStyle(Color(UIColor.systemGray4))
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        HStack {
                            Image(systemName: "xmark")
                                .foregroundColor(Color(UIColor.systemGray4))
                                .font(.system(size: 22))
                                .padding()
                                .onTapGesture {
                                    isPresented.toggle()
                                }
                                
                            Spacer()
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(Color(UIColor.systemGray4))
                                .font(.system(size: 22))
                                .padding(10)
                                .onTapGesture {
                                    isPresented.toggle()
                                }
                            Image(systemName: "plus")
                                .foregroundColor(Color(UIColor.systemGray4))
                                .font(.system(size: 22))
                                .padding(.vertical)
                                .padding(.leading, 5)
                                .padding(.trailing, 16)
                                .onTapGesture {
                                    isPresented.toggle()
                                }
                        }
                    }
                    
                    VStack {
                        ForEach(allCategories.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                            VStack {
                                Button {
                                    if let status = hideIconsMap[key] {
                                        withAnimation {
                                            hideIconsMap[key] = !status
                                        }
                                    }
                                } label: {
                                    HStack {
                                        Text("\(value.title)")
                                            .font(.headline)
                                            .foregroundColor(Color(UIColor.systemGray6))
                                            .padding(.vertical, 5)
                                        Spacer()
                                        Image(systemName: hideIconsMap[key] == true ? "eye.slash.fill" : "eye.fill")
                                            .foregroundColor(hideIconsMap[key] == true ? Color.white : Color(UIColor.systemGray))
                                            .font(.system(size: 16))
                                            .frame(width: 40, height: 30)
                                    }
                                }
                                
                                Divider()
                                    .frame(height: 1)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.gray)
                                
                                VStack {
                                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
                                        ForEach(value.items, id: \.self) { item in
                                            if let category = categoryViewModel.allCategories[item] {
                                                if hideIconsMap[key] == true {
                                                    VStack {
                                                        Image(systemName: category.icon)
                                                            .font(.system(size: 26))
                                                            .foregroundColor(Color.white)
                                                            .background(
                                                                Circle()
                                                                    .fill(category.color)
                                                                    .frame(width: 50, height: 50)
                                                            )
                                                            .frame(height: 50)
                                                            .onTapGesture {
                                                                selectedCategory = category
                                                                print("selectedCategory: ", selectedCategory)
                                                                isPresented.toggle()
                                                            }
                                                        
                                                        Text("\(category.title)")
                                                            .font(.system(size: 12))
                                                            .foregroundColor(.white)
                                                            .padding(.vertical, 5)
                                                    }
                                                    .frame(height: 70)
                                                }
                                            }
                                        }
                                    }
                                }
                                .padding(.vertical, hideIconsMap[key] == true ? 20 : 0)

                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                }
//                .padding(.horizontal, 20)
            }
            
        }
        
            .enableInjection()
    }
}

struct GlassmorphicBackgroundNew: View {
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.7), Color.gray.opacity(0.4)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            // Blur effect
            VStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.white.opacity(0.1))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .blur(radius: 10)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 30)
//                            .stroke(Color.white.opacity(0.5), lineWidth: 1)
//                    )
            }
        }
    }
}

struct GlassmorphicBackground: View {
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.4), Color.purple.opacity(0.4)]),
                startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            // Blur effect
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.white.opacity(0.2))
                    .frame(height: 300)
                    .blur(radius: 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.white.opacity(0.5), lineWidth: 1)
                    )
                    .padding()
                Spacer()
            }
        }
    }
}
