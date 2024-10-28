// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct ListPickerContent {
    let listPickerContent: any View

    @Environment(\.listPickerContentStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder listPickerContent: () -> any View = { EmptyView() }) {
        self.listPickerContent = listPickerContent()
    }
}

public extension ListPickerContent {
    init(_ configuration: ListPickerContentConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ListPickerContentConfiguration, shouldApplyDefaultStyle: Bool) {
        self.listPickerContent = configuration.listPickerContent
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension ListPickerContent: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(listPickerContent: .init(self.listPickerContent))).typeErased
                .transformEnvironment(\.listPickerContentStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ListPickerContent {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ListPickerContent(.init(listPickerContent: .init(self.listPickerContent)))
            .shouldApplyDefaultStyle(false)
            .listPickerContentStyle(.fiori)
            .typeErased
    }
}
