// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct IllustratedMessage {
    let detailImage: any View
    let title: any View
    let description: any View
    let action: any View
    let imageSize: ImageSize?

    @Environment(\.illustratedMessageStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder detailImage: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                @ViewBuilder description: () -> any View = { EmptyView() },
                @ViewBuilder action: () -> any View = { EmptyView() },
                imageSize: ImageSize? = nil)
    {
        self.detailImage = DetailImage { detailImage() }
        self.title = Title { title() }
        self.description = Description { description() }
        self.action = Action { action() }
        self.imageSize = imageSize
    }
}

public extension IllustratedMessage {
    init(detailImage: Image? = nil,
         title: AttributedString,
         description: AttributedString? = nil,
         action: FioriButton? = nil,
         imageSize: ImageSize? = nil)
    {
        self.init(detailImage: { detailImage }, title: { Text(title) }, description: { OptionalText(description) }, action: { action }, imageSize: imageSize)
    }
}

public extension IllustratedMessage {
    init(_ configuration: IllustratedMessageConfiguration) {
        self.detailImage = configuration.detailImage
        self.title = configuration.title
        self.description = configuration.description
        self.action = configuration.action
        self.imageSize = configuration.imageSize
        self._shouldApplyDefaultStyle = false
    }
}

extension IllustratedMessage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(detailImage: .init(self.detailImage), title: .init(self.title), description: .init(self.description), action: .init(self.action), imageSize: self.imageSize)).typeErased
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
        IllustratedMessage(.init(detailImage: .init(self.detailImage), title: .init(self.title), description: .init(self.description), action: .init(self.action), imageSize: self.imageSize))
            .shouldApplyDefaultStyle(false)
            .illustratedMessageStyle(IllustratedMessageFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
