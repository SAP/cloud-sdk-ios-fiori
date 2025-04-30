import FioriThemeManager
import Foundation
import SwiftUI

/// :nodoc:
public extension StepProgressIndicator {
    init(selection: Binding<String>,
         @ViewBuilder title: () -> any View = { EmptyView() },
         @ViewBuilder action: () -> any View = { EmptyView() },
         @ViewBuilder cancelAction: () -> any View = { FioriButton { _ in Text("Cancel".localizedFioriString()) } },
         @IndexedViewBuilder steps: () -> any IndexedViewContainer = { EmptyView() })
    {
        self.init(title: title, action: action, cancelAction: cancelAction, selection: selection, steps: steps)
    }

    /// Convenience initializer for default step progress indicator.
    /// - Parameters:
    ///   - selection: A binding string for selected step id.
    ///   - stepItems: An array of `StepItem` for default steps generation.
    ///   - title: Title for current step displayed on the top leading side of the step progress indicator.
    ///   - action: Action for steps displayed on the top trailing side of the step progress indicator. It will show vertical steps.
    init(selection: Binding<String>,
         stepItems: [StepItem],
         @ViewBuilder title: @escaping () -> any View,
         @ViewBuilder action: @escaping () -> any View)
    {
        self.init(title: title,
                  action: action,
                  selection: selection,
                  steps: { StepsStack(stepItems, selection: selection) })
    }
    
    /// Convenience initializer for default step progress indicator.
    /// - Parameters:
    ///   - selection: A binding string for selected step id.
    ///   - stepItems: An array of `StepItem` for default steps generation.
    ///   - title: Title for current step displayed on the top leading side of the step progress indicator.
    init(selection: Binding<String>,
         stepItems: [StepItem],
         @ViewBuilder title: @escaping () -> any View)
    {
        self.init(title: title,
                  selection: selection,
                  steps: { StepsStack(stepItems, selection: selection) })
    }
    
    /// Convenience initializer for default step progress indicator.
    /// - Parameters:
    ///   - selection: A binding string for selected step id.
    ///   - stepItems: An array of `StepItem` for default steps generation.
    ///   - action: Action for steps displayed on the top trailing side of the step progress indicator. It will show vertical steps.
    init(selection: Binding<String>,
         stepItems: [StepItem],
         @ViewBuilder action: @escaping () -> any View)
    {
        self.init(title: { EmptyView() },
                  action: action,
                  selection: selection,
                  steps: { StepsStack(stepItems, selection: selection) })
    }
    
    /// Convenience initializer for default step progress indicator.
    /// - Parameters:
    ///   - selection: A binding string for selected step id.
    ///   - stepItems: An array of `StepItem` for default steps generation.
    init(selection: Binding<String>,
         stepItems: [StepItem])
    {
        self.init(title: { EmptyView() },
                  selection: selection,
                  steps: { StepsStack(stepItems, selection: selection) })
    }
}

// Base Layout style
public struct StepProgressIndicatorBaseStyle: StepProgressIndicatorStyle {
    @State var isPresented: Bool = false
    @State var stepFrames: [String: CGRect] = [:]
    @State var scrollBounds: CGRect = .zero
    let stepsSpacing: CGFloat = 2
    
    @ViewBuilder
    public func makeBody(_ configuration: StepProgressIndicatorConfiguration) -> some View {
        VStack(spacing: 0) {
            self.stepsHeader(configuration)
            self.stepsContainer(configuration, axis: .horizontal)
        }
        .ifApply(!configuration.isSeparatorHidden, content: { content in
            VStack(spacing: 10) {
                content
                configuration.separator
            }
        })
    }
    
