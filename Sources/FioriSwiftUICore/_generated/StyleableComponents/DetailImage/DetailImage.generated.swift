// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct DetailImage {
    let detailImage: any View

    @Environment(\.detailImageStyle) var style

    var componentIdentifier: String = DetailImage.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder detailImage: () -> any View = { EmptyView() },
                componentIdentifier: String? = DetailImage.identifier)
    {
        self.detailImage = detailImage()
        self.componentIdentifier = componentIdentifier ?? DetailImage.identifier
    }
}

public extension DetailImage {
    static let identifier = "fiori_detailimage_component"
}

public extension DetailImage {
    init(detailImage: Image? = nil) {
        self.init(detailImage: { detailImage })
    }
}

public extension DetailImage {
    init(_ configuration: DetailImageConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: DetailImageConfiguration, shouldApplyDefaultStyle: Bool) {
        self.detailImage = configuration.detailImage
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension DetailImage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, detailImage: .init(self.detailImage))).typeErased
                .transformEnvironment(\.detailImageStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension DetailImage {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        DetailImage(.init(componentIdentifier: self.componentIdentifier, detailImage: .init(self.detailImage)))
            .shouldApplyDefaultStyle(false)
            .detailImageStyle(.fiori)
            .typeErased
    }
}
