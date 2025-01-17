import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

//
/// **
// This file provides default fiori style for the component.
//
// 1. Uncomment fhe following code.
// 2. Implement layout and style in corresponding places.
// 3. Delete `.generated` from file name.
// 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
// */
//
// Base Layout style
public struct SegmentedControlPickerBaseStyle: SegmentedControlPickerStyle {
    public func makeBody(_ configuration: SegmentedControlPickerConfiguration) -> some View {
        Picker("", selection: configuration.$selectedIndex) {
            ForEach(0 ..< configuration.options.count, id: \.self, content: { index in
                Text(configuration.options[index])
            })
        }
        .pickerStyle(.segmented)
    }
}
    
// Default fiori styles
extension SegmentedControlPickerFioriStyle {
    struct ContentFioriStyle: SegmentedControlPickerStyle {
        func makeBody(_ configuration: SegmentedControlPickerConfiguration) -> some View {
            let appearance = UISegmentedControl.appearance()
            appearance.selectedSegmentTintColor = Color.preferredColor(.primaryBackground).uiColor()
            appearance.backgroundColor = Color.preferredColor(.tertiaryFill).uiColor()
            appearance.setTitleTextAttributes([.foregroundColor: Color.preferredColor(.primaryLabel).uiColor(), .font: UIFont.preferredFioriFont(forTextStyle: .footnote, weight: .semibold)], for: .selected)
            appearance.setTitleTextAttributes([.foregroundColor: Color.preferredColor(.primaryLabel).uiColor(), .font: UIFont.preferredFioriFont(forTextStyle: .footnote)], for: .normal)
            
            return SegmentedControlPicker(configuration)
                .overlay(
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(Color.preferredColor(.separatorOpaque), lineWidth: 0.33)
                )
                .padding()
        }
    }
    
    struct OptionsFioriStyle: OptionsStyle {
        let segmentedControlPickerConfiguration: SegmentedControlPickerConfiguration
        
        func makeBody(_ configuration: OptionsConfiguration) -> some View {
            Options(configuration)
        }
    }
}

// Default nss styles
extension SegmentedControlPickerNSSStyle {
    struct ContentNSSStyle: SegmentedControlPickerStyle {
        let segmentedControlPickerConfiguration: SegmentedControlPickerConfiguration
        let nssData: NSSStyleData
        func makeBody(_ configuration: SegmentedControlPickerConfiguration) -> some View {
            SegmentedControlPicker(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for its content
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct OptionsNSSStyle: OptionsStyle {
        let segmentedControlPickerConfiguration: SegmentedControlPickerConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: OptionsConfiguration) -> some View {
            Options(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Options
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }
}
