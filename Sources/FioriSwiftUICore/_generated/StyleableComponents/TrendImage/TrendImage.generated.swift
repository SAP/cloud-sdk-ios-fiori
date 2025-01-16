// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TrendImage {
    let trendImage: any View

    @Environment(\.trendImageStyle) var style

    var componentIdentifier: String = TrendImage.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder trendImage: () -> any View = { EmptyView() },
                componentIdentifier: String? = TrendImage.identifier)
    {
        self.trendImage = trendImage()
        self.componentIdentifier = componentIdentifier ?? TrendImage.identifier
    }
}

public extension TrendImage {
    static let identifier = "fiori_trendimage_component"
}

public extension TrendImage {
    init(trendImage: Image? = nil,
         componentIdentifier: String? = TrendImage.identifier)
    {
        self.init(trendImage: { trendImage }, componentIdentifier: componentIdentifier)
    }
}

public extension TrendImage {
    init(_ configuration: TrendImageConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TrendImageConfiguration, shouldApplyDefaultStyle: Bool) {
        self.trendImage = configuration.trendImage
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension TrendImage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, trendImage: .init(self.trendImage))).typeErased
                .transformEnvironment(\.trendImageStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TrendImage {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TrendImage(.init(componentIdentifier: self.componentIdentifier, trendImage: .init(self.trendImage)))
            .shouldApplyDefaultStyle(false)
            .trendImageStyle(.fiori)
            .typeErased
    }
}
