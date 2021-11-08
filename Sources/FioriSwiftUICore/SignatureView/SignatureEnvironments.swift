// This file contains the extra codes for EnvironmentKay and ENvironmentValues for SignatureCaptureView

import SwiftUI

struct CancelActionModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct StartActionModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct RestartActionModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct ClearActionModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

struct SaveActionModifierKey: EnvironmentKey {
    public static let defaultValue = AnyViewModifier { $0 }
}

public extension EnvironmentValues {
    var cancelActionModifier: AnyViewModifier {
        get { self[CancelActionModifierKey.self] }
        set { self[CancelActionModifierKey.self] = newValue }
    }

    var startActionModifier: AnyViewModifier {
        get { self[StartActionModifierKey.self] }
        set { self[StartActionModifierKey.self] = newValue }
    }

    var restartActionModifier: AnyViewModifier {
        get { self[RestartActionModifierKey.self] }
        set { self[RestartActionModifierKey.self] = newValue }
    }

    var clearActionModifier: AnyViewModifier {
        get { self[ClearActionModifierKey.self] }
        set { self[ClearActionModifierKey.self] = newValue }
    }

    var saveActionModifier: AnyViewModifier {
        get { self[SaveActionModifierKey.self] }
        set { self[SaveActionModifierKey.self] = newValue }
    }
}

public extension View {
    @ViewBuilder
    func cancelActionModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.cancelActionModifier, AnyViewModifier(transform))
    }

    @ViewBuilder
    func startActionModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.startActionModifier, AnyViewModifier(transform))
    }

    @ViewBuilder
    func restartActionModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.restartActionModifier, AnyViewModifier(transform))
    }

    @ViewBuilder
    func clearActionModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.clearActionModifier, AnyViewModifier(transform))
    }

    @ViewBuilder
    func saveActionModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.saveActionModifier, AnyViewModifier(transform))
    }
}
