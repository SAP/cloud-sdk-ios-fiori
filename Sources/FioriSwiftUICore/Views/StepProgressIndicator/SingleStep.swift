import SwiftUI
extension Fiori {
    enum SingleStep {
        typealias Title = EmptyModifier
        typealias TitleCumulative = EmptyModifier
        typealias Node = EmptyModifier
        typealias NodeCumulative = EmptyModifier
        static let title = Title()
        static let node = Node()
        static let titleCumulative = TitleCumulative()
        static let nodeCumulative = NodeCumulative()
    }
}

extension SingleStep: View {
    var stepsSpacing: CGFloat {
        2
    }

    public var body: some View {
        switch stepAxis {
        case .horizontal:
            VStack(alignment: .leading, spacing: 0) {
                Spacer().frame(height: top)
                HStack(spacing: stepsSpacing) {
                    node
                    Rectangle().fill(stepLineColor)
                        .frame(width: lineWidth, height: lineHeight)
                }.sizeReader { size in
                    if nodeAndLineSize.different(with: size) {
                        print("\(size)")
                        nodeAndLineSize = size
                    }
                }
                Spacer().frame(height: verticalSpacing)
                title
                    .frame(width: nodeAndLineSize.width, alignment: .leading)
                    .lineLimit(2)
                Spacer().frame(height: bottom)
            }
        case .vertical:
            HStack(alignment: .stepsTopAlignment, spacing: 0) {
                Spacer().frame(width: leading)
                VStack(spacing: stepsSpacing) {
                    node
                        .alignmentGuide(.stepsTopAlignment) { $0.height / 2.0 }
                    Rectangle().fill(stepLineColor)
                        .frame(maxWidth: lineWidth, minHeight: lineHeight)
                }
                Spacer().frame(width: horizontalSpacing)
                title.lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .alignmentGuide(.stepsTopAlignment) {
                        ($0.height - ($0[.lastTextBaseline] - $0[.firstTextBaseline])) / 2
                    }
                Spacer().frame(width: trailing)
            }
        }
    }
    
    var lineWidth: CGFloat {
        switch stepAxis {
        case .horizontal:
            return 54
        case .vertical:
            return 2
        }
    }
    
    var lineHeight: CGFloat {
        switch stepAxis {
        case .horizontal:
            return 2
        case .vertical:
            return 36
        }
    }
    
    func stepPadding(top: CGFloat,
                     bottom: CGFloat,
                     leading: CGFloat,
                     trailing: CGFloat,
                     vertical: CGFloat,
                     horizontal: CGFloat) -> Self
    {
        var newSelf = self
        newSelf.top = top
        newSelf.bottom = bottom
        newSelf.leading = leading
        newSelf.trailing = trailing
        newSelf.horizontalSpacing = horizontal
        newSelf.verticalSpacing = vertical
        return newSelf
    }
}

struct StepLineColor: EnvironmentKey {
    public static let defaultValue = Color.clear
}

public extension EnvironmentValues {
    var stepLineColor: Color {
        get { self[StepLineColor.self] }
        set { self[StepLineColor.self] = newValue }
    }
}

public extension View {
    func stepLineColor(_ color: Color) -> some View {
        environment(\.stepLineColor, color)
    }
}

struct StepAxisKey: EnvironmentKey {
    static let defaultValue = Axis.horizontal
}

public extension EnvironmentValues {
    var stepAxis: Axis {
        get { self[StepAxisKey.self] }
        set { self[StepAxisKey.self] = newValue }
    }
}

public extension View {
    func stepAxis(_ axis: Axis) -> some View {
        self.environment(\.stepAxis, axis)
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
