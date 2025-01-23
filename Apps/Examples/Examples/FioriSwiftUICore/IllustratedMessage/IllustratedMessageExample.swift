import FioriSwiftUICore
import SwiftUI

struct SizeOption: Identifiable {
    let value: CGFloat
    var id: CGFloat { self.value }
    
    init(_ value: CGFloat) {
        self.value = value
    }
}

let sizeOptions: [SizeOption] = [.init(100), .init(200), .init(300), .init(500), .init(600), .init(800)]

enum LayoutAxis {
    case vertical
    case horizontal
    case mixed
}

enum ButtonWidthMode {
    case fixed
    case fullWidth
    case flexible
}

enum AlignmentMode: String, CaseIterable, Identifiable {
    case center = "Center"
    case leading = "Leading"
    case trailing = "Trailing"
    
    var id: String { self.rawValue }
    
    var alignment: HorizontalAlignment {
        switch self {
        case .center:
            return .center
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        }
    }
}

struct IllustratedMessageExample: View {
    @State var selectedDetailImageSize: IllustratedMessage.DetailImageSize?
    @State var selectedLayoutAxis: LayoutAxis?
    @State var selectedWidth: CGFloat = sizeOptions[2].value
    @State var selectedHeight: CGFloat = sizeOptions[2].value
    @State var showSecondButton: Bool = false
    @State var isActionButtonVertical: Bool = false
    @State var actionButtonWidth: ButtonWidthMode?
    @State var contentStackAlignment: AlignmentMode = .leading
    
    var body: some View {
        List {
            VStack(spacing: 0) {
                Picker("Image Size", selection: self.$selectedDetailImageSize) {
                    Text("Unset").tag(IllustratedMessage.DetailImageSize?(nil))
                    Text("XS").tag(IllustratedMessage.DetailImageSize?(.extraSmall))
                    Text("S").tag(IllustratedMessage.DetailImageSize?(.small))
                    Text("M").tag(IllustratedMessage.DetailImageSize?(.medium))
                    Text("L").tag(IllustratedMessage.DetailImageSize?(.large))
                    Text("XL").tag(IllustratedMessage.DetailImageSize?(.extraLarge))
                }
                Picker("Layout Axis", selection: self.$selectedLayoutAxis) {
                    Text("Unset").tag(LayoutAxis?(nil))
                    Text("Vertical").tag(LayoutAxis?(.vertical))
                    Text("Horizontal").tag(LayoutAxis?(.horizontal))
                    Text("Mixed").tag(LayoutAxis?(.mixed))
                }
                Picker("Width", selection: self.$selectedWidth) {
                    ForEach(sizeOptions) { option in
                        Text("\(Int(option.value))").tag(option.value)
                    }
                }
                Picker("Height", selection: self.$selectedHeight) {
                    ForEach(sizeOptions) { option in
                        Text("\(Int(option.value))").tag(option.value)
                    }
                }
                Picker("Content Alignment in Horizontal Style", selection: self.$contentStackAlignment) {
                    ForEach(AlignmentMode.allCases) { alignment in
                        Text(alignment.rawValue).tag(alignment)
                    }
                }
                Picker("Button Width (vertical)", selection: self.$actionButtonWidth) {
                    Text("Unset").tag(ButtonWidthMode?(nil))
                    Text("Fixed").tag(ButtonWidthMode?(.fixed))
                    Text("FullWidth").tag(ButtonWidthMode?(.fullWidth))
                    Text("Flexible").tag(ButtonWidthMode?(.flexible))
                }
                Toggle("Shows the 2nd Action Button", isOn: self.$showSecondButton)
                Toggle("Action Button vertical Aligned", isOn: self.$isActionButtonVertical)
            }
            
            ForEach((0 ... 7).reversed(), id: \.self) { subcomponentConfiguration in
                let hasImage = subcomponentConfiguration & 0b100 == 4
                let hasDescription = subcomponentConfiguration & 0b010 == 2
                let hasAction = subcomponentConfiguration & 0b001 == 1
                
                HStack(spacing: 0) {
                    Spacer()
                    VStack(spacing: 10) {
                        Text(self.generateCaptionText(hasImage, hasDescription, hasAction)).font(.fiori(forTextStyle: .caption1))
                        IllustratedMessage(detailImage: {
                            hasImage ?
                                Image("wheel")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                : nil
                        }, title: {
                            Text("Illustrated Message Title with long text for two lines")
                        }, description: {
                            hasDescription ? Text("This is description text for the Illustrated Message component") : nil
                        }, action: {
                            hasAction ? FioriButton(title: "Action", action: { _ in print("Tapped Action") }) : nil
                        }, secondaryAction: {
                            hasAction && self.showSecondButton ? FioriButton(title: "Secondary Action", action: { _ in print("Tapped Secondary Action") }) : nil
                        }, detailImageSize: self.selectedDetailImageSize, isActionVerticallyAligned: self.isActionButtonVertical, contentAlignment: self.contentStackAlignment.alignment)
                            .frame(width: self.selectedWidth, height: self.selectedHeight)
                            .background(Color.preferredColor(.secondaryBackground))
                            .ifApply(self.selectedLayoutAxis == .vertical) { $0.illustratedMessageStyle(.vertical) }
                            .ifApply(self.selectedLayoutAxis == .horizontal) { $0.illustratedMessageStyle(.horizontal) }
                            .ifApply(self.selectedLayoutAxis == .mixed) { $0.illustratedMessageStyle(.mixed) }
                            .ifApply(self.actionButtonWidth == .fixed) { $0.illustratedMessageStyle(.fixedWidthButton) }
                            .ifApply(self.actionButtonWidth == .flexible) { $0.illustratedMessageStyle(.flexibleButton) }
                            .ifApply(self.actionButtonWidth == .fullWidth) { $0.illustratedMessageStyle(.fullWidthButton) }
                    }
                    Spacer()
                }
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding(20)
            }
        }
    }
    
    func generateCaptionText(_ hasImage: Bool, _ hasDescription: Bool, _ hasAction: Bool) -> String {
        var subcomponentConfigurationText = ""
        
        if hasImage {
            subcomponentConfigurationText = subcomponentConfigurationText + "Image, "
        }
        subcomponentConfigurationText = subcomponentConfigurationText + "Title, "
        if hasDescription {
            subcomponentConfigurationText = subcomponentConfigurationText + "Description, "
        }
        if hasAction {
            subcomponentConfigurationText = subcomponentConfigurationText + "Action, "
        }
        subcomponentConfigurationText.removeLast(2)
        return subcomponentConfigurationText
    }
}
