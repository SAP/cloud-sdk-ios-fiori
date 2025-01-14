// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SwitchViewBaseStyle: SwitchViewStyle {
    public func makeBody(_ configuration: SwitchViewConfiguration) -> some View {
        ViewThatFits {
            HStack {
                configuration.title
                Spacer()
                configuration._switch
            }
            VStack(alignment: .leading, spacing: 0) {
                configuration.title
                HStack {
                    Spacer()
                    configuration._switch
                }
            }
        }
    }
}

// Default fiori styles
extension SwitchViewFioriStyle {
    struct ContentFioriStyle: SwitchViewStyle {
        func makeBody(_ configuration: SwitchViewConfiguration) -> some View {
            SwitchView(configuration)
                .padding(EdgeInsets(top: 9, leading: 20, bottom: 9, trailing: 20))
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let switchViewConfiguration: SwitchViewConfiguration
        @Environment(\.isEnabled) var isEnabled

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(Color.preferredColor(self.isEnabled ? .primaryLabel : .quaternaryLabel))
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
        }
    }

    struct SwitchFioriStyle: SwitchStyle {
        let switchViewConfiguration: SwitchViewConfiguration
        @Environment(\.isEnabled) var isEnabled
        
        func makeBody(_ configuration: SwitchConfiguration) -> some View {
            Switch(configuration)
                .tint(Color.preferredColor(.tintColor))
                .frame(width: 51, height: 31, alignment: .trailing)
                .offset(x: -2)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.preferredColor(configuration.isOn ? .separatorOpaque : .separator), lineWidth: 0.5)
                )
        }
    }
}

// Default nss styles
extension SwitchViewNSSStyle {
    struct ContentNSSStyle: SwitchViewStyle {
        let switchViewConfiguration: SwitchViewConfiguration
        let nssData: NSSStyleData
        func makeBody(_ configuration: SwitchViewConfiguration) -> some View {
            SwitchView(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for its content
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct TitleNSSStyle: TitleStyle {
        let switchViewConfiguration: SwitchViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Title
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct SwitchNSSStyle: SwitchStyle {
        let switchViewConfiguration: SwitchViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: SwitchConfiguration) -> some View {
            Switch(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Switch
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }
}
