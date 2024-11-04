import SwiftUI

extension SliderPickerItem: View {
    public var body: some View {
        VStack {
            HStack {
                Text(String(format: self._formatter ?? NSLocalizedString("Value: %d", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), _value.wrappedValue ?? _minimumValue))
                    .font(.fiori(forTextStyle: .subheadline, weight: .semibold, isItalic: false, isCondensed: false))
                    .foregroundColor(Color.preferredColor(.primaryLabel))
                Spacer()
            }
            .frame(minHeight: 44)
            
            HStack {
                Slider(value: .convert(from: _value, ifNilUse: _minimumValue), in: Float(_minimumValue) ... Float(_maximumValue), step: 1.0) {
                    EmptyView()
                } minimumValueLabel: {
                    Text("\(_minimumValue)")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(.preferredColor(.primaryLabel))
                } maximumValueLabel: {
                    Text("\(_maximumValue)")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(.preferredColor(.primaryLabel))
                }
            }
            .frame(minHeight: 44)

            if let hint = _hint {
                HStack {
                    Text(hint)
                        .font(.fiori(forTextStyle: .subheadline, weight: .semibold, isItalic: false, isCondensed: false))
                        .foregroundColor(Color.preferredColor(.primaryLabel))
                    Spacer()
                }
            }
        }
    }
}

private extension SliderPickerItem {
    func calcWidth(font: Font) -> CGFloat {
        var width: CGFloat = 0
        for i in 0 ... 9 {
            let fontAttributes = [NSAttributedString.Key.font: self.preferredFont(from: font)]
            let size = String(i).size(withAttributes: fontAttributes)
            width = max(size.width, width)
        }
        return floor(log10(CGFloat(_maximumValue)) + 1) * width + 2 * 12
    }
    
    func preferredFont(from font: Font) -> UIFont {
        let uiFont: UIFont
        
        switch font {
        case .largeTitle:
            uiFont = UIFont.preferredFont(forTextStyle: .largeTitle)
        case .title:
            uiFont = UIFont.preferredFont(forTextStyle: .title1)
        case .title2:
            uiFont = UIFont.preferredFont(forTextStyle: .title2)
        case .title3:
            uiFont = UIFont.preferredFont(forTextStyle: .title3)
        case .headline:
            uiFont = UIFont.preferredFont(forTextStyle: .headline)
        case .subheadline:
            uiFont = UIFont.preferredFont(forTextStyle: .subheadline)
        case .callout:
            uiFont = UIFont.preferredFont(forTextStyle: .callout)
        case .caption:
            uiFont = UIFont.preferredFont(forTextStyle: .caption1)
        case .caption2:
            uiFont = UIFont.preferredFont(forTextStyle: .caption2)
        case .footnote:
            uiFont = UIFont.preferredFont(forTextStyle: .footnote)
        case .body:
            uiFont = UIFont.preferredFont(forTextStyle: .body)
        default:
            uiFont = UIFont.preferredFont(forTextStyle: .body)
        }
        
        return uiFont
    }
}

struct RangeIntegerStyle: ParseableFormatStyle {
    var parseStrategy: RangeIntegerStrategy = .init()
    let range: ClosedRange<Int>

    func format(_ value: Int) -> String {
        let constrainedValue = min(max(value, range.lowerBound), self.range.upperBound)
        return "\(constrainedValue)"
    }
}

struct RangeIntegerStrategy: ParseStrategy {
    func parse(_ value: String) throws -> Int {
        Int(value) ?? 1
    }
}

extension FormatStyle where Self == RangeIntegerStyle {
    static func ranged(_ range: ClosedRange<Int>) -> RangeIntegerStyle {
        RangeIntegerStyle(range: range)
    }
}

extension Binding {
    static func convert<TInt, TFloat>(from intBinding: Binding<TInt?>, ifNilUse defaultValue: TInt) -> Binding<TFloat> where TInt: BinaryInteger, TFloat: BinaryFloatingPoint {
        Binding<TFloat>(
            get: {
                TFloat(intBinding.wrappedValue ?? defaultValue)
            },
            set: {
                intBinding.wrappedValue = TInt($0)
            }
        )
    }
}

/*
 @available(iOS 14.0, macOS 11.0, *)
 struct SliderPickerLibraryContent: LibraryContentProvider {
     @LibraryContentBuilder
     var views: [LibraryItem] {
         LibraryItem(SliderPicker(model: LibraryPreviewData.Person.laurelosborn),
                     category: .control)
     }
 }
 */

private struct SliderPickeTestView: View {
    @State var value1: Int? = 10
    @State var value2: Int? = 20
    @State var value3: Int? = nil
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Value 1: \(self.$value1.wrappedValue ?? 0)")
                    .font(.largeTitle)
                    .foregroundColor(self.value1 != nil ? .blue : .gray)
                Spacer()
            }
            SliderPickerItem(value: Binding<Int?>(
                get: {
                    self.value1
                },
                set: {
                    self.value1 = $0
                }
            ), minimumValue: 0, maximumValue: 1000, hint: nil)
            Spacer()
            HStack {
                Text("Value 2: \(self.value2 ?? 0)")
                    .font(.largeTitle)
                    .foregroundColor(self.value2 != nil ? .blue : .gray)

                Spacer()
            }

            SliderPickerItem(value: Binding<Int?>(
                get: {
                    self.value2
                },
                set: {
                    self.value2 = $0
                }
            ), minimumValue: 0, maximumValue: 100, hint: "Pick an integer value")
            Spacer()
            HStack {
                Text("Value 3: \(self.value3 ?? 0)")
                    .font(.largeTitle)
                    .foregroundColor(self.value3 != nil ? .blue : .gray)

                Spacer()
            }
            SliderPickerItem(value: Binding<Int?>(
                get: {
                    self.value3
                },
                set: {
                    self.value3 = $0
                }
            ), minimumValue: 0, maximumValue: 100, hint: "Pick an integer value")
            Spacer()
        }
        .frame(width: 393)
    }
}

struct SliderPickeTestView_Previews: PreviewProvider {
    static var previews: some View {
        SliderPickeTestView()
    }
}
