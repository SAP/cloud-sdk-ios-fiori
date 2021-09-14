import SwiftUI

public struct _AllowActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Allow", comment: "")
    }
    
    public init() {}
}

public struct _NextActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Next", comment: "")
    }
    
    public init() {}
}

public struct _CancelActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Cancel", comment: "")
    }
    
    public init() {}
}

public struct _AgreeActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Agree", comment: "")
    }
    
    public init() {}
}

public struct _DisagreeActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Disagree", comment: "")
    }
    
    public init() {}
}

public struct _DenyActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Deny", comment: "")
    }
    
    public init() {}
}

public struct _NotNowActionDefault: ActionModel {
    public var actionText: String? {
        NSLocalizedString("Not Now", comment: "")
    }
    
    public init() {}
}
