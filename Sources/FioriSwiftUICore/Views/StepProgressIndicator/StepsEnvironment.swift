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

struct StepStyleKey: EnvironmentKey {
    static var defaultValue: ((_ id: String) -> AnyStepStyle?) = { _ in AnyStepStyle(DefaultStepStyle()) }
}

struct FlexibleStepProgressIndicatorKey: EnvironmentKey {
    static var defaultValue: Bool = false
}

extension EnvironmentValues {
    var stepStyle: (_ id: String) -> AnyStepStyle? {
        get { self[StepStyleKey.self] }
        set { self[StepStyleKey.self] = newValue }
    }
    
    var flexibleStepProgressIndicator: Bool {
        get { self[FlexibleStepProgressIndicatorKey.self] }
        set { self[FlexibleStepProgressIndicatorKey.self] = newValue }
    }
}

public extension View {
    /// Step style for `StepProgressIndicator`.
    /// - Parameter style: Style for `StepProgressIndicator`.
    /// - Returns: A new `StepProgressIndicator` with specific style.
    func stepStyle(_ style: @escaping ((_ id: String) -> (some StepStyle)?)) -> some View {
        let anyStyle: (_ id: String) -> AnyStepStyle? = { id in
            if let s = style(id) {
                return AnyStepStyle(s)
            } else {
                return nil
            }
        }
        return self.environment(\.stepStyle, anyStyle)
    }
    
    /// Flexible `StepProgressIndicator` support.
    /// - Parameter flexible: A boolean value indicating whether layout of `StepProgressIndicator` is flexible. Default value is `false`.
    /// - Returns: A new `StepProgressIndicator` with flexible layout or not. When you want to force steps fill the whole space of container, this value may be invalid when the width of steps is less then the minimum value.
    func flexibleStepProgressIndicator(_ flexible: Bool = true) -> some View {
        self.environment(\.flexibleStepProgressIndicator, flexible)
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
    @ViewBuilder func stepLineModifier(_ transform: @escaping (AnyViewModifier.Content) -> some View) -> some View {
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

struct StepFramesKey: EnvironmentKey {
    static let defaultValue: Binding<[String: CGRect]> = .constant([:])
}

extension EnvironmentValues {
    var stepFrames: Binding<[String: CGRect]> {
        get { self[StepFramesKey.self] }
        set { self[StepFramesKey.self] = newValue }
    }
}

extension View {
    func stepAxis(_ axis: Axis) -> some View {
        self.environment(\.stepAxis, axis)
    }
}

struct AnyStepStyle: StepStyle {
    let node: (StepConfiguration) -> AnyView
    let title: (StepConfiguration) -> AnyView
    let line: (StepConfiguration) -> AnyView
    
    init(_ style: some StepStyle) {
        self.node = {
            AnyView(style.makeNode(configuration: $0))
        }
        self.title = {
            AnyView(style.makeTitle(configuration: $0))
        }
        self.line = {
            AnyView(style.makeLine(configuration: $0))
        }
    }
    
    func makeNode(configuration: StepConfiguration) -> some View {
        self.node(configuration)
    }
    
    func makeTitle(configuration: StepConfiguration) -> some View {
        self.title(configuration)
    }
    
    func makeLine(configuration: StepConfiguration) -> some View {
        self.line(configuration)
    }
}

struct SingleStepProperty {
    let top: CGFloat
    let leading: CGFloat
    let trailing: CGFloat
    let bottom: CGFloat
    let horizontalSpacing: CGFloat
    let verticalSpacing: CGFloat
    let lineSize: CGSize?
    let isLastStep: Bool
    
    init(top: CGFloat,
         leading: CGFloat,
         trailing: CGFloat,
         bottom: CGFloat,
         horizontalSpacing: CGFloat,
         verticalSpacing: CGFloat,
         lineSize: CGSize?,
         isLastStep: Bool)
    {
        self.top = top
        self.leading = leading
        self.trailing = trailing
        self.bottom = bottom
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        self.lineSize = lineSize
        self.isLastStep = isLastStep
    }
    
    init() {
        self.top = 8
        self.leading = 8
        self.trailing = 8
        self.bottom = 8
        self.horizontalSpacing = 8
        self.verticalSpacing = 8
        self.lineSize = nil
        self.isLastStep = false
    }
}

struct SingleStepPropertyKey: EnvironmentKey {
    static let defaultValue = SingleStepProperty()
}

extension EnvironmentValues {
    var singleStepProperty: SingleStepProperty {
        get { self[SingleStepPropertyKey.self] }
        set { self[SingleStepPropertyKey.self] = newValue }
    }
}
