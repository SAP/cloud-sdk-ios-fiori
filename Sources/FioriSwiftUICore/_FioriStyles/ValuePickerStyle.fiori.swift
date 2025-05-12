import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ValuePickerBaseStyle: ValuePickerStyle {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @State var valueString: AttributedString = .init("")
    @State var valuePickerVisible: Bool = false
    @FocusState var isFocused: Bool

    public func makeBody(_ configuration: ValuePickerConfiguration) -> some View {
        VStack {
            if self.dynamicTypeSize >= .accessibility3 {
                self.configureMainStack(configuration, isVertical: true)
            } else {
                ViewThatFits(in: .horizontal) {
                    self.configureMainStack(configuration, isVertical: false)
                    self.configureMainStack(configuration, isVertical: true)
                }
            }
            if self.valuePickerVisible || configuration.alwaysShowPicker {
                Divider()
                    .frame(height: 0.3)
                    .foregroundStyle(Color.preferredColor(.separatorOpaque))
                self.showPicker(configuration)
            }
        }
    }
    
    func configureMainStack(_ configuration: ValuePickerConfiguration, isVertical: Bool) -> some View {
        let mainStack = isVertical ? AnyLayout(VStackLayout(alignment: .leading, spacing: 3)) : AnyLayout(HStackLayout())
        return mainStack {
            configuration.title
            if !isVertical {
                Spacer()
            } else {
                Divider().hidden()
            }
            ValueLabel(valueLabel: self.getValueString(configuration)).foregroundStyle(self.getValueLabelFontColor(configuration))
        }
        .accessibilityElement(children: .combine)
        .contentShape(Rectangle())
        .ifApply(configuration.controlState != .disabled && configuration.controlState != .readOnly) {
            $0.onTapGesture(perform: {
                self.valuePickerVisible.toggle()
                if self.valuePickerVisible {
                    let oIndex = configuration.selectedIndex
                    if oIndex >= 0, oIndex <= configuration.options.count {
                        self.valueString = configuration.options[oIndex]
                    }
                }
            })
        }
    }

    func getValueString(_ configuration: ValuePickerConfiguration) -> AttributedString {
        let oIndex = configuration.selectedIndex
        var value = self.valueString

        let isTrackingLive = configuration.isTrackingLiveChanges || configuration.alwaysShowPicker || (!configuration.alwaysShowPicker && !self.valuePickerVisible)
        if isTrackingLive, oIndex >= 0, oIndex <= configuration.options.count {
            value = configuration.options[oIndex]
        }
        return value
    }
    
    func getValueLabelFontColor(_ configuration: ValuePickerConfiguration) -> Color {
        if configuration.controlState == .disabled {
            return .preferredColor(.quaternaryLabel)
        } else if self.valuePickerVisible, !configuration.alwaysShowPicker {
            return .preferredColor(.tintColor)
        } else {
            return .preferredColor(.primaryLabel)
        }
    }
    
    func showPicker(_ configuration: ValuePickerConfiguration) -> some View {
        let picker = Picker("", selection: configuration.$selectedIndex) {
            ForEach(0 ..< configuration.options.count, id: \.self, content: { index in
                Text(configuration.options[index])
                    .ifApply(configuration.controlState == .disabled) {
                        $0.foregroundStyle(Color.preferredColor(.quaternaryLabel))
                    }
            })
        }.focused(self.$isFocused)
        return picker
    }
}

// Default fiori styles
extension ValuePickerFioriStyle {
    struct ContentFioriStyle: ValuePickerStyle {
        func makeBody(_ configuration: ValuePickerConfiguration) -> some View {
            ValuePicker(configuration)
                .pickerStyle(.wheel)
                .disabled((configuration.controlState == .disabled || configuration.controlState == .readOnly) ? true : false)
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let valuePickerConfiguration: ValuePickerConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(Color.preferredColor(self.valuePickerConfiguration.controlState == .disabled ? .quaternaryLabel : .primaryLabel))
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                .lineLimit(1)
        }
    }

    struct ValueLabelFioriStyle: ValueLabelStyle {
        let valuePickerConfiguration: ValuePickerConfiguration

        func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
            ValueLabel(configuration)
                .font(.fiori(forTextStyle: .body))
                .lineLimit(1)
        }
    }

    struct OptionsFioriStyle: OptionsStyle {
        let valuePickerConfiguration: ValuePickerConfiguration

        func makeBody(_ configuration: OptionsConfiguration) -> some View {
            Options(configuration)
        }
    }
}
