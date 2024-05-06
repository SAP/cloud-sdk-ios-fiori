import FioriThemeManager
import SwiftUI

extension SwitchPickerItem: View {
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

/// Experiemental Fiori switch/toggle style
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
        onThumbColor: Color = Color.preferredColor(.baseWhite),
        offThumbColor: Color = Color.preferredColor(.baseWhite),
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
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold, isItalic: false, isCondensed: false))
                .foregroundColor(self.labelColor)
    
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 16 * self.scale, style: .circular)
                    .stroke(configuration.isOn ? self.onBorderColor : self.offBorderColor, lineWidth: 0.5 * self.scale)
                    .frame(width: 51 * self.scale, height: 30 * self.scale)

                RoundedRectangle(cornerRadius: 16 * self.scale, style: .circular)
                    .fill(configuration.isOn ? self.onColor : self.offColor)
                    .frame(width: 51 * self.scale, height: 30 * self.scale)
                    .overlay(
                        Circle()
                            .fill(configuration.isOn ? self.onThumbColor : self.offThumbColor)
                            .shadow(radius: 1 * self.scale, x: 0, y: 1 * self.scale)
                            .padding(1.5 * self.scale)
                            .offset(x: configuration.isOn ? 10 * self.scale : -10 * self.scale))
                    .animation(Animation.easeInOut(duration: 0.2), value: configuration.isOn)
                    .frame(minHeight: 44)
                    .onTapGesture { configuration.isOn.toggle() }
            }
        }
        .frame(minHeight: 44)
    }
}

struct FioriToggleStyleKey: EnvironmentKey {
    public static var defaultValue: any ToggleStyle = FioriToggleStyle()
}

extension EnvironmentValues {
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
            SwitchPickerItem(value: self.$v1, hint: nil)
            SwitchPickerItem(value: self.$v2, hint: nil)
            SwitchPickerItem(value: self.$v3, hint: nil)
        }
    }
}

#Preview {
    TestSwitchPicker()
        .frame(width: 375)
}
