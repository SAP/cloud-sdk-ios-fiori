import SwiftUI

struct CurrentStepIdKey: EnvironmentKey {
    static let defaultValue: Binding<String> = .constant("")
}

extension EnvironmentValues {
    var currentStepId: Binding<String> {
        get { self[CurrentStepIdKey.self] }
        set { self[CurrentStepIdKey.self] = newValue }
    }
}

struct StepsStyleKey: EnvironmentKey {
    static var defaultValue: ((_ id: String) -> (any StepsStyle)?) = { _ in DefaultStepsStyle() }
}

extension EnvironmentValues {
    var stepsStyle: (_ id: String) -> (any StepsStyle)? {
        get { self[StepsStyleKey.self] }
        set { self[StepsStyleKey.self] = newValue }
    }
}

public extension View {
    /// Step style for `StepProgressIndicator`.
    /// - Parameter style: Style for `StepProgressIndicator`.
    /// - Returns: A new `StepProgressIndicator` with specific style.
    func stepsStyle(_ style: @escaping ((_ id: String) -> (some StepsStyle)?)) -> some View {
        environment(\.stepsStyle, style)
    }
}

struct StepLineModifierKey: EnvironmentKey {
    /// Step separator line environment key for `SingleStep`.
    public static let defaultValue = AnyViewModifier { $0 }
}

public extension EnvironmentValues {
    /// Step separator line environment value for `SingleStep`.
    var stepLineModifier: AnyViewModifier {
        get { self[StepLineModifierKey.self] }
        set { self[StepLineModifierKey.self] = newValue }
    }
}

public extension View {
    /// Modifier for step separator line.
    /// - Parameter transform: Any transform.
    /// - Returns: A new view with modified line.
    @ViewBuilder func stepLineModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.stepLineModifier, AnyViewModifier(transform))
    }
}

struct StepAxisKey: EnvironmentKey {
    static let defaultValue = Axis.horizontal
}

extension EnvironmentValues {
    var stepAxis: Axis {
        get { self[StepAxisKey.self] }
        set { self[StepAxisKey.self] = newValue }
    }
}

extension View {
    func stepAxis(_ axis: Axis) -> some View {
        self.environment(\.stepAxis, axis)
    }
}