    @ViewBuilder func stepsHeader(_ configuration: StepProgressIndicatorConfiguration) -> some View {
        if configuration.action.isEmpty, configuration.title.isEmpty {
            EmptyView()
        } else {
            HStack(alignment: .center) {
                configuration.title
                    .font(.fiori(forTextStyle: .headline, weight: .semibold))
                Spacer()
                configuration.action
                    .onSimultaneousTapGesture(perform: {
                        self.isPresented.toggle()
                    })
            }
            .frame(minHeight: 44)
            .sheet(isPresented: self.$isPresented) {
                NavigationStack {
                    ScrollViewReader { _ in
                        self.stepsContainer(configuration, axis: .vertical)
                    }
                    .navigationTitle(NSLocalizedString(NSLocalizedString("All Steps", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "All Steps"), comment: ""))
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            configuration.cancelAction.onSimultaneousTapGesture {
                                self.isPresented.toggle()
                            }
                        }
                    }
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
    
    @ViewBuilder func stepsContainer(_ configuration: StepProgressIndicatorConfiguration, axis: Axis) -> some View {
        switch axis {
        case .horizontal:
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    self.stepsGenerator(configuration, axis: .horizontal)
                        .environment(\.stepFrames, self.$stepFrames)
                        .setOnChange(of: configuration.$selection.wrappedValue, action1: { newValue in
                            if let currentFrame = stepFrames[newValue],
                               !scrollBounds.contains(currentFrame)
                            {
                                withAnimation {
                                    proxy.scrollTo(newValue, anchor: .leading)
                                }
                            }
                        }) { _, newValue in
                            if let currentFrame = stepFrames[newValue],
                               !scrollBounds.contains(currentFrame)
                            {
                                withAnimation {
                                    proxy.scrollTo(newValue, anchor: .leading)
                                }
                            }
                        }
                }
            }
            .coordinateSpace(name: "SPICoordinateSpace")
            .frameReader(in: .local) { rect in
                self.scrollBounds = rect
            }
        case .vertical:
            ScrollViewReader { _ in
                ScrollView(.vertical, showsIndicators: false) {
                    self.stepsGenerator(configuration, axis: .vertical)
                }.padding(20)
            }
        }
    }
    
    @ViewBuilder func stepsGenerator(_ configuration: StepProgressIndicatorConfiguration, axis: Axis) -> some View {
        switch axis {
        case .horizontal:
            HStack(alignment: .top, spacing: self.stepsSpacing) {
                ForEach(0 ..< configuration.steps.count, id: \.self) { index in
                    configuration.steps.view(at: index).typeErased
                        .environment(\.stepAxis, axis)
                        .environment(\.currentStepId, configuration.$selection)
                }
            }
        case .vertical:
            VStack(alignment: .stepsLeadingAlignment, spacing: self.stepsSpacing) {
                ForEach(0 ..< configuration.steps.count, id: \.self) { index in
                    configuration.steps.view(at: index).typeErased
                        .environment(\.stepAxis, axis)
                        .environment(\.currentStepId, configuration.$selection)
                }
            }
        }
    }
}

// Default fiori styles
extension StepProgressIndicatorFioriStyle {
    struct ContentFioriStyle: StepProgressIndicatorStyle {
        func makeBody(_ configuration: StepProgressIndicatorConfiguration) -> some View {
            StepProgressIndicator(configuration)
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let stepProgressIndicatorConfiguration: StepProgressIndicatorConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .headline, weight: .semibold))
        }
    }
    
    struct ActionFioriStyle: ActionStyle {
        let stepProgressIndicatorConfiguration: StepProgressIndicatorConfiguration
        
        func makeBody(_ configuration: ActionConfiguration) -> some View {
            Action(configuration)
        }
    }
    
    struct CancelActionFioriStyle: CancelActionStyle {
        let stepProgressIndicatorConfiguration: StepProgressIndicatorConfiguration
        
        func makeBody(_ configuration: CancelActionConfiguration) -> some View {
            CancelAction(configuration)
                .fioriButtonStyle(FioriPlainButtonStyle())
        }
    }
    
    struct SeparatorFioriStyle: SeparatorStyle {
        let stepProgressIndicatorConfiguration: StepProgressIndicatorConfiguration
    
        func makeBody(_ configuration: SeparatorConfiguration) -> some View {
            Separator(configuration)
            // Add default style for Separator
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
}
