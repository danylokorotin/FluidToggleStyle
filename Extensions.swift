//
//  Extensions.swift
//  FluidToggle
//
//  Created by danylo.net on 8/1/22.
//

import SwiftUI



struct Curve: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let start = CGPoint(x: rect.size.width * 0.1, y: rect.size.height * 0.55)
        let end = CGPoint(x: rect.size.width * 0.6, y:rect.size.height * 0.15)
        
        let mid1 = CGPoint(x: rect.size.width * 0.2, y:rect.size.height * 0.0)
        let mid2 = CGPoint(x: rect.size.width * 0.15, y:rect.size.height * 0.15)
        
        path.move(to: start)
        
        path.addQuadCurve(to: end, control: mid1)
        path.addQuadCurve(to: start, control: mid2)
        
        path.closeSubpath()
        
        return path
    }
}

extension Color {
    func lighten(amount dm: CGFloat) -> Color {
        let color = self
        var (r1, g1, b1, a1) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
        
        let color1 = UIColor(color)
        
        color1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        
        return Color(red: Double(min(r1 + dm, 1)), green: Double(min(g1 + dm, 1)), blue: Double(min(b1 + dm, 1)))
    }
}

extension Animation {
    static var fluidBounce: Animation {
        return .spring(response: 0.7, dampingFraction: 0.3, blendDuration: 0.9)
    }
}
