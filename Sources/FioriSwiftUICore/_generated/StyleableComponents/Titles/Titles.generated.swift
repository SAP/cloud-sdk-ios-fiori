// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Titles {
    let titles: [String]

    @Environment(\.titlesStyle) var style

    var componentIdentifier: String = Titles.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(titles: [String] = [],
                componentIdentifier: String? = Titles.identifier)
    {
        self.titles = titles
        self.componentIdentifier = componentIdentifier ?? Titles.identifier
    }
}

public extension Titles {
    static let identifier = "fiori_titles_component"
}

public extension Titles {
    init(_ configuration: TitlesConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TitlesConfiguration, shouldApplyDefaultStyle: Bool) {
        self.titles = configuration.titles
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Titles: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, titles: self.titles)).typeErased
                .transformEnvironment(\.titlesStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Titles {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Titles(.init(componentIdentifier: self.componentIdentifier, titles: self.titles))
            .shouldApplyDefaultStyle(false)
            .titlesStyle(.fiori)
            .typeErased
    }
}
