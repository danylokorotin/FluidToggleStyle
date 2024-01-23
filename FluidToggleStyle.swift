//
//  FluidToggleStyle.swift
//  FluidToggle
//
//  Created by danylo.net on 8/1/22.
//

import SwiftUI


//MARK: - Please note API limitation at line 72. Fluid animation will not work unless '.animation(.fluidBounce)' is added to the bool assigned to the toggle.

struct FluidToggle: ToggleStyle {
    let turnsOff: Bool
    
    let color: Color
    
    var myColorLite: Color {
        return color.lighten(amount: 0.4)
    }
    let myGray = Color(UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1))
    
    @State private var linearAnimBool = false
    
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            //right circle when bool is on
            Ellipse()
                .fill(linearAnimBool ? color : (turnsOff ? myGray : color))
                .shadow(color: linearAnimBool ? color : .clear, radius: 6, x: 0, y: 0)
                .frame(width: 22, height: 22)
                .scaleEffect(x: configuration.isOn ? 1 : 1.2, y: configuration.isOn ? 1 : 0.15, anchor: UnitPoint(x: 0.5, y: 0.5))
                .offset(x:configuration.isOn ? 12 : -6)
                .zIndex(linearAnimBool ? 3 : 1)
            
            Curve()
                .fill(linearAnimBool ? myColorLite : .clear)
                .frame(width: configuration.isOn ? 22 : 9, height: configuration.isOn ? 22 : 9)
                .offset(x:configuration.isOn ? 12 : -12)
                .shadow(color: myColorLite, radius: 3, x: 0, y: 0)
                .shadow(color: myColorLite, radius: 3, x: 0, y: 0)
                .shadow(color: myColorLite, radius: 3, x: 0, y: 0)
                .zIndex(4)
            
            //left circle when bool is off
            Ellipse()
                .fill(linearAnimBool ? color : (turnsOff ? myGray : color))
                .shadow(color: turnsOff ? Color.clear : (linearAnimBool ? .clear : color), radius: 6, x: 0, y: 0)
                .frame(width: 22, height: 22)
                .scaleEffect(x: configuration.isOn ? 1.2 : 1, y: configuration.isOn ? 0.15 : 1, anchor: UnitPoint(x: 0.5, y: 0.5))
                .offset(x:configuration.isOn ? 6 : -12)
                .zIndex(linearAnimBool ? 1 : 3)
            
            Curve()
                .fill(linearAnimBool ? .clear : myColorLite)
                .frame(width: configuration.isOn ? 9 : 22, height: configuration.isOn ? 9 : 22)
                .offset(x:configuration.isOn ? 0 : -12)
                .shadow(color: myColorLite, radius: 3, x: 0, y: 0)
                .shadow(color: myColorLite, radius: 3, x: 0, y: 0)
                .shadow(color: myColorLite, radius: 3, x: 0, y: 0)
                .zIndex(4)
            
            RoundedRectangle(cornerRadius: 60)
                .frame(width: 40, height: 5)
                .shadow(color: turnsOff ? (linearAnimBool ? color : Color.clear) : color, radius: 6, x: 0, y: 0)
                .foregroundColor(linearAnimBool ? color : (turnsOff ? myGray : color))
                .animation(.linear, value: linearAnimBool)
                .zIndex(2)
            
        }
        .animation(.easeIn(duration: 0.2), value: linearAnimBool)
        //MARK: - Animation API limitation
        //In order for the animation to work correctly, you have to add '.animation(.fluidBounce)' to the bool that's assigned to the toggle. In an ideal world the line commented out below will replace that need but SwiftUI seems to be an incomplete framework. As it currently stands, if you don't add the above code to the bool itself, the color changing animation will also use the 'fluidBounce' animation even though those state changes have been differentiated via the 'configuration.isOn' vs 'linearAnimBool'.
        //.animation(.fluidBounce, value: configuration.isOn)
        
        .onAppear(){
            if configuration.isOn == true {
                linearAnimBool = true
            } else {
                linearAnimBool = false
            }
        }
        
        .onTapGesture {
            configuration.isOn.toggle()
            linearAnimBool.toggle()
        }
        
    }
}
