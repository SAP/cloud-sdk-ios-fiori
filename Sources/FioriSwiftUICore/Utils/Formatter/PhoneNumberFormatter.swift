//
//  PhoneNumberFormatter.swift
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
 A `FormattedStringEditing` implementation to format phone number.
 
 This formatter accepts only digit characters 0 through 9.
 All other characters user typed are ignored.
 
 The default format is "(###) ###-####". Which correspond to US phone number system.
 Developer could change the format to fit phone number for other countries.
 */
open class PhoneNumberFormatter: FormattedStringEditing {
    /// :nodoc:
    open func attributedString(for string: String, withDefaultAttributes attrs: [NSAttributedString.Key: Any]?, cursorPosition: Int) -> (formattedAttributedString: NSAttributedString?, adjustedCursorPosition: Int)? {
        nil
    }
    
    /**
     The format string of the phone number.
     
     The default format is "(###) ###-####". Each '#' character
     will be replaced by a digit character user entered.
     Other characters in the format string
     are considered as format characters and are displayed as needed depending on
     the position and the numbers in the string.
     
     For example, when the original string is "1234567890",
     the formatted string will be "(123) 456-7890" using the default format string.
     Or, when the original string is "12345", the resulting formatted string is "(123) 45".
     
     The number of digits user can enter
     is the total number of '#' characters in the format string.
     */
    public var format: String = "(###) ###-####" {
        didSet {
            self.maxDigits = self.format.count(for: "#")
            self.formatChars = []
            for c in self.format.unicodeScalars {
                self.formatChars.append(c)
            }
        }
    }
    
    var maxDigits: Int = 10
    
    var formatChars: [Unicode.Scalar] = []
    
    /// Flag indicating whether the content has been formatted in SwiftUI's TextField
    public var formatted: Bool = false
    
    public var isSwiftUIInputField: Bool = false
    
    private var deleteCharacter: Bool = false
    
    /**
     The constructor.
     */
    public init() {
        self.maxDigits = self.format.count(for: "#")
        self.formatChars = []
        for c in self.format.unicodeScalars {
            self.formatChars.append(c)
        }
    }
    
    /// :nodoc:
    open func string(for string: String, cursorPosition: Int) -> (formattedString: String?, adjustedCursorPosition: Int)? {
        guard !string.isEmpty else {
            return ("", 0)
        }
        
        let digits = String(string.prefix(cursorPosition)).digitCount
        
        var handleString = string
        if self.isSwiftUIInputField, self.deleteCharacter {
            handleString = self.processString(string)
        }
        
        let formattedString = self.string(for: handleString)
        
        if digits == 0 {
            guard let formattedString else { return nil }
            if cursorPosition == 0 {
                return (formattedString, formattedString.count)
            }
            
            // insert before the first digit
            var position = 0
            for c in formattedString.unicodeScalars {
                if CharacterSet.decimalDigits.contains(c) {
                    break
                }
                position += 1
            }
            return (formattedString, position)
        }
        
        if let formattedString {
            let index = self.findCursorIndex(for: digits, in: formattedString)
            return (formattedString, index)
        }
        
        return (formattedString, 0)
    }
    
    open func findCursorIndex(for digits: Int, in formattedString: String) -> Int {
        var index = 0
        var currentDigits = 0
        
        for c in formattedString.unicodeScalars {
            index += 1
            if CharacterSet.decimalDigits.contains(c) {
                currentDigits += 1
                if currentDigits == digits {
                    break
                }
            }
        }
        return index
    }
    
    /*
     This function returns the formatted string to be displayed in the `UITextField`.
     
     - parameter string: The string user typed.
     
     - returns: The formatted string.
     */
    func string(for text: String) -> String? {
        guard !text.isEmpty else {
            // empty text
            return ""
        }
        
        let scalarViewFromString = text.unicodeScalars.filter { CharacterSet.decimalDigits.contains($0) }
        guard !scalarViewFromString.isEmpty else {
            // No digit in the text
            return ""
        }
        
        let scalarView = scalarViewFromString.prefix(self.maxDigits)
        var finalScalarView = String.UnicodeScalarView()
        
        var formatIndex = 0
        for c in scalarView {
            if self.formatChars.count <= formatIndex {
                break
            }
            while self.formatChars[formatIndex] != "#" {
                finalScalarView.append(self.formatChars[formatIndex])
                formatIndex += 1
            }
            finalScalarView.append(c)
            formatIndex += 1
        }
        if self.isSwiftUIInputField {
            self.appendFormatCharacterIfNeeded(finalScalarView: &finalScalarView)
        }
        
        return String(finalScalarView)
    }
    
    private func processString(_ input: String) -> String {
        guard !input.isEmpty else { return input }
        
        var characters = Array(input)
        var lastIndex = characters.count - 1
        
        if characters[lastIndex].isNumber {
            characters.remove(at: lastIndex)
        } else {
            var foundFirstDigit = false
            while lastIndex >= 0 {
                if characters[lastIndex].isNumber {
                    if foundFirstDigit {
                        characters.remove(at: lastIndex)
                        break
                    } else {
                        characters.remove(at: lastIndex)
                        foundFirstDigit = true
                    }
                }
                lastIndex -= 1
            }
        }
        return String(characters)
    }
    
    private func appendFormatCharacterIfNeeded(finalScalarView: inout String.UnicodeScalarView) {
        let currentIndex = finalScalarView.count
        guard !self.deleteCharacter, currentIndex < self.formatChars.count, self.formatChars[currentIndex] != "#" else {
            return
        }
        finalScalarView.append(self.formatChars[currentIndex])
        self.appendFormatCharacterIfNeeded(finalScalarView: &finalScalarView)
    }
    
    /// :nodoc:
    open func editingString(for obj: Any) -> String? {
        guard obj is String, let text = obj as? String else {
            return nil
        }
        
        return String(text.unicodeScalars.filter { CharacterSet.decimalDigits.contains($0) })
    }
    
    /// :nodoc:
    open func isPartialStringValid(_ partialString: String, newEditingString newString: AutoreleasingUnsafeMutablePointer<NSString?>?, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        guard !partialString.isEmpty else {
            // this means the delete chacter
            self.deleteCharacter = true
            return true
        }
        
        self.deleteCharacter = false
        if partialString.digitCount != partialString.count {
            return false
        }
        
        return true
    }
}

extension String {
    var digitCount: Int {
        self.unicodeScalars.filter { CharacterSet.decimalDigits.contains($0) }.count
    }
    
    func count(for scalar: Unicode.Scalar) -> Int {
        self.unicodeScalars.filter { $0 == scalar }.count
    }
}
