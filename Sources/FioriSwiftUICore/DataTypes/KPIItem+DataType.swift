import SwiftUI

/// Data types for KPIItemView.
public enum KPIItemData {
    /// Combinations of available KPI components
    case components([KPIItemData.Component])
    /// Measurement type that takes in unit value and MeasurementFormatter
    case measure(Measurement<Unit>, MeasurementFormatter)
    /// Time duration type that takes in time interval value and DateComponentsFormatter
    case duration(TimeInterval, DateComponentsFormatter?)
    /// Fraction type
    case fraction(Int, Int)
    /// Percentage type
    case percent(Double)
    
    /// Component types for KPIItemData
    public enum Component {
        /// Unit component
        case unit(String)
        /// Metric component
        case metric(String)
        /// Icon component
        case icon(Image)
        /// Measurement component
        case measure(Measurement<Unit>, MeasurementFormatter)
    }
    
    internal func string() -> String? {
        switch self {
        case .duration(let seconds, let formatter):
            let df = formatter ?? DateComponentsFormatter()
            return df.string(from: seconds)
        case .measure(let measurement, let formatter):
            return formatter.string(for: measurement)
        case .percent(let percent):
            let nf = NumberFormatter()
            nf.numberStyle = .percent
            nf.maximumFractionDigits = 1
            return nf.string(from: percent as NSNumber)
        case .components(let components):
            var string: String = ""
            for component in components {
                switch component {
                case .icon:
                    string.append("\u{1A}")
                case .unit(let x), .metric(let x):
                    string.append(x)
                case .measure(let x, let formatter):
                    if let measureString = KPIItemData.measure(x, formatter).string() {
                        string.append(measureString)
                    }
                }
            }
            return string
        default:
            return nil
        }
    }
    
    internal func icons() -> [Image] {
        switch self {
        case .components(let components):
            return components.compactMap { component in
                switch component {
                case .icon(let x):
                    return x
                default:
                    return nil
                }
            }
        default:
            return []
        }
    }
}

private struct KPIStringComponent: Hashable {
    internal enum ComponentType {
        case unit
        case metric
        case icon
        case whitespace
        case punctuation
    }
    
    var string: String
    var range: Range<String.Index>
    var type: ComponentType
    
    init(string: String, range: Range<String.Index>, type: ComponentType) {
        self.string = string
        self.range = range
        self.type = type
    }
}

internal struct KPIFormatter {
    private static let punctuationsCharacterSet = CharacterSet([".", ","])
    
    private static let iconsCharacterSet: CharacterSet = {
        let char: Character = "\u{1A}"
        return CharacterSet(charactersIn: String(char))
    }()
    
    private static let unitsCharacterSet: CharacterSet = {
        var set = CharacterSet.decimalDigits
        set = set.union(.whitespacesAndNewlines)
        set = set.inverted
        set = set.subtracting(punctuationsCharacterSet)
        set = set.subtracting(.controlCharacters)
        return set
    }()
    
    internal func create(from data: KPIItemData) -> Text? {
        guard let string = data.string() else { return nil }
        
        let unitsComponents = self.components(forCharactersOfSet: KPIFormatter.unitsCharacterSet, with: .unit, in: string)
        let metricComponents = self.components(forCharactersOfSet: .decimalDigits, with: .metric, in: string)
        let whitespaceComponents = self.components(forCharactersOfSet: .whitespacesAndNewlines, with: .whitespace, in: string)
        let punctuationComponents = self.components(forCharactersOfSet: KPIFormatter.punctuationsCharacterSet, with: .punctuation, in: string)
        let iconComponents = self.components(forCharactersOfSet: KPIFormatter.iconsCharacterSet, with: .icon, in: string)
        
        let icons = data.icons()
        var iconsDict = [KPIStringComponent: Image]()
        if !icons.isEmpty {
            for (index, component) in iconComponents.enumerated() {
                iconsDict[component] = icons[index]
            }
        }
        
        let fullComponents = (unitsComponents + metricComponents + whitespaceComponents + punctuationComponents + iconComponents).sorted(by: { $0.range.lowerBound < $1.range.lowerBound })
        
        var text = Text("")
        
        for (index, component) in fullComponents.enumerated() {
            var current = Text(String(component.string))
            switch component.type {
            case .unit, .punctuation:
                current = current
                    .font(.system(size: 28.0))
            case .icon:
                if #available(iOS 14.0, *), let icon = iconsDict[component] {
                    current = Text(icon)
                }
            default:
                current = current
                    .font(.system(size: 48.0))
            }
            if index < fullComponents.count - 1 {
                current = current
                    .kerning(self.kerning(after: fullComponents[index + 1].type, before: component.type))
            }
            text = text + current
        }
        
        return text
    }
    
    private func kerning(after: KPIStringComponent.ComponentType, before: KPIStringComponent.ComponentType) -> CGFloat {
        switch (after, before) {
        case (.unit, .unit), (.metric, .metric), (.icon, .icon):
            return 0.0
        case (.icon, .unit), (.icon, .metric):
            return 8.0
        case (.unit, .metric), (.metric, .unit):
            return 2.0
        case (.icon, .whitespace), (.unit, .whitespace), (.metric, .whitespace):
            return 4.0
        default:
            return 0.0
        }
    }
    
    private func components(forCharactersOfSet set: CharacterSet, with type: KPIStringComponent.ComponentType, in string: String) -> [KPIStringComponent] {
        var components: [KPIStringComponent] = []
        var start = string.startIndex
        while start < string.endIndex, let range = string.rangeOfCharacter(from: set, range: start ..< string.endIndex), !range.isEmpty {
            components.append(KPIStringComponent(string: String(string[range]), range: range, type: type))
            start = range.upperBound
        }
        return components
    }
}
