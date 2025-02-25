// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol SortFilterViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SortFilterViewConfiguration) -> Body
}

struct AnySortFilterViewStyle: SortFilterViewStyle {
    let content: (SortFilterViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SortFilterViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SortFilterViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SortFilterViewConfiguration {
    public var componentIdentifier: String = "fiori_sortfilterview_component"
    public let title: Title
    public let cancelAction: CancelAction
    public let applyAction: ApplyAction
    public let resetAction: ResetAction
    @Binding public var items: [[SortFilterItem]]
    public let onUpdate: (() -> Void)?
    public let onCancel: (() -> Void)?
    public let onReset: (() -> Void)?

    public typealias Title = ConfigurationViewWrapper
    public typealias CancelAction = ConfigurationViewWrapper
    public typealias ApplyAction = ConfigurationViewWrapper
    public typealias ResetAction = ConfigurationViewWrapper
}

extension SortFilterViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct SortFilterViewFioriStyle: SortFilterViewStyle {
    public func makeBody(_ configuration: SortFilterViewConfiguration) -> some View {
        SortFilterView(configuration)
            .titleStyle(TitleFioriStyle(sortFilterViewConfiguration: configuration))
            .cancelActionStyle(CancelActionFioriStyle(sortFilterViewConfiguration: configuration))
            .applyActionStyle(ApplyActionFioriStyle(sortFilterViewConfiguration: configuration))
            .resetActionStyle(ResetActionFioriStyle(sortFilterViewConfiguration: configuration))
    }
}
