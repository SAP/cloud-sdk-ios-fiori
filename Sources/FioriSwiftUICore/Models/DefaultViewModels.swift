import SwiftUI

public struct _AllowActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Allow", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: "")
    }
    
    public init() {}
}

public struct _NextActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Next", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: "")
    }
    
    public init() {}
}

public struct _CancelActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: "")
    }
    
    public init() {}
}

public struct _ResetActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: "")
    }
    
    public init() {}
}

public struct _ApplyActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Apply", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: "")
    }
    
    public init() {}
}

public struct _AgreeActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Agree", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: "")
    }
    
    public init() {}
}

public struct _DisagreeActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Disagree", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: "")
    }
    
    public init() {}
}

public struct _DenyActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Deny", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: "")
    }
    
    public init() {}
}

public struct _NotNowActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Not Now", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: "")
    }
    
    public init() {}
}

public struct _TapToSignActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Tap to Sign", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: "")
    }

    public init() {}
}

public struct _ReEnterSignatureActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Re-enter Signature", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: "")
    }

    public init() {}
}

public struct _ClearActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Clear", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: "")
    }

    public init() {}
}

public struct _SaveActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Save", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: "")
    }

    public init() {}
}

public struct _DoneActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Done", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: "")
    }

    public init() {}
}

public let _UserConsentFormAlertConfigurationDefault: (UserConsentAlertType) -> AlertConfiguration? = { alertType in
    switch alertType {
    case .deny:
        return AlertConfiguration(title: NSLocalizedString("Without consent you will not be able to continue onboarding.", comment: ""), action: AlertConfiguration.Action(label: NSLocalizedString("Give Consent", comment: "")), secondaryAction: AlertConfiguration.Action(label: NSLocalizedString("Quit", comment: "")))
    case .cancel:
        return AlertConfiguration(title: NSLocalizedString("Are you sure you want to quit the onboarding process?", comment: ""), action: AlertConfiguration.Action(label: NSLocalizedString("No", comment: "")), secondaryAction: AlertConfiguration.Action(label: NSLocalizedString("Quit", comment: "")))
    }
}

public struct _AllStepsActionDefault: ActionModel {
    public var actionText: String? {
        nil
    }

    public init() {}
}

private let fioriSwiftUICoreBundle = Bundle.accessor
