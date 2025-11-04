import UIKit

/**
 This is the formatter protocol to handle special formatting of the text used in the `UITextField` of `TextFieldFormCell`.

 Currently, SAPFiori provides two implementations:
 - `PhoneNumberFormatter` to format phone numbers.
 - `CustomNumberFormatter` to format numbers that uses the regular iOS `NumberFormatter`.
 - `GenericTextFormatter` to format any text matching predefined patterns.
 */
public protocol FormattedStringEditing: AnyObject {
    /**
     This function formats the specified string with the specified cursor position then returns the formatted
     `NSAttributedStering` and the adjusted cursor position.

     The implementation may return nil for this function. In that case, the caller should expect
     to use the other function to format the string:
     ```
     func string(for string: String, cursorPosition: Int) -> (formattedString: String?, adjustedCursorPosition: Int)?
     ```

     - parameter string: The original string to be formatted.
     - parameter attrs: The default attributes for the formatted `NSAttributedString`.
     - parameter cursorPosition: The cursor position of a `UITextField` or other similar UI components.

     - returns: A tuple containing the `NSAttributedString` after format, and the adjusted cursor position.

     */
    func attributedString(for string: String, withDefaultAttributes attrs: [NSAttributedString.Key: Any]?, cursorPosition: Int) -> (formattedAttributedString: NSAttributedString?, adjustedCursorPosition: Int)?

    /**
     This function formats the specified string with the specified cursor position then returns the formatted
     string and the adjusted cursor position.

     - parameter string: The original string to be formatted.
     - parameter cursorPosition: The cursor position of a `UITextField` or other similar UI components.

     - returns: A tuple containing the string after format, and the adjusted cursor position.

     */
    func string(for string: String, cursorPosition: Int) -> (formattedString: String?, adjustedCursorPosition: Int)?

    /**
     This function returns the string user typed from formatted string.

     This function is similar to the function with the same signature as in the standard iOS SDK `Formatter`.

     - parameter obj: The implementation should expect this to be a `String`, representing the formatted string.

     - returns: The original string without format.
     */
    func editingString(for obj: Any) -> String?

    /**
     This function checks if the given `partialString` is acceptable to the formatter or not.

     This function is similar to the function with the same signature as in the standard iOS SDK `Formatter`.

     - parameter partialString: The string that is to be added to the editing string.
     - parameter newEditingString: The current editing string.
     - parameter error: This parameter is not used.

     - returns: `true` if the `partialString` is to be accepted.
     */
    func isPartialStringValid(_ partialString: String, newEditingString newString: AutoreleasingUnsafeMutablePointer<NSString?>?, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool
}
