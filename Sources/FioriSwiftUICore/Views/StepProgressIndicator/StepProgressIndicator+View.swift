import FioriThemeManager
import SwiftUI

extension Fiori {
    enum StepProgressIndicator {
        typealias Title = EmptyModifier
        typealias TitleCumulative = EmptyModifier
        typealias Action = EmptyModifier
        typealias ActionCumulative = EmptyModifier
        typealias CancelAction = EmptyModifier
        typealias CancelActionCumulative = EmptyModifier
        static let title = Title()
        static let action = Action()
        static let cancelAction = CancelAction()
        static let titleCumulative = TitleCumulative()
        static let actionCumulative = ActionCumulative()
        static let cancelActionCumulative = CancelActionCumulative()
    }
}

extension StepProgressIndicator: View {
    var stepsCount: Int {
        steps.count
    }
    
    var stepsSpacing: CGFloat {
        2
    }
    
    /// :nodoc:
    public var body: some View {
        switch axis {
        case .horizontal:
            VStack(spacing: 0) {
                stepsHeader
                stepsContainer
            }
        case .vertical:
            stepsContainer
        }
    }
    
    @ViewBuilder var stepsContainer: some View {
        switch axis {
        case .horizontal:
            ScrollView(.horizontal, showsIndicators: false) {
                StepProgressIndicatorContainer(selection: _selection,
                                               steps: steps)
            }
        case .vertical:
            ScrollView(.vertical, showsIndicators: false) {
                StepProgressIndicatorContainer(selection: _selection,
                                               steps: steps)
            }.padding(20)
        }
    }
    
    @ViewBuilder var stepsHeader: some View {
        if isActionEmptyView && isTitleEmptyView {
            EmptyView()
        } else {
            HStack(alignment: .center) {
                title
                Spacer()
                action
                    .simultaneousGesture(LongPressGesture(minimumDuration: 0).onEnded { _ in
                        self.isPresented.toggle()
                    })
            }
            .frame(minHeight: 44)
            .sheet(isPresented: $isPresented) {
                verticalSteps
            }
        }
    }
    
    var verticalSteps: some View {
        var newSelf = self
        newSelf.axis = .vertical
        return NavigationView {
            newSelf.stepAxis(.vertical)
                .navigationTitle(NSLocalizedString("All Steps", comment: ""))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        cancelAction.onSimultaneousTapGesture {
                            isPresented.toggle()
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
        }
    }
}

/// :nodoc:
public extension StepProgressIndicator where Steps == _DefaultSteps, CancelActionView == Action {
    /// Convenience initialization for default step progress indicator.
    /// - Parameters:
    ///   - selection: A binding string for selected step id.
    ///   - stepItems: An array of `StepItem` for default steps generation.
    ///   - title: Title for current step displayed on steps top-left .
    ///   - action: Action for steps displayed on steps top-right that will show a vertical steps.
    init(selection: Binding<String>,
         stepItems: [StepItem],
         @ViewBuilder title: @escaping () -> Title,
         @ViewBuilder action: @escaping () -> ActionView)
    {
        self._selection = selection
        self.stepItems = stepItems
        self._title = title()
        self._action = action()
        self._cancelAction = Action(model: _CancelActionDefault())
        
        self._steps = _DefaultSteps(stepItems: stepItems,
                                    selection: selection)
    }
    
    /// Convenience initialization for default step progress indicator.
    /// - Parameters:
    ///   - selection: A binding string for selected step id.
    ///   - stepItems: An array of `StepItem` for default steps generation.
    ///   - title: Title for current step displayed on steps top-left .
    init(selection: Binding<String>,
         stepItems: [StepItem],
         @ViewBuilder title: @escaping () -> Title) where ActionView == EmptyView
    {
        self.init(selection: selection,
                  stepItems: stepItems,
                  title: title,
                  action: { EmptyView() })
    }
    
    /// Convenience initialization for default step progress indicator.
    /// - Parameters:
    ///   - selection: A binding string for selected step id.
    ///   - stepItems: An array of `StepItem` for default steps generation.
    ///   - action: Action for steps displayed on steps top-right that will show a vertical steps.
    init(selection: Binding<String>,
         stepItems: [StepItem],
         @ViewBuilder action: @escaping () -> ActionView) where Title == EmptyView
    {
        self.init(selection: selection,
                  stepItems: stepItems,
                  title: { EmptyView() },
                  action: action)
    }
    
    /// Convenience initialization for default step progress indicator.
    /// - Parameters:
    ///   - selection: A binding string for selected step id.
    ///   - stepItems: An array of `StepItem` for default steps generation.
    init(selection: Binding<String>,
         stepItems: [StepItem]) where Title == EmptyView, ActionView == EmptyView
    {
        self.init(selection: selection,
                  stepItems: stepItems,
                  title: { EmptyView() },
                  action: { EmptyView() })
    }
}
