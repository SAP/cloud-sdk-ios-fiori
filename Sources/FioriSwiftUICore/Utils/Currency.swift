import Foundation
import SwiftUI

struct CurrencyFieldKey: EnvironmentKey {
    static let defaultValue = CurrencyFieldConfiguration(isCurrencyField: false, formatter: NumberFormatter.currencyDefault)
}

extension EnvironmentValues {
    var currencyField: CurrencyFieldConfiguration {
        get { self[CurrencyFieldKey.self] }
        set { self[CurrencyFieldKey.self] = newValue }
    }
}

struct CurrencyFieldConfiguration {
    let isCurrencyField: Bool
    let formatter: NumberFormatter
}

public extension View {
    /// Configures a TextField as a currency input field with formatting options
    /// - Parameters:
    ///   - formatter: A numberFormatter
    /// - Returns: A view with currency input configuration applied
    ///
    /// Example Usage:
    /// ```swift
    /// TextFieldFormView(
    ///     title: "Price(USD)",
    ///     text: self.$usdAmount,
    ///     placeholder: "Enter amount",
    /// )
    /// .currencyField()
    /// .currencyField(NumberFormatter(...))
    /// .currencyField(formatter: NumberFormatter(localeIdentifier: "de_DE", maxFractionDigits: 2))// Customize NumberFormatter
    /// ```
    func currencyField(
        formatter: NumberFormatter = NumberFormatter.currencyDefault
    ) -> some View {
        self.environment(\.currencyField, CurrencyFieldConfiguration(
            isCurrencyField: true,
            formatter: formatter
        ))
    }
}

// Extend the NumberFormatter class to provide a more convenient initializer and default configuration.
public extension NumberFormatter {
    /// Define a convenience initializer for creating a currency formatter
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
    
    /// Define a static property that returns a default configured currency formatter instance
    static var currencyDefault: NumberFormatter {
        NumberFormatter(currencyCode: nil,
                        localeIdentifier: Locale.current.identifier,
                        maxFractionDigits: 2,
                        minFractionDigits: 0,
                        currencyDecimalSeparator: nil,
                        currencyGroupingSeparator: nil)
    }
}
