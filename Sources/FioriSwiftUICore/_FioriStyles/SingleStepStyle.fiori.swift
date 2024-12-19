import FioriThemeManager
import Foundation
import SwiftUI

public extension SingleStep {
    init(id: String = UUID().uuidString,
         @ViewBuilder title: () -> any View,
         @ViewBuilder node: () -> any View,
         @IndexedViewBuilder substeps: () -> any IndexedViewContainer)
    {
        self.init(title: title, node: node, id: id, substeps: substeps)
    }
    
    init(id: String = UUID().uuidString,
         @ViewBuilder node: () -> any View,
         @IndexedViewBuilder substeps: () -> any IndexedViewContainer)
    {
        self.init(title: { EmptyView() }, node: node, id: id, substeps: substeps)
    }
    
    init(id: String = UUID().uuidString,
         @ViewBuilder node: () -> any View)
    {
        self.init(title: { EmptyView() }, node: node, id: id)
    }
}

// Base Layout style
public struct SingleStepBaseStyle: SingleStepStyle {
    @Environment(\.stepAxis) var stepAxis
    @Environment(\.currentStepId) var currentStepId
    
    let stepsSpacing: CGFloat = 2
    
    var horizontalSpacing: CGFloat = 8
    var leading: CGFloat = 8
    var top: CGFloat = 8
    var verticalSpacing: CGFloat = 8
    var trailing: CGFloat = 8
    var bottom: CGFloat = 8
    
    /// :nodoc:
    public func makeBody(_ configuration: SingleStepConfiguration) -> some View {
        self.singleStep(configuration)
    }
    
    @ViewBuilder
    func singleStep(_ configuration: SingleStepConfiguration) -> some View {
        let subSteps = configuration.substeps
        switch self.stepAxis {
        case .horizontal:
            HStack(spacing: self.stepsSpacing) {
                self.stepContainer(configuration)
                ForEach(0 ..< subSteps.count, id: \.self) { index in
                    subSteps.view(at: index).typeErased
                }
            }
        case .vertical:
            VStack(spacing: self.stepsSpacing) {
                self.stepContainer(configuration)
                ForEach(0 ..< subSteps.count, id: \.self) { index in
                    subSteps.view(at: index).typeErased
                }
            }
        }
    }

    @ViewBuilder func stepContainer(_ configuration: SingleStepConfiguration) -> some View {
        let _id = configuration.id
        let state = configuration.state
        let isLastStep = false
        
        Button {
            if self.currentStepId.wrappedValue != _id, state != .disabled {
                self.currentStepId.wrappedValue = _id
            }
        } label: {
            // setup label in button style
            EmptyView()
        }
        .buttonStyle(StepButtonStyle(id: _id,
                                     node: configuration.node.typeErased,
                                     title: configuration.title.typeErased,
                                     line: configuration.line.typeErased,
                                     state: state,
                                     isSelected: self.currentStepId.wrappedValue == _id,
                                     isLastStep: isLastStep,
                                     isTitleEmptyView: configuration.title.isEmpty,
                                     top: self.top,
                                     bottom: self.bottom,
                                     leading: self.leading,
                                     trailing: self.trailing,
                                     horizontalSpacing: self.horizontalSpacing,
                                     verticalSpacing: self.verticalSpacing,
                                     lineSize: nil))
    }
}

// Default fiori styles
extension SingleStepFioriStyle {
    struct ContentFioriStyle: SingleStepStyle {
        func makeBody(_ configuration: SingleStepConfiguration) -> some View {
            SingleStep(configuration)
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let singleStepConfiguration: SingleStepConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
        }
    }
    
    struct NodeFioriStyle: NodeStyle {
        let singleStepConfiguration: SingleStepConfiguration
        
        func makeBody(_ configuration: NodeConfiguration) -> some View {
            Node(configuration)
        }
        
        @ViewBuilder func node(_ singleStepConfiguration: SingleStepConfiguration) -> some View {
            switch singleStepConfiguration.state {
            case .normal:
                Circle().strokeBorder(lineWidth: 2)
            case .completed:
                Circle().fill(Color.clear)
            case .disabled:
                let strokeStyle = StrokeStyle(lineWidth: 2, lineCap: .butt, lineJoin: .miter, miterLimit: 0, dash: [3], dashPhase: 0)
                Circle()
                    .strokeBorder(style: strokeStyle)
            default:
                Circle().strokeBorder(lineWidth: 1)
            }
        }
    }
    
    struct LineFioriStyle: LineStyle {
        let singleStepConfiguration: SingleStepConfiguration
    
        func makeBody(_ configuration: LineConfiguration) -> some View {
            Line(configuration)
        }
    }
}
