import Foundation
import SwiftUI

public extension View {
    /// Set max number of items that can be displayed in a component.
    /// - Parameter num: Max number of items that can be displayed
    /// - Returns: A view that uses given value.
    ///
    /// Supported components:
    /// - MenuSelection
    func maxNumberOfItems(_ num: Int) -> some View {
        self.environment(\.maxNumberOfItems, num)
    }
}

extension View {
    func onSimultaneousTapGesture(count: Int = 1, perform action: @escaping () -> Void) -> some View {
        self.accessibilitySimultaneousGesture(TapGesture(count: count).onEnded {
            action()
        })
    }
    
    // In order to fix an issue where the simultaneous gesture is not activated in voice over.
    func accessibilitySimultaneousGesture(_ gesture: some Gesture, including mask: GestureMask = .all) -> some View {
        simultaneousGesture(gesture, including: mask)
            .accessibilityElement()
    }
}

extension View {
    @ViewBuilder
    func alert(configuration: AlertConfiguration, isPresented: Binding<Bool>) -> some View {
        self.alert(isPresented: isPresented) {
            Alert(title: configuration.title, message: configuration.message_, primaryButton: .default(configuration.action.label_, action: configuration.action.didSelect ?? {}), secondaryButton: .cancel(configuration.secondaryAction.label_, action: configuration.secondaryAction.didSelect ?? {}))
        }
    }
}

public protocol _ViewEmptyChecking {
    // Check if the view is an empty view. Some SDK components implement this protocol to define their own empty logic.
    var isEmpty: Bool { get }
}

extension View {
    var isEmpty: Bool {
        if self is EmptyView {
            return true
        }
        
        if let self = self as? _ViewEmptyChecking {
            return self.isEmpty
        }
        
        return false
    }
}

extension View {
    nonisolated func setOnChange<V>(
        of value: V,
        initial: Bool = false,
        action1: @escaping (V) -> Void,
        action2: @escaping (V, V) -> Void
    ) -> some View where V: Equatable {
        if #available(iOS 17.0, *) {
            return self.onChange(of: value, initial: initial) {
                action2($0, $1)
            }
        } else {
            return self.onChange(of: value) {
                action1($0)
            }
        }
    }

    nonisolated func setOnChange(
        of value: some Equatable,
        initial: Bool = false,
        _ action: @escaping () -> Void
    ) -> some View {
        if #available(iOS 17.0, *) {
            return self.onChange(of: value, initial: initial) {
                action()
            }
        } else {
            return self.onChange(of: value) { _ in
                action()
            }
        }
    }
}
