import Foundation

public enum CurrencyDisplayStyle {
    case symbol // Examples: US$, €, JP¥
    case shortName // Examples: Ft (for HUF), zł (for PLN)
    case code // Examples: USD, EUR, JPY
    
    /// Default display order: symbol > shortName > ISO code
    public static func defaultStyle(for currencyCode: String, locale: Locale = .current) -> CurrencyDisplayStyle {
        if let symbol = locale.localizedCurrencySymbol(forCurrencyCode: currencyCode), !symbol.isEmpty, symbol != currencyCode {
            return .symbol
        } else if let shortName = locale.currencyShortName(for: currencyCode), !shortName.isEmpty, shortName != currencyCode {
            return .shortName
        } else {
            return .code
        }
    }
}

public enum CurrencyPosition {
    case prefix
    case suffix
    
    /// Determine currency symbol position based on locale
    public static func defaultPosition(for currencyCode: String, locale: Locale = .current) -> CurrencyPosition {
        // Check current locale currency format to determine if currency symbol appears before or after
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode
        formatter.locale = locale
        
        // Check currency symbol position by formatting zero
        let formattedZero = formatter.string(from: 0) ?? ""
        if let symbol = locale.localizedCurrencySymbol(forCurrencyCode: currencyCode), !symbol.isEmpty {
            if formattedZero.hasPrefix(symbol) || (formattedZero.hasPrefix("(") && formattedZero.contains(symbol) && formattedZero.firstIndex(of: Character(symbol))! < formattedZero.firstIndex(of: "0")!) {
                return .prefix
            } else {
                return .suffix
            }
        }
        
        // Default to prefix position
        return .prefix
    }
}

extension Locale {
    /// Get localized currency symbol
    func localizedCurrencySymbol(forCurrencyCode code: String) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = code
        print(formatter.currencySymbol)
        formatter.locale = self
        
        // Extract currency symbol
        formatter.maximumFractionDigits = 0
        let formatted = formatter.string(from: 0) ?? ""
        let digits = CharacterSet.decimalDigits
        let symbols = formatted.filter { !digits.contains(UnicodeScalar(String($0)) ?? UnicodeScalar(0)) }
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .trimmingCharacters(in: CharacterSet(charactersIn: "().,"))
        
        return symbols.isEmpty ? nil : symbols
    }
    
    /// Get currency short name (shorter than ISO code, like "Ft" for HUF)
    func currencyShortName(for currencyCode: String) -> String? {
        // Mapping of specific currency short names
        let shortNames: [String: String] = [
            "HUF": "Ft", // Hungarian Forint
            "PLN": "zł", // Polish Złoty
            "GBP": "£", // British Pound
            "JPY": "¥", // Japanese Yen
            "EUR": "€" // Euro
            // More mappings can be added
        ]
        
        return shortNames[currencyCode]
    }
}

public struct CurrencyFormatOptions {
    public var currencyCode: String
    public var locale: Locale
    public var displayStyle: CurrencyDisplayStyle
    public var position: CurrencyPosition
    public var maxFractionDigits: Int
    public var minFractionDigits: Int
    public var alwaysShowFractionDigits: Bool
    public var roundingMode: NumberFormatter.RoundingMode
    
    public init(
        currencyCode: String,
        locale: Locale = .current,
        displayStyle: CurrencyDisplayStyle? = nil,
        position: CurrencyPosition? = nil,
        maxFractionDigits: Int = 2,
        minFractionDigits: Int = 0,
        alwaysShowFractionDigits: Bool = false,
        roundingMode: NumberFormatter.RoundingMode = .halfUp
    ) {
        self.currencyCode = currencyCode
        self.locale = locale
        self.displayStyle = displayStyle ?? .defaultStyle(for: currencyCode, locale: locale)
        self.position = position ?? .defaultPosition(for: currencyCode, locale: locale)
        self.maxFractionDigits = maxFractionDigits
        self.minFractionDigits = minFractionDigits
        self.alwaysShowFractionDigits = alwaysShowFractionDigits
        self.roundingMode = roundingMode
    }
    
