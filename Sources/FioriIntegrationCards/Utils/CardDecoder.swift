import Foundation

/// Custom JSONDecoder to be used for decoding an integration card
public class CardDecoder: JSONDecoder {
    /// Initializer
    /// - Parameter context: decoding context accessible via `userInfo` dictionary
    public init(context: CardDecodingContext = CardDecodingContext()) {
        super.init()
        self.userInfo[.cardContext] = context
    }
}

/// Decoding context for `CardDecoder` accessible by its `userInfo` dictionary
public class CardDecodingContext {
    /// a cards's configuration with parameters, destinations, and filters, which can be used inside the card
    public var configuration: Configuration?

    /// :nodoc:
    public init() {}
}

// swiftlint:disable force_unwrapping
/// Coding keys to access values from `userInfo` dictionary in `CardDecoder`
public extension CodingUserInfoKey {
    /// key to access `CardDecodingContext` from `CardDecoder.userInfo`
    static let cardContext = CodingUserInfoKey(rawValue: "IntegrationCardContext")!
}
