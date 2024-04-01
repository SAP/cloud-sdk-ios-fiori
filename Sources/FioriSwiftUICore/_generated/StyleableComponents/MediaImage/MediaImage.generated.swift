// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct MediaImage {
    let mediaImage: any View

    @Environment(\.mediaImageStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder mediaImage: () -> any View = { EmptyView() }) {
        self.mediaImage = mediaImage()
    }
}

public extension MediaImage {
    init(mediaImage: Image? = nil) {
        self.init(mediaImage: { OptionalImage(mediaImage) })
    }
}

public extension MediaImage {
    init(_ configuration: MediaImageConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: MediaImageConfiguration, shouldApplyDefaultStyle: Bool) {
        self.mediaImage = configuration.mediaImage
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension MediaImage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(mediaImage: .init(self.mediaImage))).typeErased
                .transformEnvironment(\.mediaImageStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension MediaImage {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        MediaImage(mediaImage: { self.mediaImage })
            .shouldApplyDefaultStyle(false)
            .mediaImageStyle(.fiori)
            .typeErased
    }
}