    /// Create a NumberFormatter for formatting currency values
    public func createFormatter() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.locale = self.locale
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = self.maxFractionDigits
        formatter.minimumFractionDigits = self.alwaysShowFractionDigits ? self.maxFractionDigits : self.minFractionDigits
        formatter.roundingMode = self.roundingMode
        
        // Set grouping separator and decimal point
        formatter.usesGroupingSeparator = true
        
        return formatter
    }
    
    /// Get currency display text based on settings
    public func currencyDisplay() -> String {
        switch self.displayStyle {
        case .symbol:
            return self.locale.localizedCurrencySymbol(forCurrencyCode: self.currencyCode) ?? self.currencyCode
        case .shortName:
            return self.locale.currencyShortName(for: self.currencyCode) ?? self.currencyCode
        case .code:
            return self.currencyCode
        }
    }
    
    /// Strictly enforces the decimal limit on a numeric value
    public func enforceDecimalLimit(_ value: Double) -> Double {
        let multiplier = pow(10.0, Double(self.maxFractionDigits))
        var result: Double
        
        switch self.roundingMode {
        case .ceiling:
            result = ceil(value * multiplier) / multiplier
        case .floor:
            result = floor(value * multiplier) / multiplier
        case .up:
            result = value >= 0 ? ceil(value * multiplier) / multiplier : floor(value * multiplier) / multiplier
        case .down:
            result = value >= 0 ? floor(value * multiplier) / multiplier : ceil(value * multiplier) / multiplier
        case .halfEven:
            result = round(value * multiplier) / multiplier
        case .halfUp:
            let temp = value * multiplier
            let intPart = floor(abs(temp))
            let fraction = abs(temp) - intPart
            
            if fraction >= 0.5 {
                result = (value >= 0 ? intPart + 1 : -(intPart + 1)) / multiplier
            } else {
                result = (value >= 0 ? intPart : -intPart) / multiplier
            }
        case .halfDown:
            let temp = value * multiplier
            let intPart = floor(abs(temp))
            let fraction = abs(temp) - intPart
            
            if fraction > 0.5 {
                result = (value >= 0 ? intPart + 1 : -(intPart + 1)) / multiplier
            } else {
                result = (value >= 0 ? intPart : -intPart) / multiplier
            }
        @unknown default:
            result = round(value * multiplier) / multiplier
        }
        
        // Ensure no floating point precision issues
        return Double(String(format: "%.\(self.maxFractionDigits)f", result))!
    }
    
    /// Format currency value
    public func format(_ value: Double) -> String {
        // Strictly enforce decimal place limit
        let limitedValue = self.enforceDecimalLimit(value)
        
        let formatter = self.createFormatter()
        guard let formattedNumber = formatter.string(from: NSNumber(value: limitedValue)) else {
            return ""
        }
        
        let currencyText = self.currencyDisplay()
        
        switch self.position {
        case .prefix:
            return "\(currencyText)\(formattedNumber)"
        case .suffix:
            return "\(formattedNumber) \(currencyText)"
        }
    }
    
    /// Enforce decimal limit on a string representation
    public func enforceDecimalLimitOnString(_ text: String) -> String {
        let decimalSeparator = self.locale.decimalSeparator ?? "."
        let components = text.components(separatedBy: decimalSeparator)
        
        if components.count <= 1 {
            return text // No decimal part
        }
        
        let integerPart = components[0]
        var decimalPart = components[1]
        
        // Strictly limit decimal places
        if decimalPart.count > self.maxFractionDigits {
            decimalPart = String(decimalPart.prefix(self.maxFractionDigits))
        }
        
        return "\(integerPart)\(decimalSeparator)\(decimalPart)"
    }
    
    /// Parse currency value from string
    public func parse(_ string: String) -> Double? {
        // Remove currency text and spaces
        var cleanedString = string
        let currencyText = self.currencyDisplay()
        cleanedString = cleanedString.replacingOccurrences(of: currencyText, with: "")
        cleanedString = cleanedString.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // First limit decimal places in the string
        let limitedString = self.enforceDecimalLimitOnString(cleanedString)
        
        // Parse numeric value
        let formatter = self.createFormatter()
        if let number = formatter.number(from: limitedString) {
            // Apply strict decimal limit to ensure consistency
            return self.enforceDecimalLimit(number.doubleValue)
        }
        
        return nil
    }
}
