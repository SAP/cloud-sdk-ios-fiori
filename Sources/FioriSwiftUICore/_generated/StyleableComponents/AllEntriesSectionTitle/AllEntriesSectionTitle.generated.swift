// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct AllEntriesSectionTitle {
    let allEntriesSectionTitle: any View

    @Environment(\.allEntriesSectionTitleStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder allEntriesSectionTitle: () -> any View = { Text("All".localizedFioriString()) }) {
        self.allEntriesSectionTitle = allEntriesSectionTitle()
    }
}

public extension AllEntriesSectionTitle {
    init(allEntriesSectionTitle: AttributedString? = AttributedString("All".localizedFioriString())) {
        self.init(allEntriesSectionTitle: { OptionalText(allEntriesSectionTitle) })
    }
}

public extension AllEntriesSectionTitle {
    init(_ configuration: AllEntriesSectionTitleConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AllEntriesSectionTitleConfiguration, shouldApplyDefaultStyle: Bool) {
        self.allEntriesSectionTitle = configuration.allEntriesSectionTitle
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension AllEntriesSectionTitle: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(allEntriesSectionTitle: .init(self.allEntriesSectionTitle))).typeErased
                .transformEnvironment(\.allEntriesSectionTitleStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AllEntriesSectionTitle {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AllEntriesSectionTitle(.init(allEntriesSectionTitle: .init(self.allEntriesSectionTitle)))
            .shouldApplyDefaultStyle(false)
            .allEntriesSectionTitleStyle(.fiori)
            .typeErased
    }
}
