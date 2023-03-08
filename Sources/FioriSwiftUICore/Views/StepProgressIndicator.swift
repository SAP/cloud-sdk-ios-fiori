import FioriThemeManager
import SwiftUI

/// Step progress indicator
public struct StepProgressIndicator: View {
    private let stepCount: Int
    private var currentStep: Int = 0
    private var spacing: CGFloat = 8
    private var cornerRadius: CGFloat = 3
    private var indicator = Color.preferredColor(.separator)
    private var highlightedIndicator = Color.preferredColor(.tintColor)
    
    /// `StepProgressIndicator` initialization
    /// - Parameter stepCount: Step count.
    public init(stepCount: Int = 0) {
        self.stepCount = stepCount
    }
    
    /// :nodoc:
    public var body: some View {
        HStack(spacing: spacing) {
            ForEach(0 ..< stepCount, id: \.self) {
                if $0 <= currentStep {
                    highlightedIndicator.cornerRadius(cornerRadius)
                } else {
                    indicator.cornerRadius(cornerRadius)
                }
            }
        }
        .frame(height: 6)
    }
    
    /// Modify the indicator color.
    /// - Parameter color: `Color` for the indicator.
    /// - Returns: `StepProgressIndicator`.
    public func indicatorColor(_ color: Color) -> Self {
        var newSelf = self
        newSelf.indicator = color
        return newSelf
    }
    
    /// Modify the highlighted indicator color.
    /// - Parameter color: `Color` for the highlighted indicator.
    /// - Returns: `StepProgressIndicator`
    public func highlightedIndicatorColor(_ color: Color) -> Self {
        var newSelf = self
        newSelf.highlightedIndicator = color
        return newSelf
    }
    
    /// Modify the spacing between the indicators.
    /// - Parameter spacing: Dimensions of the spacing between the indicators.
    /// - Returns: `StepProgressIndicator`
    public func spacing(_ spacing: CGFloat) -> Self {
        var newSelf = self
        newSelf.spacing = spacing
        return newSelf
    }
    
    /// Modify the current step in `StepProgressIndicator`
    /// - Parameter currentStep: Index  of the current step.
    /// - Returns: `StepProgressIndicator`
    public func currentStep(_ currentStep: Int) -> Self {
        var newSelf = self
        newSelf.currentStep = currentStep
        return newSelf
    }
}

struct StepProgressIndicator_Previews: PreviewProvider {
    static var previews: some View {
        StepProgressIndicator()
    }
}
