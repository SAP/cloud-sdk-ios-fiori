import Foundation
import SwiftUI

/// An environment key for configuring currency field behavior in SwiftUI views.
struct CurrencyFieldKey: EnvironmentKey {
    /// The default value for the currency field configuration.
    static let defaultValue = CurrencyFieldConfiguration(isCurrencyField: false, formatter: .numberFormat(NumberFormatter.currencyDefault))
}

extension EnvironmentValues {
    /// The currency field configuration for the current environment.
    var currencyField: CurrencyFieldConfiguration {
        get { self[CurrencyFieldKey.self] }
        set { self[CurrencyFieldKey.self] = newValue }
    }
}

/// Configuration for a currency input field, including whether it is a currency field and the formatter to use.
struct CurrencyFieldConfiguration {
    /// Indicates if the field is a currency input field.
    let isCurrencyField: Bool
    /// The formatter used for currency formatting.
    let formatter: formatType
}

/// Protocol for currency formatting, providing locale and formatting functionality.
public protocol currencyFormatting {
    /// The locale used for formatting.
    var locale: Locale { get }
    /// Formats a Decimal value as a currency string.
    /// - Parameter value: The decimal value to format.
    /// - Returns: The formatted currency string, or nil if formatting fails.
    func format(_ value: Decimal) -> String?
}

/// Enum representing the type of currency formatter to use.
public enum formatType {
    /// Uses Swift's Decimal.FormatStyle.Currency for formatting.
    case formatStyle(Decimal.FormatStyle.Currency)
    /// Uses Apple's NumberFormatter for formatting.
    case numberFormat(NumberFormatter)
}

extension formatType: currencyFormatting {
    /// The locale associated with the formatter.
    public var locale: Locale {
        switch self {
        case .formatStyle(let style):
            style.locale
        case .numberFormat(let formatter):
            formatter.locale
        }
    }
    
    /// Formats a Decimal value as a currency string using the selected formatter.
    /// - Parameter value: The decimal value to format.
    /// - Returns: The formatted currency string, or nil if formatting fails.
    public func format(_ value: Decimal) -> String? {
        switch self {
        case .formatStyle(let style):
            value.formatted(style)
        case .numberFormat(let formatter):
            formatter.string(from: NSDecimalNumber(decimal: value))
        }
    }
}

public extension View {
    /**
     Configures a TextField as a currency input field with formatting options.
     - Parameter formatter: The currency formatter to use. Defaults to a standard NumberFormatter with the current locale.
     - Returns: A view with currency input configuration applied.
     
     Example Usage:
     ```swift
     TextFieldFormView(
         title: "Price(USD)",
         text: self.$usdAmount,
         placeholder: "Enter amount",
     )
     // NumberFormatter
     .currencyField()
     .currencyField(.numberFormat(NumberFormatter(...)))
     .currencyField(formatter: .numberFormat(NumberFormatter(localeIdentifier: "de_DE", maxFractionDigits: 2))) // Customize NumberFormatter
     // FormatStyle
     .currencyField(formatter: .formatStyle(Decimal.FormatStyle.Currency(
     code: "ILS"
     )
     .precision(.fractionLength(2))
     .decimalSeparator(strategy: .automatic)
     .grouping(.automatic)
     .presentation(.standard)))
     ```
     */
    func currencyField(
        formatter: formatType = .numberFormat(NumberFormatter.currencyDefault)
    ) -> some View {
        self.environment(\.currencyField, CurrencyFieldConfiguration(
            isCurrencyField: true,
            formatter: formatter
        ))
    }
}

// Extend the NumberFormatter class to provide a more convenient initializer and default configuration.
public extension NumberFormatter {
    /**
     Convenience initializer for creating a currency formatter with custom options.
     - Parameters:
        - currencyCode: The ISO 4217 currency code (e.g., "USD"). If nil, uses the locale's default currency.
        - localeIdentifier: The locale identifier (e.g., "en_US"). Defaults to the current locale.
        - maxFractionDigits: The maximum number of fraction digits. Defaults to 2.
        - minFractionDigits: The minimum number of fraction digits. Defaults to 0.
        - currencyDecimalSeparator: The decimal separator to use. If nil, uses the locale's default.
        - currencyGroupingSeparator: The grouping separator to use. If nil, uses the locale's default.
     */
    convenience init(
        currencyCode: String? = nil,
        localeIdentifier: String = Locale.current.identifier,
        maxFractionDigits: Int = 2,
        minFractionDigits: Int = 0,
        currencyDecimalSeparator: String? = nil,
        currencyGroupingSeparator: String? = nil
    ) {
        self.init()
        let locale = Locale(identifier: localeIdentifier)
        self.numberStyle = .currency
        self.currencyCode = currencyCode != nil ? currencyCode : locale.currency?.identifier
        self.locale = locale
        self.maximumFractionDigits = maxFractionDigits
        self.minimumFractionDigits = minFractionDigits
        if currencyDecimalSeparator != nil {
            self.currencyDecimalSeparator = currencyDecimalSeparator
        }
        if currencyGroupingSeparator != nil {
            self.currencyGroupingSeparator = currencyGroupingSeparator
        }
    }
    
    /// Returns a default configured currency formatter instance using the current locale and standard settings.
    static var currencyDefault: NumberFormatter {
        NumberFormatter(currencyCode: nil,
                        localeIdentifier: Locale.current.identifier,
                        maxFractionDigits: 2,
                        minFractionDigits: 0,
                        currencyDecimalSeparator: nil,
                        currencyGroupingSeparator: nil)
    }
}
