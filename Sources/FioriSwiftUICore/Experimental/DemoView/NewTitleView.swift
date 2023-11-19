import Foundation
import SwiftUI

public struct NewTitleView<Title: View>: NewTitleComponent {
    let title: Title
    private var _shouldApplyDefaultStyle = true
    
    @Environment(\.newTitleStyle) var style
    
    public init(@ViewBuilder title: () -> Title) {
        self.title = title()
    }
}

// TODO: macro
public extension NewTitleView where Title == NewTitleConfiguration.Title {
    init(_ configuration: NewTitleConfiguration) {
        self.title = configuration.title
        self._shouldApplyDefaultStyle = false
    }
}

extension NewTitleView {
    private init(@ViewBuilder title: () -> Title, shouldApplyDefaultStyle: Bool) {
        self.title = title()
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension NewTitleView {
    private func defaultStyle() -> some View {
        NewTitleView(title: { self.title }, shouldApplyDefaultStyle: false)
            .newTitleStyle(.fiori)
    }
}

extension NewTitleView: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(title: .init(title))).typeErased
                .transformEnvironment(\.newTitleStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}
