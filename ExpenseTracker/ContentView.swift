//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 01/03/24.
//

import SwiftUI
import Inject


struct ContentView: View {
    @ObservedObject private var IO = Inject.observer
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.blue
    }
    
    var body: some View {
        
        ZStack {
            Color.purple
                .ignoresSafeArea()
            
            
                TabView {
                    Group {
                        Overview()
                            .tabItem {
                                Label("Overview", systemImage: "eye.fill")
                            }
                            
                        Text("Transaction")
                            .tabItem {
                                Label("Transaction", systemImage: "chart.line.uptrend.xyaxis")
                            }
                        
                        Text("Budget")
                            .tabItem {
                                Label("Budget", systemImage: "circle.circle.fill")
                            }
                        
                        Text("Tools")
                            .tabItem {
                                Label("Tools", systemImage: "briefcase.fill")
                            }
                    }
                    .toolbar(.visible, for: .tabBar)
//                    .toolbarBackground(Color.yellow, for: .tabBar)
                }
                .padding(.top, 10)
                .edgesIgnoringSafeArea(.bottom)
                
        }
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
        .enableInjection()
    }
}

#Preview {
    ContentView()
}

