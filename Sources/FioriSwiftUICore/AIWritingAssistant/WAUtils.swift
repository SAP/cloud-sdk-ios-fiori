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

extension EnvironmentValues {
    var waHelperAction: Binding<WAHelperAction> {
        get { self[WAHelperActionKey.self] }
        set { self[WAHelperActionKey.self] = newValue }
    }
    
    var waSheetHeightUpdated: ((CGFloat) -> Void)? {
        get { self[WASheetHeightUpdatedKey.self] }
        set { self[WASheetHeightUpdatedKey.self] = newValue }
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
    /// - Parameter height: A block that will be called when the sheet height is updated.
    /// - Returns: A view with the writing assistant sheet height updated environment value set.
    func waSheetHeightUpdated(_ block: ((CGFloat) -> Void)?) -> some View {
        self.environment(\.waSheetHeightUpdated, block)
    }
}
