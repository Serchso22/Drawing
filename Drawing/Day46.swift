//
//  Day46.swift
//  Drawing
//
//  Created by Jorge Sergio Islas Ramos on 02/10/23.
//

import SwiftUI

struct Arrow: Shape {
    
    var headHeight = 0.5
    var shaftWidth = 0.5
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(headHeight, shaftWidth) }
        set {
            headHeight = newValue.first
            shaftWidth = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        
        let height = rect.height * headHeight
        let thickness = rect.width * shaftWidth / 2
        
        return Path { path in
            path.move(to: CGPoint(x: rect.midX, y: 0))
            path.addLine(to: CGPoint(x: rect.maxX, y: height))
            path.addLine(to: CGPoint(x: rect.midX + thickness, y: height))
            path.addLine(to: CGPoint(x: rect.midX + thickness, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX - thickness, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX - thickness, y: height))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.closeSubpath()
        }
    }
}

struct Day46: View {
    
    @State private var headHeight = 0.5
    @State private var shaftWidth = 0.25
    
    var body: some View {
        Arrow(headHeight: headHeight, shaftWidth: shaftWidth)
            .onTapGesture {
                withAnimation{
                    headHeight = Double.random(in: 0.2...0.8)
                    shaftWidth = Double.random(in: 0.2...0.8)
                }
            }
    }
}

#Preview {
    Day46()
}
