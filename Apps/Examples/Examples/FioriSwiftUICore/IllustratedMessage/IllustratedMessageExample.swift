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

struct IllustratedMessageExample: View {
    @State var selectedWidth: CGFloat = sizeOptions[2].value
    @State var selectedHeight: CGFloat = sizeOptions[1].value
    @State var selectedDetailImageSize: DetailImageSize?
    
    var body: some View {
        HStack {
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
            Text("Image Size:")
            Picker("Image Size", selection: self.$selectedDetailImageSize) {
                Text("No Selection").tag(DetailImageSize?(nil))
                Text("Extra Small").tag(DetailImageSize?(.extraSmall))
                Text("Small").tag(DetailImageSize?(.small))
                Text("Medium").tag(DetailImageSize?(.medium))
                Text("Large").tag(DetailImageSize?(.large))
                Text("Extra Large").tag(DetailImageSize?(.extraLarge))
            }
        }
        List {
            ForEach(0 ... 2, id: \.self) { layoutOrientation in // 0 == unspecified (vertical); 1 == vertical; 2 == horizontal
                ForEach(0 ... 7, id: \.self) { subcomponentConfiguration in
                    IllustratedMessage(detailImage: {
                        subcomponentConfiguration & 0b100 == 4 ?
                            Image("wheel")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            : nil
                    }, title: {
                        Text("IllustratedMessage Title")
                    }, description: {
                        subcomponentConfiguration & 0b010 == 2 ? Text("IllustratedMessage Description") : nil
                    }, action: {
                        subcomponentConfiguration & 0b001 == 1 ? FioriButton(title: "ActionTitle", action: { _ in print("Action tapped") }) : nil
                    }, detailImageSize: self.selectedDetailImageSize)
                        .border(Color.gray)
                        .frame(width: self.selectedWidth, height: self.selectedHeight)
                        .ifApply(layoutOrientation == 1) { $0.illustratedMessageStyle(.vertical) }
                        .ifApply(layoutOrientation == 2) { $0.illustratedMessageStyle(.horizontal) }
                }
            }
        }
    }
}
