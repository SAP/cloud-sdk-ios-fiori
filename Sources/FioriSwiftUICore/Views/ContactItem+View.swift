import SwiftUI

extension Fiori {
    enum ContactItem {
        typealias Title = EmptyModifier
        typealias Subtitle = EmptyModifier
        typealias Footnote = EmptyModifier
        typealias DescriptionText = EmptyModifier
        typealias DetailImage = EmptyModifier

        // TODO: - substitute type-specific ViewModifier for EmptyModifier
        /*
             // replace `typealias Subtitle = EmptyModifier` with:

             struct Subtitle: ViewModifier {
                 func body(content: Content) -> some View {
                     content
                         .font(.body)
                         .foregroundColor(.preferredColor(.primary3))
                 }
             }
         */
        static let title = Title()
        static let subtitle = Subtitle()
        static let footnote = Footnote()
        static let descriptionText = DescriptionText()
        static let detailImage = DetailImage()
    }
}

extension ContactItem: View {
    public var body: some View {
        HStack(spacing: 8) {
            detailImage
                .frame(width: 45, height: 45)
                    
            VStack(alignment: .leading) {
                title
                subtitle
                footnote
            }
            Spacer()
            HStack(spacing: 8) {
                actionItems
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}
 
struct ContactItemPreview: PreviewProvider {
    static var previews: some View {
        ContactItem {
            Text("Bill")
        } subtitle: {
            Text("Software Engineer")
        } descriptionText: {
            Button(action: { print("Button tapped") }, label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Add")
                        .foregroundColor(.red)
                }
            })
                .buttonStyle(FioriButtonStyle())
        } detailImage: {
            Image(systemName: "person")
        } actionItems: {
            Button(action: { print("add tapped") }, label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Add")
                }
            })
                .buttonStyle(FioriButtonStyle())
//            .disabled(true)
                .padding()
        }
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        .buttonStyle(FioriButtonStyle(isSelectionPersistent: true))
    }
}

struct FioriButtonStyle: PrimitiveButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    // TODO: style configuration struct?
    let foregroundColor: Color
    let depressedColor: Color
    let disabledColor: Color
    let isSelectionPersistent: Bool
    
    init(color: Color = .preferredColor(.tintColor),
         depressedColor: Color = .preferredColor(.tintColorTapState),
         disabledColor: Color = .gray,
         isSelectionPersistent: Bool = false)
    {
        self.foregroundColor = color
        self.depressedColor = depressedColor
        self.disabledColor = disabledColor
        self.isSelectionPersistent = isSelectionPersistent
    }
    
    public func makeBody(configuration: PrimitiveButtonStyle.Configuration) -> some View {
        if self.isEnabled {
            return AnyView(EnabledButton(configuration: configuration, color: self.foregroundColor, pressedColor: self.depressedColor, isSelectionPersistent: self.isSelectionPersistent))
        } else {
            return AnyView(DisabledButton(configuration: configuration, color: self.disabledColor))
        }
    }
    
    struct EnabledButton: View {
        @State private var pressed = false
        
        let configuration: PrimitiveButtonStyle.Configuration
        let color: Color
        let pressedColor: Color
        let isSelectionPersistent: Bool
        
        var body: some View {
            configuration.label
                .foregroundColor(.white)
                .padding(15)
                .background(RoundedRectangle(cornerRadius: 5).fill(pressed ? pressedColor : color))
                .gesture(createGesture())
        }
        
        func createGesture() -> _EndedGesture<_ChangedGesture<DragGesture>> {
            if self.isSelectionPersistent {
                return DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                    }
                    .onEnded { _ in
                        self.pressed.toggle()
                        self.configuration.trigger()
                    }
            } else {
                return DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        self.pressed = true
                    }
                    .onEnded { _ in
                        self.pressed = false
                        self.configuration.trigger()
                    }
            }
        }
    }
    
    struct DisabledButton: View {
        let configuration: PrimitiveButtonStyle.Configuration
        let color: Color
        
        var body: some View {
            configuration.label
                .foregroundColor(.white)
                .padding(15)
                .background(RoundedRectangle(cornerRadius: 5).fill(color))
        }
    }
}
