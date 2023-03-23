import SwiftUI
extension Fiori {
    enum SingleStep {
        typealias Name = EmptyModifier
        typealias NameCumulative = EmptyModifier
        typealias OverText = EmptyModifier
        typealias OverTextCumulative = EmptyModifier
        
        static let name = Name()
        static let overText = OverText()
        static let nameCumulative = NameCumulative()
        static let overTextCumulative = OverTextCumulative()
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
                    overText
                    Rectangle().fill(stepLineColor)
                        .frame(width: lineWidth, height: lineHeight)
                }.sizeReader { size in
                    nodeAndLineSize = size
                }
                Spacer().frame(height: verticalSpacing)
                name
                    .frame(width: nodeAndLineSize.width, alignment: .leading)
                    .lineLimit(2)
                Spacer().frame(height: bottom)
            }
        case .vertical:
            HStack(alignment: .stepsTopAlignment, spacing: 0) {
                Spacer().frame(width: leading)
                VStack(spacing: stepsSpacing) {
                    overText
                        .alignmentGuide(.stepsTopAlignment) { $0.height / 2.0 }
                    Rectangle().fill(stepLineColor)
                        .frame(maxWidth: lineWidth, minHeight: lineHeight)
                }
                Spacer().frame(width: horizontalSpacing)
                name.lineLimit(nil)
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
