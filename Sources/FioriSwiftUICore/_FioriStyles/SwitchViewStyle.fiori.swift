// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SwitchViewBaseStyle: SwitchViewStyle {
    public func makeBody(_ configuration: SwitchViewConfiguration) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            VStack(alignment: .leading, spacing: 0) {
                configuration.title
                if !configuration._informationView.isEmpty {
                    configuration._informationView
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            switchStack(configuration: configuration)
                .frame(minWidth: 44, alignment: .trailing)
        }
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(configuration.controlState != .readOnly ? [.isToggle] : [])
    }
}

struct switchStack: View {
    let configuration: SwitchViewConfiguration
    
    var body: some View {
        if self.configuration.controlState == .readOnly {
            if self.configuration.stateLabel.isEmpty {
                Text(self.configuration.isOn ? NSLocalizedString("Switch On", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "") : NSLocalizedString("Switch Off", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
                    .font(.fiori(forTextStyle: .body))
                    .foregroundStyle(Color.preferredColor(.primaryLabel))
            } else {
                self.configuration.stateLabel
            }
        } else {
            self.configuration._switch
                .alignmentGuide(VerticalAlignment.firstTextBaseline) { d in d.height * 0.75 }
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
                .foregroundStyle(Color.preferredColor((!self.isEnabled || self.switchViewConfiguration.controlState == .disabled) ? .quaternaryLabel : .primaryLabel))
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
                .disabled(self.switchViewConfiguration.controlState == .disabled || !self.isEnabled)
        }
        
        var borderShape: some Shape {
            if #available(iOS 26, *) {
                return Capsule()
            } else {
                return RoundedRectangle(cornerRadius: 16)
            }
        }
    }
    
    struct StateLabelFioriStyle: StateLabelStyle {
        let switchViewConfiguration: SwitchViewConfiguration

        func makeBody(_ configuration: StateLabelConfiguration) -> some View {
            StateLabel(configuration)
                .font(.fiori(forTextStyle: .body))
                .foregroundStyle(Color.preferredColor(.primaryLabel))
        }
    }
    
    struct IconFioriStyle: IconStyle {
        let switchViewConfiguration: SwitchViewConfiguration
    
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
        }
    }
    
    struct DescriptionFioriStyle: DescriptionStyle {
        let switchViewConfiguration: SwitchViewConfiguration
    
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
        }
    }
    
    struct InformationViewFioriStyle: InformationViewStyle {
        let switchViewConfiguration: SwitchViewConfiguration
    
        func makeBody(_ configuration: InformationViewConfiguration) -> some View {
            InformationView(configuration)
        }
    }
}
