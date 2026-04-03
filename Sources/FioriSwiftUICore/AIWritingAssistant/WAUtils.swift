import FioriThemeManager
import SwiftUI
import UIKit

/// :nodoc:
public extension FioriButton {
    /// Not for developers, back button used in navigation bar top leading action.
    static let _backButton = FioriButton { _ in
        HStack {
            Image(systemName: "chevron.backward")
            Text("Back".localizedFioriString())
        }
    }
    
    /// Not for developers
    static let _writingAssistantButton = FioriButton { _ in
        HStack {
            FioriIcon.actions.ai
            Text("Writing Assistant".localizedFioriString())
                .lineLimit(1)
                .fixedSize(horizontal: true, vertical: false)
        }
    }
    
    /// Not for developers
    static let _undoButton = FioriButton { _ in
        HStack {
            FioriIcon.actions.undo
            Text("Undo".localizedFioriString())
        }
    }
    
    /// Not for developers
    static let _redoButton = FioriButton { _ in
        HStack {
            Text("Redo".localizedFioriString())
            FioriIcon.actions.redo
        }
    }
}

/// Result for `menuHandler` in writing assistant.
public enum WAResult {
    /// Represents a successful result with a string. Writing assistant will update the text by the value.
    case success(String)
    /// Represents a successful result with a destination view. You can do some customization in your own view.
    case customDestination(any View)
    /// Represents a failure with an error.  Will show an `IllustratedMessage` by the error.
    case failure(WAError)
}

/// Result for `feedbackHandler` in writing assistant.
public enum WAFeedbackResult {
    /// Represents a successful result, a success toast message will be displayed.
    case success
    /// Represents a failure with an error.  Will show an `IllustratedMessage` by the error.
    case failure(WAError)
}

/// Helper action for writing assistant. This is used to trigger extra actions in the writing assistant, such as retrying an operation, updating the text directly, or navigating to a different view.
public enum WAHelperAction: Equatable {
    /// N/A value, which means no action is needed.
    case none
    /// Retry action which can be used to retry the last operation.
    case retry
    /// Update action which can be used to update the text directly.
    case update(String)
    /// Navigate to a different view. The view can be any SwiftUI view.
    case navigateTo(any View)
    
    /// :nodoc:
    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none), (.retry, .retry):
            return true
        case (.update(let lValue), .update(let rValue)):
            return lValue == rValue
        case (.navigateTo(let lView), .navigateTo(let rView)):
            return type(of: lView) == type(of: rView)
        default:
            return false
        }
    }
}

struct WAHelperActionKey: EnvironmentKey {
    static let defaultValue: Binding<WAHelperAction> = .constant(.none)
}

struct WASheetHeightUpdatedKey: EnvironmentKey {
    static let defaultValue: ((CGFloat) -> Void)? = nil
}

struct WAAuthorizationKey: EnvironmentKey {
    static let defaultValue: (() async -> Bool)? = nil
}

struct WAShowPanelKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(false)
}

struct WAFeedbackNavigationBarTitleKey: EnvironmentKey {
    static let defaultValue: AttributedString = .init("Feedback".localizedFioriString())
}

struct HideFeedbackFooterInWritingAssistantKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

struct WAAutoSaveKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var waHelperAction: Binding<WAHelperAction> {
        get { self[WAHelperActionKey.self] }
        set { self[WAHelperActionKey.self] = newValue }
    }
    
    var waSheetHeightUpdated: ((CGFloat) -> Void)? {
        get { self[WASheetHeightUpdatedKey.self] }
        set { self[WASheetHeightUpdatedKey.self] = newValue }
    }
    
    var waAuthorizationCheck: (() async -> Bool)? {
        get { self[WAAuthorizationKey.self] }
        set { self[WAAuthorizationKey.self] = newValue }
    }
    
    var waShowPanel: Binding<Bool> {
        get { self[WAShowPanelKey.self] }
        set { self[WAShowPanelKey.self] = newValue }
    }
    
    var waFeedbackNavigationBarTitle: AttributedString {
        get { self[WAFeedbackNavigationBarTitleKey.self] }
        set { self[WAFeedbackNavigationBarTitleKey.self] = newValue }
    }
    
    var hideFeedbackFooterInWritingAssistant: Bool {
        get { self[HideFeedbackFooterInWritingAssistantKey.self] }
        set { self[HideFeedbackFooterInWritingAssistantKey.self] = newValue }
    }
    
    var waAutoSave: Bool {
        get { self[WAAutoSaveKey.self] }
        set { self[WAAutoSaveKey.self] = newValue }
    }
}

public extension View {
    /// Helper to trigger extra writing assistant actions.
    /// - Parameter waHelperAction: A binding action that can be triggered in the writing assistant.
    /// - Returns: A view with the writing assistant action environment value set.
    func waHelperAction(_ waHelperAction: Binding<WAHelperAction>) -> some View {
        self.environment(\.waHelperAction, waHelperAction)
    }
    
    /// Call back for writing assistant sheet height updated.
    /// - Parameter block: A block that will be called when the sheet height is updated.
    /// - Returns: A view with the writing assistant sheet height updated environment value set.
    func waSheetHeightUpdated(_ block: ((CGFloat) -> Void)?) -> some View {
        self.environment(\.waSheetHeightUpdated, block)
    }
    
    /// Call back for writing assistant authorization check.
    /// - Parameter block: An async block that will be called to check authorization status.
    /// - Returns: A view with the writing assistant authorization check environment value set.
    func waAuthorizationCheck(_ block: (() async -> Bool)?) -> some View {
        self.environment(\.waAuthorizationCheck, block)
    }
    
    /// Showing writing assistant panel programmatically.
    /// - Parameter show: A boolean value to indicate whether to show panel for writing assistant.
    /// - Returns: A view with the writing assistant panel or not.
    func waShowPanel(_ show: Binding<Bool>) -> some View {
        self.environment(\.waShowPanel, show)
    }
    
    /// Customize the title string for the navigation bar title in feedback view.
    /// - Parameter title: String value for the navigation bar.
    /// - Returns: New view with customized navigation bar title for feedback in writing assistant component.
    func waFeedbackNavigationTitle(_ title: String) -> some View {
        self.environment(\.waFeedbackNavigationBarTitle, AttributedString(title))
    }
    
    /// Hide feedback section footer for writing assistant.
    /// - Parameter hide: A boolean value to indicate if hide/show the feedback footer.
    /// - Returns: A new view with hidden or shown feedback footer for writing assistant.
    func hideFeedbackFooterInWritingAssistant(_ hide: Bool = true) -> some View {
        self.environment(\.hideFeedbackFooterInWritingAssistant, hide)
    }
    
    /// Set whether auto save is enabled for writing assistant. When auto save is enabled, writing assistant will automatically save the content after quit W.A. flow without showing the confirmation pop-up. When auto save is disabled, writing assistant will show a confirmation pop-up to ask whether to save the content.
    /// - Parameter isAutoSaveEnabled: A boolean value to indicate whether auto save is enabled for writing assistant.
    /// - Returns: A view with auto save enabled or not for writing assistant.
    func waAutoSave(_ isAutoSaveEnabled: Bool = true) -> some View {
        self.environment(\.waAutoSave, isAutoSaveEnabled)
    }
}
