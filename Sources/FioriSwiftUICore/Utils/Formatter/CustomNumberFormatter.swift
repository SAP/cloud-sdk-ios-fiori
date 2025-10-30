//
//  CustomNumberFormatter.swift
//  SAPFiori
//
//  Copyright © 2018 SAP SE or an SAP affiliate company. All rights reserved.
//
//  No part of this publication may be reproduced or transmitted in any form or for any purpose
//  without the express permission of SAP SE. The information contained herein may be changed
//  without prior notice.
//
import UIKit

/**
 This is an implementation of `FormattedStringEditing` on top of the regular iOS `NumberFormatter`.
 
 The main enhancement is to add the support to handle cursor positions.
 
 Here are two examples when using with the `FUITextFieldFormCell`:
 - As a currency number formatter
 ```
 let cell = tableView.dequeueReusableCell(withIdentifier: FUITextFieldFormCell.reuseIdentifier) as! FUITextFieldFormCell
 cell.keyName = "Price"
 cell.keyboardType = .decimalPad
 let formatter = CustomNumberFormatter()
 formatter.numberStyle = .currency
 cell.formatter = formatter
 ...
 ```
 The text field will display "$12.34" when user types "12.34".
 
 - With custom suffix
 ```
 let cell = tableView.dequeueReusableCell(withIdentifier: FUITextFieldFormCell.reuseIdentifier) as! FUITextFieldFormCell
 cell.keyName = "Weight"
 cell.keyboardType = .decimalPad
 let formatter = CustomNumberFormatter()
 formatter.numberStyle = .decimal
 formatter.maximumFractionDigits = 3
 formatter.positiveSuffix = "lbs"
 cell.formatter = formatter
 ```
 The text field will display "1.234lbs" when user types "1.234".
 
 */
open class CustomNumberFormatter: NumberFormatter, FormattedStringEditing, @unchecked Sendable {
    /// :nodoc:
    override open var locale: Locale! {
        get {
            super.locale
        }
        set {
            self.defaultFormatter.locale = newValue
            super.locale = newValue
        }
    }
    
    /// :nodoc:
    open func attributedString(for string: String, withDefaultAttributes attrs: [NSAttributedString.Key: Any]?, cursorPosition: Int) -> (formattedAttributedString: NSAttributedString?, adjustedCursorPosition: Int)? {
        guard attrs != nil,
              let formattedTuple = self.string(for: string, cursorPosition: cursorPosition),
              let formattedString = formattedTuple.formattedString
        else {
            return nil
        }
        
        guard !formattedString.isEmpty else {
            return (NSAttributedString(string: formattedString, attributes: attrs), formattedTuple.adjustedCursorPosition)
        }
        let adjustedCursorPosition = formattedTuple.adjustedCursorPosition
        
        let prefixAndSuffix = self.getPrefixAndSuffix(formattedString)
        let prefix = prefixAndSuffix.prefix
        let suffix = prefixAndSuffix.suffix
        
        let attrString = NSMutableAttributedString()
        guard let attrs else { return (attrString, adjustedCursorPosition) }
        var attrsForPad = attrs
        attrsForPad[.kern] = NSNumber(value: 2.0)
        var normalAttrs = attrs
        normalAttrs[.kern] = NSNumber(value: 0)
        let middlePart = String(formattedString.suffix(formattedString.count - prefix.count).prefix(formattedString.count - suffix.count))
        if !prefix.isEmpty {
            attrString.append(NSAttributedString(string: String(prefix.prefix(prefix.count - 1)), attributes: normalAttrs))
            attrString.append(NSAttributedString(string: String(prefix.suffix(1)), attributes: attrsForPad))
        }
        if !suffix.isEmpty {
            attrString.append(NSAttributedString(string: String(middlePart.prefix(middlePart.count - 1)), attributes: normalAttrs))
            attrString.append(NSAttributedString(string: String(middlePart.suffix(1)), attributes: attrsForPad))
            attrString.append(NSAttributedString(string: suffix, attributes: normalAttrs))
        } else {
            attrString.append(NSAttributedString(string: middlePart, attributes: normalAttrs))
        }
        
        return (attrString, adjustedCursorPosition)
    }
    
    let defaultFormatter = NumberFormatter()
    
    /// :nodoc:
    open func string(for string: String, cursorPosition: Int) -> (formattedString: String?, adjustedCursorPosition: Int)? {
        guard !string.isEmpty else {
            return ("", 0)
        }
        let validChars = self.validCharCount(string, at: cursorPosition)
        let formattedString = self.formatString(for: string)
        
        if validChars == 0 {
            var position = 0
            for c in formattedString.unicodeScalars {
                if CharacterSet.decimalDigits.contains(c) {
                    break
                }
                position += 1
            }
            
            return (formattedString, position)
        }
        
        var index = 0
        var currentDigitsOrDecimal = 0
        var lastCharIndex = 0
        
        guard let decimalPoint = self.defaultFormatter.decimalSeparator.unicodeScalars.first else { return (formattedString, lastCharIndex) }
        
        for c in formattedString.unicodeScalars {
            index += 1
            if c == decimalPoint || CharacterSet.decimalDigits.contains(c) {
                currentDigitsOrDecimal += 1
                lastCharIndex = index
                if currentDigitsOrDecimal == validChars {
                    break
                }
            }
        }
        
        return (formattedString, lastCharIndex)
    }
    
