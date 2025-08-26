#if !os(visionOS)
    import UIKit

    /**
     A GenericTextFormatter implementation to format custom patterns.

     This formatter accepts different character types based on pattern markers.
     Each marker defines what type of character is allowed at that position.
     Unmatched characters will be ignored during input.

     The pattern markers are:
     A: Requires a letter (a-z, A-Z)
     N: Requires a number (0-9)
     X: Accepts either a letter or number
     S: Requires a special character
     *: Accepts any character
     YY/YYYY: Represents 2 or 4 digit year
     MM: Represents 2 digit month
     DD: Represents 2 digit day
     Use back space to specify a location for the special characters
     */
    open class GenericTextFormatter {
        struct FormatCharacter {
            var character: Unicode.Scalar
            var isFixedPlaceholder: Bool
            var isJoiner: Bool
            var isRawInput‌: Bool
        
            init(character: Unicode.Scalar) {
                self.character = character
                self.isFixedPlaceholder = false
                self.isJoiner = false
                self.isRawInput‌ = true
            }
        
            init(character: Unicode.Scalar, isFixedPlaceholder: Bool) {
                self.character = character
                self.isFixedPlaceholder = isFixedPlaceholder
                self.isJoiner = false
                self.isRawInput‌ = false
            }
        
            init(character: Unicode.Scalar, isJoiner: Bool) {
                self.character = character
                self.isFixedPlaceholder = false
                self.isJoiner = isJoiner
                self.isRawInput‌ = false
            }
        }
    
        /**
         Format validation error types
         */
        public enum FormatError: Int {
            /// No error occurred (reserved raw value 0)
            case none = 0
        
            // MARK: - Basic validation

            /// Expected numeric character (0-9)
            case number
            /// Expected alphabetic character (A-Z, a-z)
            case letter
            /// Expected alphanumeric character
            case letterOrNumber
            /// Expected special character (non-alphanumeric)
            case specialCharacter
        
            // MARK: - Date validation

            /// Expected year digits (YY/YYYY format)
            case yearNumber
            /// Expected month digits (MM format)
            case monthNumber
            /// Expected day digits (DD format)
            case dayNumber
            /// Incomplete date format (required YYYY, YY, MM and DD when Y, M, and D are used.)
            case dateFormatError
        
            /// Unspecified validation error
            case otherError
        }

        /// :nodoc:
        open func attributedString(for string: String, withDefaultAttributes attrs: [NSAttributedString.Key: Any]?, cursorPosition: Int) -> (formattedAttributedString: NSAttributedString?, adjustedCursorPosition: Int)? {
            nil
        }

        /**
         Each character in the format string is either:
          - A pattern marker (A, N, X, S, *, YY, YYYY, MM, DD)
          - A literal character (displayed as-is)
          - An escaped special character (prefixed with \)

         For example:
            If the format string is
            AA NNN NNNS X YYYY/MM/DD \A\*
            and user input "CA234567!U20250605" then it will display
            "CA 234 567! U 2025/06/05 A*"
         */
        public var format: String = #"AA NNN NNNS X YYYY/MM/DD \A\*"# {
            didSet {
                let hasYearMark = self.format.contains("Y")
                let hasMonthMark = self.format.contains("M")
                let hasDayMark = self.format.contains("D")
            
                if hasYearMark,
                   !self.format.hasExactly(2, consecutive: "Y"),
                   !self.format.hasExactly(4, consecutive: "Y")
                {
                    if self.format.hasExactly(2, consecutive: "Y") {
                        self.shortYearFormat = true
                    }
                    self.formatError = .dateFormatError
                    if self.isDateFormatValidationStrict {
                        fatalError("Format must contain YYYY or YY when using Y")
                    }
                }
                if hasMonthMark,
                   !self.format.hasExactly(2, consecutive: "M")
                {
                    self.formatError = .dateFormatError
                    if self.isDateFormatValidationStrict {
                        fatalError("Format must contain MM when using M")
                    }
                }
                if hasDayMark,
                   !self.format.hasExactly(2, consecutive: "D")
                {
                    self.formatError = .dateFormatError
                    if self.isDateFormatValidationStrict {
                        fatalError("Format must contain DD when using D")
                    }
                }
            
                self.ignoredCharacters = self.findInvalidCharacters()
                self.maxValidCharCount = self.format.validCharCount(self.ignoredCharacters)
                self.formatChars = []
                for c in self.format.unicodeScalars {
                    self.formatChars.append(c)
                }
            }
        }
    
        /// Minimum allowed year value (default: 1900)
        public var yearMinium: Int = 1900
        /// Maximum allowed year value (default: 2099)
        public var yearMaximum: Int = 2099
        /// Format validation error state
        public var formatError: FormatError = .none
        /// Whether to enable strict date format validation (default: false)
        /// - Note: When enabled, invalid date formats will trigger fatalError
        public var isDateFormatValidationStrict: Bool = false
        /// Flag indicating whether content has been formatted
        public var formatted: Bool = false
    
        private var ignoredCharacters: Set<Character> = []
        private let validCharacters: [Unicode.Scalar] = ["A", "N", "X", "S", "*", "Y", "M", "D"]
        private var maxValidCharCount: Int = 10
        private var shortYearFormat: Bool = false
        private var formattedCharacters = [FormatCharacter]()
        private var yearNumber: Int = Calendar.current.component(.year, from: Date())
        private var monthNumber: Int = Calendar.current.component(.month, from: Date())
        private var formatChars: [Unicode.Scalar] = []
        private var currentCursorPosition: Int = 0
        private var deleteCharacter: Bool = false

        /**
         The constructor.
         */
        public init() {
            self.ignoredCharacters = self.findInvalidCharacters()
            self.maxValidCharCount = self.format.validCharCount(self.ignoredCharacters)
            self.formatChars = []
            for c in self.format.unicodeScalars {
                self.formatChars.append(c)
            }
        }

        /// :nodoc:
        open func string(for string: String, cursorPosition: Int) -> (formattedString: String?, adjustedCursorPosition: Int)? {
            self.currentCursorPosition = cursorPosition
            guard !string.isEmpty else {
                return ("", 0)
            }
        
            let formattedString = self.string(for: string)

            if let formattedString, !formattedString.isEmpty {
                if self.deleteCharacter {
                    return (formattedString, self.currentCursorPosition)
                }
            
                if !self.isStringFullyValid(formattedString) {
                    if self.currentCursorPosition == 0 {
                        // Handles cases of copy-paste or direct assignment
                        self.formattedCharacters.removeAll()
                        return ("", 0)
                    } else {
                        // ‌Handles case of high-speed/rapid input
                        if self.currentCursorPosition < self.formattedCharacters.count {
                            self.formattedCharacters.removeSubrange(self.currentCursorPosition...)
                        }
                        let originalString = String(formattedString.prefix(self.currentCursorPosition))
                        return (originalString, self.currentCursorPosition)
                    }
                }
            
                self.currentCursorPosition = formattedString.count
                return (formattedString, self.currentCursorPosition)
            }
            self.currentCursorPosition = 0
            self.formattedCharacters.removeAll()
            return (formattedString, 0)
        }
    
        func isStringFullyValid(_ text: String) -> Bool {
            var index = 0
            for scalar in text.unicodeScalars {
                if self.formatChars[index] == "\\" {
                    if scalar != self.formatChars[index + 1] {
                        return false
                    }
                    index += 1
                } else {
                    if !self.isValid(char: scalar, for: index, checkOnly: true) {
                        return false
                    }
                }
                index += 1
            }
            return true
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

            // Remove the fixed characters at the end of the text.
            var processedString: String = text
            if self.deleteCharacter {
                processedString = self.deleteCheck(text: text)
            }
            // Safely remove all fixed characters (reverse traversal to avoid index misalignment)
            let fixedCharactersIndices = self.formattedCharacters.enumerated()
                .filter(\.element.isFixedPlaceholder)
                .map(\.offset)
                .sorted(by: >)

            for index in fixedCharactersIndices where index < processedString.count {
                processedString.remove(at: processedString.index(processedString.startIndex, offsetBy: index))
            }
        
            // Remove all ignored joiner characters
            let scalarViewFromString = processedString.filter { !self.ignoredCharacters.contains($0) }.unicodeScalars
        
            guard !scalarViewFromString.isEmpty else {
                self.formattedCharacters.removeAll()
                return ""
            }
        
            let scalarView = scalarViewFromString.prefix(self.maxValidCharCount)
            var finalScalarView = String.UnicodeScalarView()
            self.formattedCharacters = [FormatCharacter]()
        
            var formatIndex = 0
            for c in scalarView {
                if self.formatChars.count <= formatIndex {
                    break
                }
                while !self.validCharacters.contains(self.formatChars[formatIndex]) {
                    if self.formatChars[formatIndex] == "\\" {
                        finalScalarView.append(self.formatChars[formatIndex + 1])
                        self.formattedCharacters.append(FormatCharacter(character: self.formatChars[formatIndex + 1], isFixedPlaceholder: true))
                        formatIndex += 1
                    } else {
                        finalScalarView.append(self.formatChars[formatIndex])
                        self.formattedCharacters.append(FormatCharacter(character: self.formatChars[formatIndex], isJoiner: true))
                    }
                    formatIndex += 1
                }
                finalScalarView.append(c)
                self.formattedCharacters.append(FormatCharacter(character: c))
                formatIndex += 1
            }
            let index2 = finalScalarView.count
            if !self.deleteCharacter,
               index2 < self.format.count,
               let symbols = validateJoinerAndFixedChars(from: index2).1
            {
                finalScalarView.append(contentsOf: symbols)
            }
            return String(finalScalarView)
        }
    
        /// :nodoc:
        func deleteCheck(text: String) -> String {
            var finalText: String = text
        
            var dropCount = 0
            if text.count <= self.formattedCharacters.count {
                // drop the last append fixed string or joiner
                var i = self.formattedCharacters.count - 1
                while i > 0, !self.formattedCharacters[i].isRawInput‌ {
                    let c = Character(formattedCharacters[i].character)
                    if let index = finalText.lastIndex(of: c) {
                        finalText.remove(at: index)
                        dropCount += 1
                    }
                    i -= 1
                }
            }
            finalText.removeLast()
            return finalText
        }
    
        /// :nodoc:
        func isValid(char: Unicode.Scalar, for position: Int, checkOnly: Bool = false) -> Bool {
            var adjustedPos = position
            if !checkOnly {
                let result = self.validateJoinerAndFixedChars(from: position)
                adjustedPos = result.0
            }
            guard adjustedPos >= 0 else { return false }
        
            let index = self.format.index(self.format.startIndex, offsetBy: adjustedPos)
            let symbol = self.format[index]
            let character = Character(char)
        
            var isValid = true
            switch symbol {
            case "A":
                isValid = character.isLetter
                self.formatError = isValid ? .none : .letter
            case "N":
                isValid = character.isNumber
                self.formatError = isValid ? .none : .number
            case "Y":
                isValid = character.isNumber && self.checkYearNumberValid(char: char, for: adjustedPos)
                self.formatError = isValid ? .none : .yearNumber
            case "M":
                isValid = character.isNumber && self.checkMonthNumberValid(char: char, for: adjustedPos)
                self.formatError = isValid ? .none : .monthNumber
            case "D":
                isValid = character.isNumber && self.checkDayNumberValid(char: char, for: adjustedPos)
                self.formatError = isValid ? .none : .dayNumber
            case "X":
                isValid = character.isLetter || character.isNumber
                self.formatError = isValid ? .none : .letterOrNumber
            case "S":
                isValid = !character.isLetter && !character.isNumber
                self.formatError = isValid ? .none : .specialCharacter
            case "*":
                isValid = true
                self.formatError = .none
            default:
                isValid = false
                if checkOnly {
                    isValid = symbol == character
                }
                self.formatError = .otherError
            }
            return isValid
        }
    
        /// :nodoc:
        func checkYearNumberValid(char: Unicode.Scalar, for position: Int) -> Bool {
            guard let inputNumber = Int(String(char)), position >= 0 else { return false }
            var isValid = true
            let yIndex = self.formatChars[0 ... position]
                .filter { $0 == "Y" }
                .count
        
            if self.shortYearFormat {
                if yIndex == 1 {
                    let theNumber = self.yearMinium / 100 * 10 + inputNumber
                    isValid = (self.yearMinium / 10 ... self.yearMaximum / 10).contains(theNumber)
                } else if yIndex == 2,
                          let previousNumber = Int(String(formattedCharacters[position - 1].character))
                {
                    let theNumber = self.yearMinium / 100 * 100 + previousNumber * 10 + inputNumber
                    isValid = (self.yearMinium ... self.yearMaximum).contains(theNumber)
                }
            } else {
                if yIndex == 1 {
                    isValid = (self.yearMinium / 1000 ... self.yearMaximum / 1000).contains(inputNumber)
                } else if yIndex == 2,
                          let previousNumber = Int(String(formattedCharacters[position - 1].character))
                {
                    let theNumber = previousNumber * 10 + inputNumber
                    isValid = (self.yearMinium / 100 ... self.yearMaximum / 100).contains(theNumber)
                } else if yIndex == 3,
                          let firstNumber = Int(String(formattedCharacters[position - 2].character)),
                          let secondNumber = Int(String(formattedCharacters[position - 1].character))
                {
                    let theNumber = firstNumber * 100 + secondNumber * 10 + inputNumber
                    isValid = (self.yearMinium / 10 ... self.yearMaximum / 10).contains(theNumber)
                } else if yIndex == 4 {
                    let scalars = self.formattedCharacters[(position - 3) ..< position].map(\.character)
                    let combinedNumber = Int(scalars.map { String($0) }.joined()) ?? 0
                    let theYear = combinedNumber * 10 + inputNumber
                    isValid = (self.yearMinium ... self.yearMaximum).contains(theYear)
                    self.yearNumber = theYear
                }
            }
            return isValid
        }
    
        /// :nodoc:
        func checkMonthNumberValid(char: Unicode.Scalar, for position: Int) -> Bool {
            // 0-12
            guard let inputNumber = Int(String(char)), position >= 0 else { return false }
            var isValid = true
            let mIndex = self.formatChars[0 ... position]
                .filter { $0 == "M" }
                .count
            if mIndex == 1 {
                isValid = inputNumber <= 1
                // Optimization: if inputNumber > 1, auto-fill '0' + inputNumber
                // and move cursor to next position
            } else if mIndex == 2,
                      let previousNumber = Int(String(formattedCharacters[position - 1].character))
            {
                isValid = previousNumber == 0 ? inputNumber > 0 : inputNumber <= 2
                self.monthNumber = previousNumber * 10 + inputNumber
            }
            return isValid
        }
    
        /// :nodoc:
        func checkDayNumberValid(char: Unicode.Scalar, for position: Int) -> Bool {
            // 0-28,29,30,31
            guard let inputNumber = Int(String(char)), position >= 0 else { return false }
            var isValid = true
            let dIndex = self.formatChars[0 ... position]
                .filter { $0 == "D" }
                .count
            let maxDays = self.daysInMonth(year: self.yearNumber, month: self.monthNumber) ?? 31
            if dIndex == 1 {
                isValid = inputNumber <= maxDays / 10 // 0, 2,3
            } else if dIndex == 2,
                      let previousNumber = Int(String(formattedCharacters[position - 1].character))
            {
                let theDay = previousNumber * 10 + inputNumber
                isValid = theDay <= maxDays && theDay > 0
            }
            return isValid
        }
    
        /// :nodoc:
        func daysInMonth(year: Int, month: Int) -> Int? {
            guard 1 ... 12 ~= month else { return nil }
        
            let calendar = Calendar.current
            var components = DateComponents()
            components.year = year
            components.month = month
        
            guard let date = calendar.date(from: components),
                  let range = calendar.range(of: .day, in: .month, for: date)
            else {
                return nil
            }
            return range.count
        }
    
        /// :nodoc:
        func validateJoinerAndFixedChars(from startIndex: Int) -> (Int, [Unicode.Scalar]?) {
            let adjustIndex = startIndex + self.formattedCharacters.filter(\.isFixedPlaceholder).count
            guard adjustIndex >= 0, adjustIndex < self.formatChars.count else { return (startIndex, nil) }
            var string = [Unicode.Scalar]()
            var escaping = false

            var index = adjustIndex
            for i in adjustIndex ..< self.formatChars.count {
                index = i
                if escaping {
                    escaping = false
                    continue
                }
                if !self.validCharacters.contains(self.formatChars[i]) {
                    if self.formatChars[i] == "\\" {
                        escaping = true
                        string.append(self.formatChars[i + 1])
                        // Temporarily populate array to avoid date detection errors before full reset.
                        self.formattedCharacters.append(FormatCharacter(character: self.formatChars[i + 1], isFixedPlaceholder: true))
                    } else {
                        string.append(self.formatChars[i])
                        self.formattedCharacters.append(FormatCharacter(character: self.formatChars[i], isJoiner: true))
                    }
                } else {
                    return (i, string)
                }
            }
            return (index, string)
        }

        /// :nodoc:
        open func editingString(for obj: Any) -> String? {
            guard let text = obj as? String else {
                return nil
            }
            let finalString = text.filter { !self.ignoredCharacters.contains($0) }
            if finalString.isEmpty {
                self.formattedCharacters = [FormatCharacter]()
            }
            return finalString
        }

        /// :nodoc:
        open func isPartialStringValid(_ partialString: String, position: Int = 0) -> Bool {
            guard !partialString.isEmpty else {
                // this means the delete chacter
                self.deleteCharacter = true
                return true
            }
            self.deleteCharacter = false
        
            if position < self.format.maxCursorPosition,
               let char = partialString.unicodeScalars.first,
               formattedCharacters.count < format.maxCursorPosition
            {
                let valid = self.isValid(char: char, for: position)
                return valid
            }
            return false
        }
    
        /// :nodoc:
        func findInvalidCharacters() -> Set<Character> {
            var invalidChars = Set<Character>()
            var skipNext = false
        
            for char in self.format {
                if char == "\\" {
                    skipNext = true
                    continue
                }
            
                if skipNext {
                    skipNext = false
                    continue
                }
            
                guard let scalar = char.unicodeScalars.first else { continue }
                if !self.validCharacters.contains(scalar) {
                    invalidChars.insert(char)
                }
            }
            return invalidChars
        }
    }

    extension String {
        var maxCursorPosition: Int {
            var count = 0
            var index = startIndex
        
            while index < endIndex {
                let currentChar = self[index]
            
                if currentChar == "\\" {
                    if let nextIndex = self.index(index, offsetBy: 1, limitedBy: endIndex),
                       nextIndex != endIndex
                    {
                        index = nextIndex
                        continue
                    }
                }
            
                count += 1
                index = self.index(index, offsetBy: 1)
            }
            return count
        }
    
        func validCharCount(_ ignoredCharacters: Set<Character>) -> Int {
            var count = 0
            var isEscaped = false
    
            for char in self {
                if char == "\\", !isEscaped {
                    isEscaped = true
                    continue
                }
            
                if isEscaped {
                    count += 1
                    isEscaped = false
                } else {
                    if !ignoredCharacters.contains(char) {
                        count += 1
                    }
                }
            }
            return count
        }
    
        func hasExactly(_ count: Int, consecutive character: Character) -> Bool {
            guard count > 0 else { return false }
            let target = String(repeating: character, count: count)
            let overCount = String(repeating: character, count: count + 1)
        
            return range(of: target) != nil
                && range(of: overCount) == nil
                && filter { $0 == character }.count == count
        }
    }
#endif
