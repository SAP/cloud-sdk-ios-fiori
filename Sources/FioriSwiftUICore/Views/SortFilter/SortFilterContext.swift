import SwiftUI

class SortFilterContext: Equatable, ObservableObject {
    @Published public var isResetButtonEnabled: Bool = false
    @Published public var isApplyButtonEnabled: Bool = false
    
    @Published public var isPickerListShown: Bool = false
    @Published public var isSearchBarHidden: Bool = true
    @Published public var isKeyboardShown: Bool = false
    
    @Published public var handleCancel: (() -> Void)?
    @Published public var handleReset: (() -> Void)?
    @Published public var handleApply: (() -> Void)?
    
    @Published public var handleDismiss: (() -> Void)?
    
    public init() {}
    
    static func == (lhs: SortFilterContext, rhs: SortFilterContext) -> Bool {
        lhs.isResetButtonEnabled == rhs.isResetButtonEnabled && lhs.isApplyButtonEnabled == rhs.isApplyButtonEnabled
    }
}
