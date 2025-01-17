// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct InformationView {
    let icon: any View
    let description: any View

    @Environment(\.informationViewStyle) var style

    var componentIdentifier: String = InformationView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() },
                componentIdentifier: String? = InformationView.identifier)
    {
        self.icon = Icon(icon: icon, componentIdentifier: componentIdentifier)
        self.description = Description(description: description, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? InformationView.identifier
    }
}

public extension InformationView {
    static let identifier = "fiori_informationview_component"
}

public extension InformationView {
    init(icon: Image? = nil,
         description: AttributedString? = nil,
         componentIdentifier: String? = InformationView.identifier)
    {
        self.init(icon: { icon }, description: { OptionalText(description) }, componentIdentifier: componentIdentifier)
    }
}

public extension InformationView {
    init(_ configuration: InformationViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: InformationViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.icon = configuration.icon
        self.description = configuration.description
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension InformationView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), description: .init(self.description))).typeErased
                .transformEnvironment(\.informationViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension InformationView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        InformationView(.init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), description: .init(self.description)))
            .shouldApplyDefaultStyle(false)
            .informationViewStyle(InformationViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
