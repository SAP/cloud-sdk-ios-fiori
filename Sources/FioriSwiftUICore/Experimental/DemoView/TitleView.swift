import Foundation
import SwiftUI

public struct TitleView<Title: View>: _TitleComponent {
    let title: Title
    private var _shouldApplyDefaultStyle = true
    
    @Environment(\.titleStyle) var style
    
    public init(@ViewBuilder title: () -> Title) {
        self.title = title()
    }
}

// TODO: macro
public extension TitleView where Title == NewTitleConfiguration.Title {
    init(_ configuration: NewTitleConfiguration) {
        self.title = configuration.title
        self._shouldApplyDefaultStyle = false
    }
}

extension TitleView {
    private init(@ViewBuilder title: () -> Title, shouldApplyDefaultStyle: Bool) {
        self.title = title()
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension TitleView {
    private func defaultStyle() -> some View {
        TitleView(title: { self.title }, shouldApplyDefaultStyle: false)
            .newTitleStyle(.fiori)
    }
}

extension TitleView: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(title: .init(title))).typeErased
                .transformEnvironment(\.titleStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}
