//
//  CustomBarMark.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 26/06/24.
//

import SwiftUI

struct BarChartView: View {
    let data: [(money: String, title: String, height: CGFloat, color: Color)]

    var body: some View {
        HStack(alignment: .bottom) {
            ForEach(data.indices, id: \.self) { index in
                HStack {
                    VStack() {
                        Rectangle()
                            .fill(data[index].color)
                            .frame(width: 60, height: data[index].height)
                            .clipShape(CurvedCornerRectangle(cornerRadius: 30))
                            .shadow(radius: 10)
                        
                        VStack(alignment: .center, spacing: 4) {
                            Text(data[index].money)
                                .font(.system(size: 16, weight: .semibold))
                                .fontWeight(.semibold)
                                .foregroundColor(Color("CustomBlack"))
                            Text(data[index].title)
                                .font(.system(size: 13))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(UIColor.systemGray))
                        }
                        .padding(.horizontal, 4)
                        .padding(.top, 5)
//                        .background(data[index].color)
                        .cornerRadius(4)
                    }
                    
                    if index != data.count - 1 {
                        Spacer()
                    }
                }
            }
        }
    }
}

struct CurvedCornerRectangle: Shape {
    let cornerRadius: CGFloat

    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width
            let height = rect.height

            path.move(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: 0, y: cornerRadius))
            path.addCurve(to: CGPoint(x: cornerRadius, y: 0), control1: CGPoint(x: 0, y: cornerRadius / 2), control2: CGPoint(x: cornerRadius / 2, y: 0))
            path.addLine(to: CGPoint(x: width - cornerRadius, y: 0))
            path.addCurve(to: CGPoint(x: width, y: cornerRadius), control1: CGPoint(x: width - cornerRadius / 2, y: 0), control2: CGPoint(x: width, y: cornerRadius / 2))
            path.addLine(to: CGPoint(x: width, y: height))
        }
    }
}

struct CustomBarMark: View {
    let data: [(money: String, title: String, height: CGFloat, color: Color)] = [
        ("₹10500", "INCOME", 160,.blue),
        ("₹20200", "EXPENSES", 180,.red),
        ("₹30000", "LEFT", 200,.green)
    ]

    var body: some View {
        BarChartView(data: data)
    }
}
