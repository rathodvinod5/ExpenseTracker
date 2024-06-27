//
//  DonutChart.swift
//  ExpenseTracker
//
//  Created by Vinod Rathod on 27/06/24.
//

import SwiftUI

struct DonutChart: View {
    @State private var selectedSection: Int?
    let sections: [(value: Double, color: Color)]
    let width: CGFloat
    let height: CGFloat
    let lineWidth: CGFloat = 30 // Adjust as needed

    init(sections: [(value: Double, color: Color)], width: CGFloat, height: CGFloat) {
        self.sections = sections
        self.width = width
        self.height = height
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .foregroundColor(.gray)
                .frame(width: width, height: height)

            GeometryReader { geo in
                ForEach(0..<self.sections.count - 1) { index in
                    let section = self.sections[index]
                    let startAngle = self.angle(for: index)
                    let endAngle = self.angle(for: index + 1)

                    DonutSection(startAngle: startAngle, endAngle: endAngle, lineWidth: self.lineWidth)
                        .fill(section.color)
                        .rotationEffect(Angle(degrees: -90))
                        .onTapGesture {
                            withAnimation {
                                self.selectedSection = index
                            }
                        }
                        .overlay(
                            Text("\(Int(section.value))")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .opacity(self.selectedSection == index ? 1 : 0)
                        )
                        .frame(width: geo.size.width, height: geo.size.height)
                        .offset(x: geo.size.width / 2, y: geo.size.height / 2)
                }
            }
        }
        .frame(width: width, height: height)
        .cornerRadius(width / 2) // Makes it a circle
    }

    private func angle(for index: Int) -> Angle {
        let totalValue = self.sections.reduce(0) { $0 + $1.value }
        let startAngle = index == 0 ? Angle(degrees: 0) : self.angle(for: index - 1)
        let endAngle = startAngle + Angle(degrees: 360 * self.sections[index].value / totalValue)
        return endAngle
    }
}

struct DonutSection: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var lineWidth: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = rect.width / 2
        path.move(to: center)
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)

        return path
    }
}
