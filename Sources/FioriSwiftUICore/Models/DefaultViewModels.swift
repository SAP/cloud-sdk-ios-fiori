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

private let fioriSwiftUICoreBundle = Bundle.accessor