    func formatString(for string: String) -> String {
        var resultString = ""
        var decimalText = self.effectiveString(string)
        guard let sep = self.defaultFormatter.decimalSeparator.first else { return resultString }
        let decimalIndex = decimalText.firstIndex(of: sep)
        if self.maximumFractionDigits > 0, let decimalIndex {
            let fractionString = decimalText.suffix(from: decimalIndex)
            if fractionString.count > maximumFractionDigits {
                let effectiveFractionString = fractionString.prefix(maximumFractionDigits + 1)
                decimalText = String(decimalText.prefix(upTo: decimalIndex) + effectiveFractionString)
            }
        }
        var decimalSuffix = ""
        if let decimalIndex {
            decimalSuffix = String(String(decimalText.suffix(from: decimalIndex)))
        }
        
        if let number = defaultFormatter.number(from: decimalText) {
            if let formattedString = self.string(from: number) {
                resultString = self.formattedString(formattedString, with: decimalSuffix)
            }
        }
        
        return resultString
    }
    
    /// :nodoc:
    override open func editingString(for obj: Any) -> String? {
        guard obj is String else {
            return nil
        }
        
        guard let text = obj as? String else { return nil }
        return self.effectiveString(text)
    }
    
    /// :nodoc:
    override open func isPartialStringValid(_ partialString: String, newEditingString newString: AutoreleasingUnsafeMutablePointer<NSString?>?, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        // make sure that only digits and one decimal point character is accepted
        var editingString = ""
        if let newString, let pointee = newString.pointee {
            editingString = pointee as String
        }
        return self.isPartialStringValid(partialString, with: editingString)
    }
    
    func effectiveString(_ string: String) -> String {
        guard let decimalPoint = self.defaultFormatter.decimalSeparator.unicodeScalars.first else { return "" }
        var foundDecimal = false
        var finalScalarView = String.UnicodeScalarView()
        for c in string.unicodeScalars {
            if CharacterSet.decimalDigits.contains(c) {
                finalScalarView.append(c)
            } else if c == decimalPoint {
                if !foundDecimal {
                    foundDecimal = true
                    finalScalarView.append(c)
                }
            } else if c == "-", finalScalarView.isEmpty {
                finalScalarView.append(c)
            }
        }
        
        return String(finalScalarView)
    }
    
    func validCharCount(_ string: String, at cursorPosition: Int) -> Int {
        var foundDecimal = false
        var charCount = 0
        var index = 0
        guard let decimalPoint = self.defaultFormatter.decimalSeparator.unicodeScalars.first else { // decimalSeparator.unicodeScalars.first!
            return charCount
        }
        for c in string.unicodeScalars {
            if c == decimalPoint {
                if !foundDecimal {
                    foundDecimal = true
                    charCount += 1
                }
            } else if CharacterSet.decimalDigits.contains(c) {
                charCount += 1
            }
            index += 1
            if index >= cursorPosition {
                break
            }
        }
        
        return charCount
    }
    
    func isPartialStringValid(_ partialString: String, with editingString: String) -> Bool {
        guard !partialString.isEmpty, let sep = self.defaultFormatter.decimalSeparator.unicodeScalars.first else {
            // this means the delete chacter
            return true
        }
        
        let decimalCount = partialString.count(for: sep)
        if partialString.digitCount + decimalCount != partialString.count {
            // There are other characters
            return false
        }
        
        // check there should be at most one "." character
        if decimalCount > 1 {
            return false
        } else if decimalCount == 1,
                  editingString.count(for: sep) > 0
        {
            return false
        }
        
        return true
    }
    
    // Sometimes the formatted string will have additional digits in the fraction part of the digit.
    // For example, when user entered "1", the formatted string from `NumberFormatter` is "1.00".
    // This funcrtion removes the extra ".00" that user did not entered.
    func formattedString(_ string: String, with decimalSuffix: String) -> String {
        guard let decimalPoint = self.defaultFormatter.decimalSeparator.unicodeScalars.first else { return "" }
        if let index = string.firstIndex(of: Character(defaultFormatter.decimalSeparator)) {
            let integerPart = string.prefix(upTo: index)
            let decimalPart = string.suffix(from: index)
            var count = 0
            for c in decimalPart.unicodeScalars {
                if c == decimalPoint || CharacterSet.decimalDigits.contains(c) {
                    count += 1
                } else {
                    break
                }
            }
            let suffixPart = decimalPart.suffix(decimalPart.count - count)
            
            return String(integerPart + decimalSuffix.prefix(maximumFractionDigits + 1) + suffixPart)
        } else if !decimalSuffix.isEmpty {
            // Need to add the decimal point
            let suffix = self.getPrefixAndSuffix(string).suffix
            let stringBeforeSuffix = String(string.prefix(string.count - suffix.count))
            
            return stringBeforeSuffix + decimalSuffix + suffix
        }
        
        return string
    }
    
    func getPrefixAndSuffix(_ formattedString: String) -> (prefix: String, suffix: String) {
        var isPositive = true
        if let number = defaultFormatter.number(from: self.effectiveString(formattedString)) {
            if number.doubleValue < 0 {
                isPositive = false
            }
        }
        
        let prefix = (isPositive ? self.positivePrefix : self.negativePrefix) ?? ""
        let suffix = (isPositive ? self.positiveSuffix : self.negativeSuffix) ?? ""
        
        return (prefix, suffix)
    }
}
