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
}

struct IllustratedMessageExample: View {
    @State var selectedDetailImageSize: IllustratedMessage.DetailImageSize?
    @State var selectedLayoutAxis: LayoutAxis?
    @State var selectedWidth: CGFloat = sizeOptions[3].value
    @State var selectedHeight: CGFloat = sizeOptions[2].value
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Img Size:")
                Picker("Img Size", selection: self.$selectedDetailImageSize) {
                    Text("Unset").tag(IllustratedMessage.DetailImageSize?(nil))
                    Text("XS").tag(IllustratedMessage.DetailImageSize?(.extraSmall))
                    Text("S").tag(IllustratedMessage.DetailImageSize?(.small))
                    Text("M").tag(IllustratedMessage.DetailImageSize?(.medium))
                    Text("L").tag(IllustratedMessage.DetailImageSize?(.large))
                    Text("XL").tag(IllustratedMessage.DetailImageSize?(.extraLarge))
                }
                Text("Layout Axis:")
                Picker("Layout Axis", selection: self.$selectedLayoutAxis) {
                    Text("Unset").tag(LayoutAxis?(nil))
                    Text("Vertical").tag(LayoutAxis?(.vertical))
                    Text("Horizontal").tag(LayoutAxis?(.horizontal))
                }
            }
            HStack(spacing: 0) {
                Text("Size:")
                Picker("Width", selection: self.$selectedWidth) {
                    ForEach(sizeOptions) { option in
                        Text("\(Int(option.value))").tag(option.value)
                    }
                }
                Text("by")
                Picker("Height", selection: self.$selectedHeight) {
                    ForEach(sizeOptions) { option in
                        Text("\(Int(option.value))").tag(option.value)
                    }
                }
            }
        }
        List {
            ForEach(0 ... 7, id: \.self) { subcomponentConfiguration in
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
                            Text("Illustrated Message Title")
                        }, description: {
                            hasDescription ? Text("This is description text for the Illustrated Message component") : nil
                        }, action: {
                            hasAction ? FioriButton(title: "Button", action: { _ in print("Tapped Action") }) : nil
                        }, detailImageSize: self.selectedDetailImageSize)
                            .frame(width: self.selectedWidth, height: self.selectedHeight)
                            .background(Color.preferredColor(.secondaryBackground))
                            .ifApply(self.selectedLayoutAxis == .vertical) { $0.illustratedMessageStyle(.vertical) }
                            .ifApply(self.selectedLayoutAxis == .horizontal) { $0.illustratedMessageStyle(.horizontal) }
                    }
                    Spacer()
                }
                .listRowSeparator(.hidden)
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
