// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct SelectedEntriesSectionTitle {
    let selectedEntriesSectionTitle: any View

    @Environment(\.selectedEntriesSectionTitleStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder selectedEntriesSectionTitle: () -> any View = { Text("Selected".localizedFioriString()) }) {
        self.selectedEntriesSectionTitle = selectedEntriesSectionTitle()
    }
}

public extension SelectedEntriesSectionTitle {
    init(selectedEntriesSectionTitle: AttributedString? = AttributedString("Selected".localizedFioriString())) {
        self.init(selectedEntriesSectionTitle: { OptionalText(selectedEntriesSectionTitle) })
    }
}

public extension SelectedEntriesSectionTitle {
    init(_ configuration: SelectedEntriesSectionTitleConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SelectedEntriesSectionTitleConfiguration, shouldApplyDefaultStyle: Bool) {
        self.selectedEntriesSectionTitle = configuration.selectedEntriesSectionTitle
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension SelectedEntriesSectionTitle: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(selectedEntriesSectionTitle: .init(self.selectedEntriesSectionTitle))).typeErased
                .transformEnvironment(\.selectedEntriesSectionTitleStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SelectedEntriesSectionTitle {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SelectedEntriesSectionTitle(.init(selectedEntriesSectionTitle: .init(self.selectedEntriesSectionTitle)))
            .shouldApplyDefaultStyle(false)
            .selectedEntriesSectionTitleStyle(.fiori)
            .typeErased
    }
}
