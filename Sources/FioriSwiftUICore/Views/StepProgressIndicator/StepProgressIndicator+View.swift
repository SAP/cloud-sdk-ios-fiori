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
    
    public var body: some View {
        switch axis {
        case .horizontal:
            VStack {
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
                HStack(alignment: .top, spacing: stepsSpacing) {
                    ForEach(0 ..< stepsCount, id: \.self) { index in
                        steps.view(at: index)
                    }
                }
            }
        case .vertical:
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: stepsSpacing) {
                    ForEach(0 ..< stepsCount, id: \.self) { index in
                        steps.view(at: index)
                    }
                }
            }.padding(20)
        }
    }
    
    @ViewBuilder var stepsHeader: some View {
        if isActionEmptyView && isTitleEmptyView {
            EmptyView()
        } else {
            HStack(alignment: .top) {
                title
                Spacer()
                Button {
                    isPresented.toggle()
                } label: {
                    action
                }
            }
            .sheet(isPresented: $isPresented) {
                verticalSteps()
            }
        }
    }
    
    func verticalSteps() -> some View {
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

public extension StepProgressIndicator {
    init(selection: Binding<UUID>,
         stepsData: [StepItem])
        where Steps == _DefaultSteps, ActionView == EmptyView, Title == EmptyView, CancelActionView == Action
    {
        self._selection = selection
        self.stepsData = stepsData
        
        self._title = EmptyView()
        self._action = EmptyView()
        self._cancelAction = Action(model: _CancelActionDefault())
        
        self._steps = _DefaultSteps(stepsData: stepsData,
                                    selection: selection)
    }
    
    init(selection: Binding<UUID>,
         stepsData: [StepItem],
         @ViewBuilder title: @escaping () -> Title,
         @ViewBuilder action: @escaping () -> ActionView)
        where Steps == _DefaultSteps, CancelActionView == Action
    {
        self._selection = selection
        self.stepsData = stepsData
        self._title = title()
        self._action = action()
        self._cancelAction = Action(model: _CancelActionDefault())

        self._steps = _DefaultSteps(stepsData: stepsData,
                                    selection: selection)
    }
    
    init(selection: Binding<UUID>,
         stepsData: [StepItem],
         @ViewBuilder action: @escaping () -> ActionView)
        where Steps == _DefaultSteps, CancelActionView == Action, Title == EmptyView
    {
        self._selection = selection
        self.stepsData = stepsData
        self._title = EmptyView()
        self._action = action()
        self._cancelAction = Action(model: _CancelActionDefault())
        
        self._steps = _DefaultSteps(stepsData: stepsData,
                                    selection: selection)
    }
    
    init(selection: Binding<UUID>,
         stepsData: [StepItem],
         @ViewBuilder title: @escaping () -> Title)
        where Steps == _DefaultSteps, CancelActionView == Action, ActionView == EmptyView
    {
        self._selection = selection
        self.stepsData = stepsData
        self._title = title()
        self._action = EmptyView()
        self._cancelAction = Action(model: _CancelActionDefault())
        
        self._steps = _DefaultSteps(stepsData: stepsData,
                                    selection: selection)
    }
}
