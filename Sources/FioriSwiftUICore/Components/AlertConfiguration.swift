import Foundation
import SwiftUI

public struct AlertConfiguration {
    let title: Text
    
    // iOS 15+
    let message: AnyView
    var action: Action
    var secondaryAction: Action
    
    @available(iOS 15, macOS 12, *)
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
    
    public init(title: String, message: String? = nil, action: Action, secondaryAction: Action) {
        self.title = Text(title)
        self.message = message != nil ? Text(message!).typeErased : EmptyView().typeErased
        self.message_ = message != nil ? Text(message!) : nil
        self.action = action
        self.secondaryAction = secondaryAction
    }
}

public extension AlertConfiguration {
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
    struct Action {
        let label: AnyView
        var didSelect: (() -> Void)?
        
        @available(iOS 15, macOS 12, *)
        public init<V: View>(@ViewBuilder label: () -> V, didSelect: (() -> Void)? = nil) {
            self.label = label().typeErased
            self.label_ = nil
            self.didSelect = didSelect
        }
        
        let label_: Text!
        
        @available(iOS, deprecated: 15)
        @available(macOS, deprecated: 12)
        public init(label: Text, didSelect: (() -> Void)? = nil) {
            self.label = label.typeErased
            self.label_ = label
            self.didSelect = didSelect
        }
        
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
    static let UserConsentFormDefault = AlertConfiguration(title: "Without consent you will not be able to continue onboarding.", action: Action(label: NSLocalizedString("Give Consent", comment: "")), secondaryAction: Action(label: NSLocalizedString("Quit", comment: "")))
}
