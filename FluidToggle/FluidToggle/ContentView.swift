//
//  ContentView.swift
//  FluidToggle
//
//  Created by danylo.net on 8/1/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var flip = true
    
    var body: some View {
        VStack {
            Toggle("Toggle Me", isOn: $flip)
                .toggleStyle(FluidToggle(turnsOff: true, color: Color.blue))
                .padding(.vertical)
            Toggle("Toggle Me", isOn: $flip)
                .toggleStyle(FluidToggle(turnsOff: true, color: Color.green))
                .padding(.vertical)
            Toggle("Toggle Me", isOn: $flip)
                .toggleStyle(FluidToggle(turnsOff: false, color: Color.red))
                .padding(.vertical)
            Toggle("Toggle Me", isOn: $flip)
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
