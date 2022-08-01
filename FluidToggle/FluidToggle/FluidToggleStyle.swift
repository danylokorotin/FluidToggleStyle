//
//  FluidToggleStyle.swift
//  FluidToggle
//
//  Created by danylo.net on 8/1/22.
//

import Foundation
import SwiftUI

struct FluidToggle: ToggleStyle {
    var turnsOff: Bool = true
    
    let color: Color
    
    var myColorLite: Color {
        return color.lighten(amount: 0.4)
    }
    
    let myGray = Color(UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1))
    
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            
            Ellipse()
                .fill(configuration.isOn ? color : (turnsOff ? myGray : color))
                .frame(width: configuration.isOn ? 22 : 29, height: configuration.isOn ? 22 : 5)
                .offset(x:configuration.isOn ? 11 : -7)
                .animation(.easeOut(duration: 0.23), value: configuration.isOn)
            
            Ellipse()
                .fill(configuration.isOn ? color : (turnsOff ? myGray : color))
                .frame(width: configuration.isOn ? 29 : 22, height: configuration.isOn ? 5 : 22)
                .offset(x:configuration.isOn ? 7 : -11)
                .animation(.easeOut(duration: 0.23), value: configuration.isOn)
            
            RoundedRectangle(cornerRadius: 60)
                .frame(width: 40, height: 5)
                .shadow(color: configuration.isOn ? color.opacity(0.6) : Color.clear, radius: 6, x: 0, y: 0)
            
                .foregroundColor(configuration.isOn ? color : (turnsOff ? myGray : color))
                .animation(.linear(duration: 0.2), value: configuration.isOn)
            
            
            if configuration.isOn {
                Circle()
                    .fill(color)
                    .animation(nil, value: configuration.isOn)
                    .frame(width: 22, height: 22)
                    .offset(x:11)
                    .shadow(color: color, radius: 6, x: 0, y: 0)
                    .transition(.scale)
                    .overlay(
                        Curve()
                            .fill(myColorLite)
                            .frame(width: 22, height: 22)
                            .offset(x:11)
                            .shadow(color: myColorLite, radius: 3, x: 1, y: 1)
                            .shadow(color: myColorLite, radius: 3, x: 1, y: 1)
                            .shadow(color: myColorLite, radius: 3, x: 1, y: 1)
                    )
                
            } else {
                Circle()
                    .fill(turnsOff ? myGray : color)
                    .animation(nil, value: configuration.isOn)
                    .frame(width: 22, height: 22)
                    .offset(x:-11)
                    .shadow(color: turnsOff ? Color.clear : color, radius: 6, x: 0, y: 0)
                    .transition(.scale)
                    .overlay(
                        Curve()
                            .fill(myColorLite)
                            .frame(width: 22, height: 22)
                            .offset(x:-11)
                            .shadow(color: myColorLite, radius: 3, x: 0, y: 0)
                            .shadow(color: myColorLite, radius: 3, x: 0, y: 0)
                            .shadow(color: myColorLite, radius: 3, x: 0, y: 0)
                            .shadow(color: myColorLite, radius: 3, x: 0, y: 0)
                    )
            }
        }
        .animation(.bouncy, value: configuration.isOn)
        .onTapGesture {
            configuration.isOn.toggle()
        }
    }
}
