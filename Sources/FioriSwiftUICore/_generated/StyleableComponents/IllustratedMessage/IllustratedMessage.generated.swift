// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI


public struct IllustratedMessage {
    let detailImage: any View
let title: any View
let description: any View
let action: any View

    @Environment(\.illustratedMessageStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder detailImage: () -> any View = { EmptyView() },
@ViewBuilder title: () -> any View,
@ViewBuilder description: () -> any View = { EmptyView() },
@ViewBuilder action: () -> any View = { EmptyView() }) {
    self.detailImage = DetailImage { detailImage() }
self.title = Title { title() }
self.description = Description { description() }
self.action = Action { action() }
}
}

public extension IllustratedMessage {
    init(detailImage: Image? = nil,
title: AttributedString,
description: AttributedString? = nil,
action: FioriButton? = nil) {
        self.init(detailImage: { detailImage }, title: { Text(title) }, description: { OptionalText(description) }, action: { action })
    }
}

public extension IllustratedMessage {
    init(_ configuration: IllustratedMessageConfiguration) {
        self.detailImage = configuration.detailImage
self.title = configuration.title
self.description = configuration.description
self.action = configuration.action
        self._shouldApplyDefaultStyle = false
    }
}

extension IllustratedMessage: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(detailImage: .init(self.detailImage), title: .init(self.title), description: .init(self.description), action: .init(self.action))).typeErased
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
        IllustratedMessage(.init(detailImage: .init(self.detailImage), title: .init(self.title), description: .init(self.description), action: .init(self.action)))
        .shouldApplyDefaultStyle(false)
        .illustratedMessageStyle(IllustratedMessageFioriStyle.ContentFioriStyle())
        .typeErased
    }
}
