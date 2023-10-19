import SwiftUI

class SortFilterContext: ObservableObject {
    @Published public var isResetButtonEnabled: Bool = false
    @Published public var isApplyButtonEnabled: Bool = false
    
    @Published public var handleCancel: (() -> Void)?
    @Published public var handleReset: (() -> Void)?
    @Published public var handleApply: (() -> Void)?
    
    @Published public var handleDismiss: (() -> Void)?
    
    public init() {}
}
