//
//  ContentView.swift
//  FluidToggle
//
//  Created by danylo.net on 8/1/22.
//

import SwiftUI

//MARK: - Please note: fluid animation will not work unless '.animation(.fluidBounce)' is added to the bool assigned to the toggle.

struct ContentView: View {
    
    @State private var flip1 = true
    @State private var flip2 = true
    @State private var flip3 = true
    @State private var flip4 = true
    
    var body: some View {
        VStack {
            Toggle("Toggle Me", isOn: $flip1.animation(.fluidBounce))
                .toggleStyle(FluidToggle(turnsOff: true, color: Color.blue))
                .padding(.vertical)
            Toggle("Toggle Me", isOn: $flip2.animation(.fluidBounce))
                .toggleStyle(FluidToggle(turnsOff: true, color: Color.green))
                .padding(.vertical)
            Toggle("Toggle Me", isOn: $flip3.animation(.fluidBounce))
                .toggleStyle(FluidToggle(turnsOff: false, color: Color.red))
                .padding(.vertical)
            Toggle("Toggle Me", isOn: $flip4.animation(.fluidBounce))
                .toggleStyle(FluidToggle(turnsOff: false, color: Color.yellow))
                .padding(.vertical)
        }.padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
