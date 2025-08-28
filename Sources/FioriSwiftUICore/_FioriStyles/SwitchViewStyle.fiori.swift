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
        @Environment(\.shadowEffect) private var shadowEffectConfiguration
        
        func makeBody(_ configuration: SwitchConfiguration) -> some View {
            Switch(configuration)
                .fixedSize()
                .tint(Color.preferredColor(.tintColor))
                .overlay(
                    self.borderShape
                        .stroke(Color.preferredColor(configuration.isOn ? .separatorOpaque : .separator), lineWidth: 3)
                )
                .clipShape(self.borderShape)
                .ifApply(self.shadowEffectConfiguration.showShadow) { content in
                    content.shadow(self.shadowEffectConfiguration.style ?? .smallElement)
                }
        }
        
        var borderShape: some Shape {
            if #available(iOS 26, *) {
                return Capsule()
            } else {
                return RoundedRectangle(cornerRadius: 16)
            }
        }
    }
}
