import SwiftUI

struct StepsStack: View {
    var steps: [StepItem]
    var selection: Binding<String>? = nil
    /// :nodoc:
    init(_ steps: [StepItem], selection: Binding<String>? = nil) {
        self.steps = steps
        self.selection = selection
    }
    
    var body: some View {
        ForEach(0 ..< self.count, id: \.self) { index in
            self.view(at: index)
        }
    }
}

extension StepsStack: IndexedViewContainer {
    /// :nodoc:
    public var count: Int {
        self.steps.count
    }
    
    /// :nodoc:
    public var totalCount: Int {
        self.steps.reduce(0) { $0 + $1.totalCount() }
    }
    
    /// :nodoc:
    @ViewBuilder public func view(at index: Int) -> some View {
        if index < self.count {
            _DefaultSteps(stepItems: self.steps, selection: self.selection ?? .constant("")).view(at: index)
        } else {
            EmptyView()
        }
    }
}

extension CGSize {
    func different(with size: CGSize) -> Bool {
        if abs(self.width - size.width) > 0.01 || abs(self.height - size.height) > 0.01 {
            return true
        } else {
            return false
        }
    }
}

extension EmptyView: IndexedViewContainer {
    /// :nodoc:
    public var count: Int {
        0
    }
    
    /// :nodoc:
    public func view(at index: Int) -> some View {
        EmptyView()
    }
}

struct InnerSingleStep<Title: View, Node: View, Line: View>: View {
    let id: String
    let title: Title
    let node: Node
    let line: Line
    let isTitleEmptyView: Bool
    
    var top: CGFloat
    var bottom: CGFloat
    var leading: CGFloat
    var trailing: CGFloat
    var horizontalSpacing: CGFloat
    var verticalSpacing: CGFloat
    var lineSize: CGSize?
    var isLastStep: Bool
    
    @Environment(\.stepStyle) var stepStyle
    @Environment(\.stepAxis) var stepAxis
    @Environment(\.flexibleStepProgressIndicator) private var flexibleSPI
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.spiIsMeasuring) private var spiIsMeasuring
    
    @State var nodeAndLineSize: CGSize = .zero
    
    var stepsSpacing: CGFloat {
        2
    }
    
    var body: some View {
        self.oneStep
    }
    
    private var useFlexibleSPI: Bool {
        self.flexibleSPI && !self.spiIsMeasuring
    }
    
    @ViewBuilder
    var oneStep: some View {
        switch self.stepAxis {
        case .horizontal:
            VStack(alignment: .leading, spacing: 0) {
                Spacer().frame(height: self.top)
                HStack(spacing: self.stepsSpacing) {
                    self.node
                    if !self.isLastStep {
                        if self.useFlexibleSPI {
                            self.line.frame(minWidth: self.lineWidth, maxHeight: self.lineHeight)
                        } else {
                            self.line.frame(width: self.lineWidth, height: self.lineHeight)
                        }
                    } else {
                        if !self.isTitleEmptyView {
                            if self.useFlexibleSPI {
                                self.line.frame(minWidth: self.lineWidth, maxHeight: self.lineHeight)
                            } else {
                                self.line.frame(width: self.lineWidth, height: self.lineHeight)
                            }
                        }
                    }
                }.sizeReader { size in
                    if !self.useFlexibleSPI {
                        if self.nodeAndLineSize.different(with: size) {
                            self.nodeAndLineSize = size
                        }
                    }
                }
                if self.isTitleEmptyView {
                    Spacer().frame(height: abs(self.bottom))
                } else {
                    Spacer().frame(height: self.verticalSpacing)
                    self.title
                        .frame(width: self.useFlexibleSPI ? nil : self.nodeAndLineSize.width, alignment: .leading)
                        .lineLimit(2)
                    Spacer().frame(height: abs(self.bottom))
                }
            }
            .fixedSize(horizontal: false, vertical: self.useFlexibleSPI)
        case .vertical:
            HStack(alignment: .stepsTopAlignment, spacing: 0) {
                Spacer().frame(width: self.leading)
                VStack(spacing: self.stepsSpacing) {
                    self.node
                        .alignmentGuide(.stepsTopAlignment) { $0.height / 2.0 }
                    self.line.frame(maxWidth: self.lineWidth, minHeight: self.lineHeight)
                }
                .alignmentGuide(.stepsLeadingAlignment) { $0[HorizontalAlignment.center] }
                Spacer().frame(width: self.horizontalSpacing)
                self.title.lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .alignmentGuide(.stepsTopAlignment) {
                        ($0.height - ($0[.lastTextBaseline] - $0[.firstTextBaseline])) / 2
                    }
                Spacer().frame(width: abs(self.trailing))
                Spacer()
            }
        }
    }
    
    var lineWidth: CGFloat {
        if let size = lineSize {
            return size.width
        } else {
            switch self.stepAxis {
            case .horizontal:
                if self.horizontalSizeClass == .compact {
                    return 86
                } else {
                    if self.useFlexibleSPI {
                        return 140
                    } else {
                        return 126
                    }
                }
            case .vertical:
                return 2
            }
        }
    }
    
    var lineHeight: CGFloat {
        if let size = lineSize {
            return size.height
        } else {
            switch self.stepAxis {
            case .horizontal:
                return 2
            case .vertical:
                return 36
            }
        }
    }
}
