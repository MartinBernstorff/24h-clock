//
//  Ticks.swift
//  24h clock
//
//  Created by Leisure on 08/11/2020.
//

import Foundation
import SwiftUI

struct Ticks: Shape {
    //1
    let inset: CGFloat
    
    //2
    let minTickHeight: CGFloat
    
    //3
    let hourTickHeight: CGFloat
    
    //4
    let totalTicks = 48
    
    //5
    let hourTickInterval: Int = 4
    
    //6
    func path(in rect: CGRect) -> Path {
        let rect = rect.insetBy(dx: inset, dy: inset)
        var path = Path()
        for index in 0..<totalTicks {
            let condition = index % hourTickInterval == 0
            let height: CGFloat = condition ? hourTickHeight : minTickHeight
            path.move(to: topPosition(for: angle(for: index), in: rect))
            path.addLine(to: bottomPosition(for: angle(for: index), in: rect, height: height))
        }
        return path
    }
    
    //7
    private func angle(for index: Int) -> CGFloat {
        return (2 * .pi / CGFloat(totalTicks)) * CGFloat(index)
    }
    
    //8
    private func topPosition(for angle: CGFloat, in rect: CGRect) -> CGPoint {
        let radius = min(rect.height, rect.width)/2
        let xPosition = rect.midX + (radius * cos(angle))
        let yPosition = rect.midY + (radius * sin(angle))
        return CGPoint(x: xPosition, y: yPosition)
    }
    
    //9
    private func bottomPosition(for angle: CGFloat, in rect: CGRect, height: CGFloat) -> CGPoint {
        let radius = min(rect.height, rect.width)/2
        let xPosition = rect.midX + ((radius - height) * cos(angle))
        let yPosition = rect.midY + ((radius - height) * sin(angle))
        return CGPoint(x: xPosition, y: yPosition)
    }
}
