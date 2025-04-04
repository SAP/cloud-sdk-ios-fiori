// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct FilterFormView {
    let title: any View
    let options: [AttributedString]
    /// The `ControlState` of the form view. The default is `normal`
    let controlState: ControlState
    /// The error message of the form view.
    let errorMessage: AttributedString?
    let isEnabled: Bool
    /// Indicates whether the user may select multiple values. The default is `true`
    let allowsMultipleSelection: Bool
    let allowsEmptySelection: Bool
    /// The indexes for the selected value in the valueOptions.
    @Binding var value: [Int]
    /// Size of filter button.
    let buttonSize: FilterButtonSize
    /// Allow chips to layout on the same line as the title
    let isSingleLine: Bool
    /// Implementation of value change callback.  Is invoked on changes to the `value` property.
    let onValueChange: (([Int]) -> Void)?

    @Environment(\.filterFormViewStyle) var style

    var componentIdentifier: String = FilterFormView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                options: [AttributedString] = [],
                controlState: ControlState = .normal,
                errorMessage: AttributedString? = nil,
                isEnabled: Bool,
                allowsMultipleSelection: Bool = true,
                allowsEmptySelection: Bool = false,
                value: Binding<[Int]>,
                buttonSize: FilterButtonSize = .fixed,
                isSingleLine: Bool = true,
                onValueChange: (([Int]) -> Void)? = nil,
                componentIdentifier: String? = FilterFormView.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.options = options
        self.controlState = controlState
        self.errorMessage = errorMessage
        self.isEnabled = isEnabled
        self.allowsMultipleSelection = allowsMultipleSelection
        self.allowsEmptySelection = allowsEmptySelection
        self._value = value
        self.buttonSize = buttonSize
        self.isSingleLine = isSingleLine
        self.onValueChange = onValueChange
        self.componentIdentifier = componentIdentifier ?? FilterFormView.identifier
    }
}

public extension FilterFormView {
    static let identifier = "fiori_filterformview_component"
}

public extension FilterFormView {
    init(title: AttributedString,
         mandatoryFieldIndicator: TextOrIcon? = .text("*"),
         isRequired: Bool = false,
         options: [AttributedString] = [],
         controlState: ControlState = .normal,
         errorMessage: AttributedString? = nil,
         isEnabled: Bool,
         allowsMultipleSelection: Bool = true,
         allowsEmptySelection: Bool = false,
         value: Binding<[Int]>,
         buttonSize: FilterButtonSize = .fixed,
         isSingleLine: Bool = true,
         onValueChange: (([Int]) -> Void)? = nil)
    {
        self.init(title: {
            Group {
                if let mandatoryFieldIndicator, isRequired {
                    switch mandatoryFieldIndicator {
                    case .text(let attributedString):
                        Text(title) + Text(attributedString).accessibilityLabel(NSLocalizedString("Required Field", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Required Field"))
                    case .icon(let image):
                        Text(title) + Text(image).accessibilityLabel(NSLocalizedString("Required Field", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Required Field"))
                    case .both(let attributedString, let image):
                        Text(title) + Text(attributedString).accessibilityLabel(NSLocalizedString("Required Field", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Required Field")) + Text(image).accessibilityLabel("")
                    }
                } else {
                    Text(title)
                }
            }.typeErased
        }, options: options, controlState: controlState, errorMessage: errorMessage, isEnabled: isEnabled, allowsMultipleSelection: allowsMultipleSelection, allowsEmptySelection: allowsEmptySelection, value: value, buttonSize: buttonSize, isSingleLine: isSingleLine, onValueChange: onValueChange)
    }
}

public extension FilterFormView {
    init(_ configuration: FilterFormViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: FilterFormViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.options = configuration.options
        self.controlState = configuration.controlState
        self.errorMessage = configuration.errorMessage
        self.isEnabled = configuration.isEnabled
        self.allowsMultipleSelection = configuration.allowsMultipleSelection
        self.allowsEmptySelection = configuration.allowsEmptySelection
        self._value = configuration.$value
        self.buttonSize = configuration.buttonSize
        self.isSingleLine = configuration.isSingleLine
        self.onValueChange = configuration.onValueChange
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension FilterFormView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), options: self.options, controlState: self.controlState, errorMessage: self.errorMessage, isEnabled: self.isEnabled, allowsMultipleSelection: self.allowsMultipleSelection, allowsEmptySelection: self.allowsEmptySelection, value: self.$value, buttonSize: self.buttonSize, isSingleLine: self.isSingleLine, onValueChange: self.onValueChange)).typeErased
                .transformEnvironment(\.filterFormViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension FilterFormView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        FilterFormView(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), options: self.options, controlState: self.controlState, errorMessage: self.errorMessage, isEnabled: self.isEnabled, allowsMultipleSelection: self.allowsMultipleSelection, allowsEmptySelection: self.allowsEmptySelection, value: self.$value, buttonSize: self.buttonSize, isSingleLine: self.isSingleLine, onValueChange: self.onValueChange))
            .shouldApplyDefaultStyle(false)
            .filterFormViewStyle(FilterFormViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
