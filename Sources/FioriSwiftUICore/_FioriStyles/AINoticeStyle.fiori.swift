import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AINoticeBaseStyle: AINoticeStyle {
    @Environment(\.isEnabled) var isEnabled
    public func makeBody(_ configuration: AINoticeConfiguration) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            if configuration.viewAlignment == .center {
                Spacer()
            }
            if configuration.icon.isEmpty {
                Image(fioriName: "fiori.ai")
                    .foregroundStyle(Color.preferredColor(self.isEnabled ? .tertiaryLabel : .quaternaryLabel))
                    .font(.fiori(forTextStyle: .footnote))
            } else {
                configuration.icon
            }
            self.getMessage(configuration)
                .ifApply(configuration.viewMoreAction != nil && self.isEnabled) {
                    $0.onTapGesture {
                        configuration.viewMoreAction?()
                    }
                }
            Spacer()
        }
    }
    
    func getMessage(_ configuration: AINoticeConfiguration) -> some View {
        let message = configuration.description ?? AttributedString(NSLocalizedString("Suggested by AI. Verify before use. ", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Suggested by AI. Verify before use. "))
        if configuration.actionLabel != nil, self.isEnabled {
            return Text(message)
                .font(.fiori(forTextStyle: .footnote))
                .foregroundStyle(Color.preferredColor(self.isEnabled ? .tertiaryLabel : .quaternaryLabel))
                + Text(configuration.actionLabel ?? "")
                .font(.fiori(forTextStyle: .footnote, weight: .semibold))
                .foregroundStyle(Color.preferredColor(self.isEnabled ? .tintColor : .quaternaryLabel))
        } else {
            return Text(message)
                .font(.fiori(forTextStyle: .footnote))
                .foregroundStyle(Color.preferredColor(self.isEnabled ? .tertiaryLabel : .quaternaryLabel))
        }
    }
}

// Default fiori styles
extension AINoticeFioriStyle {
    struct ContentFioriStyle: AINoticeStyle {
        func makeBody(_ configuration: AINoticeConfiguration) -> some View {
            AINotice(configuration)
        }
    }
    
    struct IconFioriStyle: IconStyle {
        @Environment(\.isEnabled) var isEnabled
        let aINoticeConfiguration: AINoticeConfiguration
        
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .foregroundStyle(Color.preferredColor(self.isEnabled ? .tertiaryLabel : .quaternaryLabel))
                .font(.fiori(forTextStyle: .footnote))
        }
    }
}

struct AINoticeModifier: ViewModifier {
    let icon: Image?
    let description: AttributedString
    let actionLabel: AttributedString?
    let viewMoreAction: (() -> Void)?
    @Binding var isPresented: Bool
    
    func body(content: Content) -> some View {
        VStack {
            content
            if self.isPresented {
                AINotice(icon: self.icon, description: self.description, actionLabel: self.actionLabel, viewMoreAction: self.viewMoreAction)
            }
        }
    }
}

public extension View {
    /// Displays the AI notice beneath the view, including an icon, text, and an actionable text element. It is used within the form cell to present the AI notice message. Clicking the `actionLabel` triggers the `viewMoreAction`.
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that controls the presentation of the AI notice message.
    ///   - icon: A view representing the icon. The defalt icon is SF symbol `fiori.ai`.
    ///   - description: An `AttributedString` representing the AI notice message.
    ///   - actionLabel: A label that triggers an action to view more details.
    ///   - viewMoreAction: A callback triggered when the actionLabel is clicked to display more message details.
    /// - Returns: A new `View` for AI notice message.
    func aiNoticeView(isPresented: Binding<Bool>, icon: Image? = nil, description: AttributedString? = nil, actionLabel: AttributedString? = nil, viewMoreAction: (() -> Void)? = nil) -> some View {
        self.modifier(AINoticeModifier(icon: icon, description: description ?? AttributedString(NSLocalizedString("Suggested by AI. Verify before use. ", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Suggested by AI. Verify before use. ")), actionLabel: actionLabel, viewMoreAction: viewMoreAction, isPresented: isPresented))
    }
}

struct AINoticeKey: EnvironmentKey {
    static let defaultValue = AINoticeItemConfiguration(
        isPresented: .constant(false),
        icon: nil,
        description: nil,
        actionLabel: nil,
        viewMoreAction: nil
    )
}

extension EnvironmentValues {
    var aiNotice: AINoticeItemConfiguration {
        get { self[AINoticeKey.self] }
        set { self[AINoticeKey.self] = newValue }
    }
}

struct AINoticeItemConfiguration {
    let isPresented: Binding<Bool>
    let icon: Image?
    let description: AttributedString?
    let actionLabel: AttributedString?
    let viewMoreAction: (() -> Void)?
    
    init(isPresented: Binding<Bool>,
         icon: Image? = nil,
         description: AttributedString? = nil,
         actionLabel: AttributedString? = nil,
         viewMoreAction: (() -> Void)? = nil)
    {
        self.isPresented = isPresented
        self.icon = icon
        self.description = description
        self.actionLabel = actionLabel
        self.viewMoreAction = viewMoreAction
    }
}

public extension View {
    /// Sets the AI notice configuration for components
    /// - Parameters:
    ///   - isPresented: Whether to show the AI notice
    ///   - icon: Icon for the AI notice, defaults to system AI icon
    ///   - description: Description text for the AI notice
    ///   - actionLabel: Action label text
    ///   - viewMoreAction: Action to perform when action label is tapped
    /// - Returns: A view with the applied AI notice configuration
    ///
    /// Example usage:
    /// ```swift
    /// SomeView(...)
    ///     .aiNotice(true) // Show AI notice with default style
    ///     .aiNotice(true, description: AttributedString("Custom message")) // Show with custom message
    ///     .aiNotice(false) // Hide AI notice
    /// ```
    func aiNotice(_ isPresented: Binding<Bool>,
                  icon: Image? = nil,
                  description: AttributedString? = nil,
                  actionLabel: AttributedString? = nil,
                  viewMoreAction: (() -> Void)? = nil) -> some View
    {
        self.environment(\.aiNotice, AINoticeItemConfiguration(
            isPresented: isPresented,
            icon: icon,
            description: description,
            actionLabel: actionLabel,
            viewMoreAction: viewMoreAction,
        ))
    }
}
