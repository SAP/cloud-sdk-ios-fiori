// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct DetailContent {
    let detailContent: any View

    @Environment(\.detailContentStyle) var style

    var componentIdentifier: String = DetailContent.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder detailContent: () -> any View = { EmptyView() },
                componentIdentifier: String? = DetailContent.identifier)
    {
        self.detailContent = detailContent()
        self.componentIdentifier = componentIdentifier ?? DetailContent.identifier
    }
}

public extension DetailContent {
    static let identifier = "fiori_detailcontent_component"
}

public extension DetailContent {
    init(_ configuration: DetailContentConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: DetailContentConfiguration, shouldApplyDefaultStyle: Bool) {
        self.detailContent = configuration.detailContent
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension DetailContent: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, detailContent: .init(self.detailContent))).typeErased
                .transformEnvironment(\.detailContentStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension DetailContent {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        DetailContent(.init(componentIdentifier: self.componentIdentifier, detailContent: .init(self.detailContent)))
            .shouldApplyDefaultStyle(false)
            .detailContentStyle(.fiori)
            .typeErased
    }
}
