// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct IllustratedMessage {
    let detailImage: any View
    let title: any View
    let description: any View
    let action: any View
    let detailImageSize: IllustratedMessage.DetailImageSize?

    @Environment(\.illustratedMessageStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder detailImage: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                @ViewBuilder description: () -> any View = { EmptyView() },
                @ViewBuilder action: () -> any View = { EmptyView() },
                detailImageSize: IllustratedMessage.DetailImageSize? = nil)
    {
        self.detailImage = DetailImage { detailImage() }
        self.title = Title { title() }
        self.description = Description { description() }
        self.action = Action { action() }
        self.detailImageSize = detailImageSize
    }
}

public extension IllustratedMessage {
    init(detailImage: Image? = nil,
         title: AttributedString,
         description: AttributedString? = nil,
         action: FioriButton? = nil,
         detailImageSize: IllustratedMessage.DetailImageSize? = nil)
    {
        self.init(detailImage: { detailImage }, title: { Text(title) }, description: { OptionalText(description) }, action: { action }, detailImageSize: detailImageSize)
    }
}

public extension IllustratedMessage {
    init(_ configuration: IllustratedMessageConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: IllustratedMessageConfiguration, shouldApplyDefaultStyle: Bool) {
        self.detailImage = configuration.detailImage
        self.title = configuration.title
        self.description = configuration.description
        self.action = configuration.action
        self.detailImageSize = configuration.detailImageSize
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension IllustratedMessage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(detailImage: .init(self.detailImage), title: .init(self.title), description: .init(self.description), action: .init(self.action), detailImageSize: self.detailImageSize)).typeErased
                .transformEnvironment(\.illustratedMessageStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension IllustratedMessage {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        IllustratedMessage(.init(detailImage: .init(self.detailImage), title: .init(self.title), description: .init(self.description), action: .init(self.action), detailImageSize: self.detailImageSize))
            .shouldApplyDefaultStyle(false)
            .illustratedMessageStyle(IllustratedMessageFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
