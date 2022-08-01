# FluidToggleStyle

A custom SwiftUI Toggle Style inspired by neumorphic fluid laser animations. Apply it to your existing toggle by simply adding ".toggleStyle(FluidToggle(turnsOff: true, color: Color.blue))". It acts the same in Dark Mode or Light Mode.

Please note that I achieved the soft look by layering multiple shadow modifiers on top of one another. This makes this style slightly more computationally expensive than your average toggle styles. 

The "turnsOff" boolean is for those toggles where the choice is between two different options rather than turning a feature on or off. If "turnsOff" is set to true - the toggle gets rid of color, signalling that something has been turned off. The bottom two examples in the GIF demonstrate what happens if "turnsOff" is set to false.

## Illustration
![](FluidToggle.gif)

## Details
- iOS 15+
- Xcode 13+
- Swift 5+
