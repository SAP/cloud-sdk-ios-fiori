// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct AttachmentButtonImage {
    /// / The image to be used for "Add" menu or dialog for operations, such as poping up image picker or file picker.
    let addButtonImage: any View
    /// The state of attachement group component
    let controlState: ControlState

    @Environment(\.attachmentButtonImageStyle) var style

    var componentIdentifier: String = AttachmentButtonImage.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder addButtonImage: () -> any View,
                controlState: ControlState = .normal,
                componentIdentifier: String? = AttachmentButtonImage.identifier)
    {
        self.addButtonImage = addButtonImage()
        self.controlState = controlState
        self.componentIdentifier = componentIdentifier ?? AttachmentButtonImage.identifier
    }
}

public extension AttachmentButtonImage {
    static let identifier = "fiori_attachmentbuttonimage_component"
}

public extension AttachmentButtonImage {
    init(addButtonImage: Image = FioriIcon.actions.add.renderingMode(.template).resizable(),
         controlState: ControlState = .normal)
    {
        self.init(addButtonImage: { addButtonImage }, controlState: controlState)
    }
}

public extension AttachmentButtonImage {
    init(_ configuration: AttachmentButtonImageConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AttachmentButtonImageConfiguration, shouldApplyDefaultStyle: Bool) {
        self.addButtonImage = configuration.addButtonImage
        self.controlState = configuration.controlState
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AttachmentButtonImage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, addButtonImage: .init(self.addButtonImage), controlState: self.controlState)).typeErased
                .transformEnvironment(\.attachmentButtonImageStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AttachmentButtonImage {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AttachmentButtonImage(.init(componentIdentifier: self.componentIdentifier, addButtonImage: .init(self.addButtonImage), controlState: self.controlState))
            .shouldApplyDefaultStyle(false)
            .attachmentButtonImageStyle(AttachmentButtonImageFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
