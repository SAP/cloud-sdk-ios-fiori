import Foundation
import SwiftUI

/// The configuration for creating an alert view.
public struct AlertConfiguration {
    let title: Text
    
    // iOS 15+
    let message: AnyView
    var action: Action
    var secondaryAction: Action
    
    @available(iOS 15, macOS 12, *)
    /// Creates an alert view configuration object.
    /// - Parameters:
    ///   - title: The title text of the alert view.
    ///   - message: A view builder returns a view to be shown as message.
    ///   - action: Action object.
    ///   - secondaryAction: Secondary action object.
    public init<M: View>(title: Text,
                         @ViewBuilder message: () -> M,
                         action: Action,
                         secondaryAction: Action)
    {
        self.title = title
        self.message = message().typeErased
        self.message_ = nil
        self.action = action
        self.secondaryAction = secondaryAction
    }
    
    let message_: Text?
    
    @available(iOS, deprecated: 15)
    @available(macOS, deprecated: 12)
    /// Creates an alert view configuration object.
    /// - Parameters:
    ///   - title: The title text of the alert view.
    ///   - message: The message text of the alert view.
    ///   - action: Action object.
    ///   - secondaryAction: Secondary action object.
    public init(title: Text,
                message: Text?,
                action: Action,
                secondaryAction: Action)
    {
        self.title = title
        self.message = message != nil ? message!.typeErased : EmptyView().typeErased
        self.message_ = message
        self.action = action
        self.secondaryAction = secondaryAction
    }
    
    /// Creates an alert view configuration object.
    /// - Parameters:
    ///   - title: The title text of the alert view.
    ///   - message: The message text of the alert view.
    ///   - action: Action object.
    ///   - secondaryAction: Secondary action object.
    public init(title: String, message: String? = nil, action: Action, secondaryAction: Action) {
        self.title = Text(title)
        self.message = message != nil ? Text(message!).typeErased : EmptyView().typeErased
        self.message_ = message != nil ? Text(message!) : nil
        self.action = action
        self.secondaryAction = secondaryAction
    }
}

public extension AlertConfiguration {
    /// Creates an alert view configuration object.
    /// - Parameters:
    ///   - title: The title text of the alert view.
    ///   - action: Action object.
    ///   - secondaryAction: Secondary action object.
    init(title: Text,
         action: Action,
         secondaryAction: Action)
    {
        self.title = title
        self.message = EmptyView().typeErased
        self.message_ = nil
        self.action = action
        self.secondaryAction = secondaryAction
    }
}

public extension AlertConfiguration {
    /// The action button on the bottom of an alert view.
    struct Action {
        let label: AnyView
        var didSelect: (() -> Void)?
        
        @available(iOS 15, macOS 12, *)
        /// Creates an alert action object.
        /// - Parameters:
        ///   - label: A view that describes the purpose of the action.
        ///   - didSelect: The closure to be called when a user triggers the action.
        public init<V: View>(@ViewBuilder label: () -> V, didSelect: (() -> Void)? = nil) {
            self.label = label().typeErased
            self.label_ = nil
            self.didSelect = didSelect
        }
        
        let label_: Text!
        
        @available(iOS, deprecated: 15)
        @available(macOS, deprecated: 12)
        /// Creates an alert action object.
        /// - Parameters:
        ///   - label: A text that describes the purpose of the action.
        ///   - didSelect: The closure to be called when a user triggers the action.
        public init(label: Text, didSelect: (() -> Void)? = nil) {
            self.label = label.typeErased
            self.label_ = label
            self.didSelect = didSelect
        }
        
        /// Creates an alert action object.
        /// - Parameters:
        ///   - label: A string that describes the purpose of the action.
        ///   - didSelect: The closure to be called when a user triggers the action.
        public init(label: String, didSelect: (() -> Void)? = nil) {
            self.label = Text(label).typeErased
            self.label_ = Text(label)
            self.didSelect = didSelect
        }
        
        mutating func _didSelectSetter(_ closure: @escaping () -> Void) {
            self.didSelect = closure
        }
    }
}

public extension AlertConfiguration {
    /// Default configuration for the alert view showing in the UserConsentForm (required form) when users tap on the deny action.
    static let _UserConsentFormDefault = AlertConfiguration(title: "Without consent you will not be able to continue onboarding.", action: Action(label: NSLocalizedString("Give Consent", comment: "")), secondaryAction: Action(label: NSLocalizedString("Quit", comment: "")))
}
