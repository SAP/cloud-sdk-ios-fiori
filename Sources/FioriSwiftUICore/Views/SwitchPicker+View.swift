import FioriThemeManager
import SwiftUI

extension SwitchPicker: View {
    public var body: some View {
        AnyView(
            Toggle(_name ?? "", isOn: .convert(from: _value, ifNilUse: false))
                .toggleStyle(fioriToggleStyle)
        ).typeErased
    }
}

private extension Binding {
    static func convert(from value: Binding<Bool?>, ifNilUse defaultValue: Bool) -> Binding<Bool> {
        Binding<Bool>(
            get: {
                value.wrappedValue ?? defaultValue
            },
            set: {
                value.wrappedValue = $0
            }
        )
    }
}

public struct FioriToggleStyle: ToggleStyle {
    @ScaledMetric var scale: CGFloat = 1
    
    let labelColor: Color
    
    let onColor: Color
    let offColor: Color
    
    let onThumbColor: Color
    let offThumbColor: Color
    
    let onBorderColor: Color
    let offBorderColor: Color
    
    public init(
        labelColor: Color = Color.preferredColor(.primaryLabel),
        onColor: Color = Color.preferredColor(.tintColor),
        offColor: Color = Color.preferredColor(.secondaryFill),
        onThumbColor: Color = Color.preferredColor(.primaryBackground),
        offThumbColor: Color = Color.preferredColor(.primaryBackground),
        onBorderColor: Color = Color.preferredColor(.separator),
        offBorderColor: Color = Color.preferredColor(.separator)
    ) {
        self.labelColor = labelColor
        
        self.onColor = onColor
        self.offColor = offColor
        
        self.onThumbColor = onThumbColor
        self.offThumbColor = offThumbColor
        
        self.onBorderColor = onBorderColor
        self.offBorderColor = offBorderColor
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label
                .font(.fiori(forTextStyle: .subheadline, weight: .bold, isItalic: false, isCondensed: false))
                .foregroundColor(labelColor)
    
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 16 * scale, style: .circular)
                    .stroke(configuration.isOn ? onBorderColor : offBorderColor, lineWidth: 0.5 * scale)
                    .frame(width: 51 * scale, height: 30 * scale)

                RoundedRectangle(cornerRadius: 16 * scale, style: .circular)
                    .fill(configuration.isOn ? onColor : offColor)
                    .frame(width: 51 * scale, height: 30 * scale)
                    .overlay(
                        Circle()
                            .fill(configuration.isOn ? onThumbColor : offThumbColor)
                            .shadow(radius: 1 * scale, x: 0, y: 1 * scale)
                            .padding(1.5 * scale)
                            .offset(x: configuration.isOn ? 10 * scale : -10 * scale))
                    .animation(Animation.easeInOut(duration: 0.2), value: configuration.isOn)
                    .frame(minHeight: 44)
                    .onTapGesture { configuration.isOn.toggle() }
            }
        }
        .frame(minHeight: 44)
    }
}

public struct FioriToggleStyleKey: EnvironmentKey {
    public static var defaultValue: any ToggleStyle = FioriToggleStyle()
}

public extension EnvironmentValues {
    var fioriToggleStyle: any ToggleStyle {
        get {
            self[FioriToggleStyleKey.self]
        }
        set {
            self[FioriToggleStyleKey.self] = newValue
        }
    }
}

/*
 @available(iOS 14.0, macOS 11.0, *)
 struct SwitchPickerLibraryContent: LibraryContentProvider {
     @LibraryContentBuilder
     var views: [LibraryItem] {
         LibraryItem(SwitchPicker(model: LibraryPreviewData.Person.laurelosborn),
                     category: .control)
     }
 }
 */

private struct TestSwitchPicker: View {
    @State var v1: Bool? = true
    @State var v2: Bool? = false
    @State var v3: Bool? = nil
    
    var body: some View {
        VStack {
            SwitchPicker(value: $v1, hint: nil)
            SwitchPicker(value: $v2, hint: nil)
            SwitchPicker(value: $v3, hint: nil)
        }
    }
}

#Preview {
    TestSwitchPicker()
        .frame(width: 375)
}
