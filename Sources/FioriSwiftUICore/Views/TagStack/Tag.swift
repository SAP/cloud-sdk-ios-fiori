import Foundation
import SwiftUI

public protocol TagStyle {
    /// A view that represents the body of a tag.
    associatedtype Body: View

    /// Creates a view that represents the body of a tag.
    ///
    /// The system calls this method for each ``Tag`` instance in a view
    /// hierarchy where this style is the current tag style.
    ///
    /// - Parameter configuration : The properties of the tag.
    func makeBody(configuration: Self.Configuration) -> Self.Body

    /// The properties of a tag.
    typealias Configuration = TagStyleConfiguration
}

/// The properties of a tag.
public struct TagStyleConfiguration {
    /// label
    public var label: Text
}

public struct AnyTagStyle {
    var apply: (TagStyleConfiguration) -> AnyView
    
    public init<T: TagStyle>(_ t: T) {
        self.apply = {
            AnyView(t.makeBody(configuration: $0))
        }
    }
}

public struct LightTagStyle: TagStyle {
    public init() {}

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration
            .label
            .font(.footnote)
            .foregroundColor(.preferredColor(.primary2))
            .padding(EdgeInsets(top: 2, leading: 3, bottom: 2, trailing: 3))
            .background(RoundedRectangle(cornerRadius: 4).stroke(Color.preferredColor(.primary7), lineWidth: 0.5))
    }
}

public struct DarkTagStyle: TagStyle {
    public init() {}
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration
            .label
            .font(.footnote)
            .foregroundColor(.preferredColor(.primary1, background: .darkConstant))
            .padding(EdgeInsets(top: 2, leading: 3, bottom: 2, trailing: 3))
            .background(RoundedRectangle(cornerRadius: 4).fill(Color.preferredColor(.primary3)))
    }
}

public struct CustomTagStyle: TagStyle {
    /// text color
    var textColor: Color = .preferredColor(.primary2)

    // text font
    var font: Font = .footnote

    /// Color inside the tag
    var fillColor: Color = .clear

    /// ContentInsets between the tag border and tag content
    var contentInsets = EdgeInsets(top: 2, leading: 3, bottom: 2, trailing: 3)

    /// Corner radius around the tag
    var cornerRadius: CGFloat = 4

    /// border width around the perimeter of the tag
    var borderWidth: CGFloat = 0.5

    /// Color around the perimeter of the tag
    var borderColor: Color = .preferredColor(.primary7)

    public init(textColor: Color? = nil, font: Font? = nil, fillColor: Color? = nil, contentInsets: EdgeInsets? = nil, cornerRadius: CGFloat? = nil, borderWidth: CGFloat? = nil, borderColor: Color? = nil) {
        if let tc = textColor {
            self.textColor = tc
        }
        
        if let ft = font {
            self.font = ft
        }

        if let fc = fillColor {
            self.fillColor = fc
        }

        if let ci = contentInsets {
            self.contentInsets = ci
        }

        if let cr = cornerRadius {
            self.cornerRadius = cr
        }

        if let bw = borderWidth {
            self.borderWidth = bw
        }

        if let bc = borderColor {
            self.borderColor = bc
        }
    }

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration
            .label
            .font(self.font)
            .foregroundColor(self.textColor)
            .padding(self.contentInsets)
            .background(ZStack {
                RoundedRectangle(cornerRadius: cornerRadius).fill(fillColor)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(borderColor, lineWidth: borderWidth)
            })
    }
}

struct TagStyleKey: EnvironmentKey {
    public static let defaultValue = AnyTagStyle(LightTagStyle())
}

public extension EnvironmentValues {
    /// Distribution of left and right content columns, when in `.regular` horizontal content mode.  Defaults to `0.5`.
    var tagStyle: AnyTagStyle {
        get { self[TagStyleKey.self] }
        set { self[TagStyleKey.self] = newValue }
    }
}

struct TagLimitEnvironmentKey: EnvironmentKey {
    static let defaultValue: Int? = nil
}

public extension EnvironmentValues {
    /// The maximum number of tags that ObjectHeader can allow to display
    /// The maximum number of tags is 1 if the value is less than 1.
    /// If the value is nil, it uses as many tags as required. The default is nil.
    var tagLimit: Int? {
        get { self[TagLimitEnvironmentKey] }
        set {
            if let tmpValue = newValue {
                self[TagLimitEnvironmentKey] = max(1, tmpValue)
            } else {
                self[TagLimitEnvironmentKey] = nil
            }
        }
    }
}

public extension View {
    /// Sets the style for tags within this view to a tag style with a
    /// custom appearance and custom interaction behavior.
    ///
    /// To set a specific style for all tag instances within a view, use the
    /// ``View/tagStyle(_:)-66fbx`` modifier:
    ///
    ///     HStack {
    ///         Tag("Tag1")
    ///         Tag("Tag2")
    ///     }
    ///     .tagStyle(DarkTagStyle())
    func tagStyle<S>(_ style: S) -> some View where S: TagStyle {
        self.environment(\.tagStyle, AnyTagStyle(style))
    }
    
    /// Sets the maximum number of tags that a View can display.
    ///
    /// Use `tagLimit(_:)` to cap the number of tags that a View can
    /// display.
    ///
    /// The line limit applies to all ``Tag`` instances within a hierarchy.
    ///
    ///  ```swift
    ///  ObjectHeader(title: "Transformer Overheating",
    ///             subtitle: "Three Phase Pad Mounted Transformer (533423)",
    ///             tags: ["I am selected", "PM01", "103-Repair", "tag 4", "tag 5", "tag 6"],
    ///             footnote: "1000 - Hamburg, MECHANIK",
    ///             descriptionText: "Customer noticed that the transformer started",
    ///             status: "High",
    ///             substatus: "Scheduled",
    ///             detailContent: {
    ///                 HeaderChart(title: {
    ///                    Text("Temperature")
    ///                 }, subtitle: {
    ///                    Text("20 min ago")
    ///                 }, chart: {
    ///                    ChartView(chartModel)
    ///                 })
    ///             })
    ///             .tagLimit(3)
    /// ```
    ///
    /// - Parameter number: The line limit. If `nil`, no line limit applies.
    ///
    /// - Returns: A view that limits the number of tags
    ///
    func tagLimit(_ number: Int?) -> some View {
        self.environment(\.tagLimit, number)
    }
}

///
/// The generic tag control displays complementary information that relates to the current page
///
public struct Tag: View {
    @Environment(\.tagStyle) var tagStyle
    
    let content: Text

    /// Creates a tag view that displays a string literal without localization.
    ///
    /// Use this initializer to create a tag view with a string literal without
    /// performing localization:
    ///
    ///     Tag(verbatim: "pencil") // Displays the string "pencil" in any locale.
    ///
    /// If you want to localize a string literal before displaying it, use the
    /// ``Tag/init(_:tableName:bundle:comment:)`` initializer instead. If you
    /// want to display a string variable, use the ``Tag/init(_:)-9d1g4``
    /// initializer, which also bypasses localization.
    ///
    /// - Parameter content: A string to display without localization.
    public init(verbatim content: String) {
        self.content = Text(verbatim: content)
    }
    
    /// Creates a tag view that displays a stored string without localization.
    ///
    /// Use this initializer to create a tag view that displays — without
    /// localization — the tag in a string variable.
    ///
    ///     Tag(someString) // Displays the contents of `someString` without localization.
    ///
    /// SwiftUI doesn't call the `init(_:)` method when you initialize a tag
    /// view with a string literal as the input. Instead, a string literal
    /// triggers the ``Tag/init(_:tableName:bundle:comment:)`` method — which
    /// treats the input as a ``LocalizedStringKey`` instance — and attempts to
    /// perform localization.
    ///
    /// By default, SwiftUI assumes that you don't want to localize stored
    /// strings, but if you do, you can first create a localized string key from
    /// the value, and initialize the text view with that. Using a key as input
    /// triggers the ``Tag/init(_:tableName:bundle:comment:)`` method instead.
    ///
    /// - Parameter content: The string value to display without localization.
    public init<S>(_ content: S) where S: StringProtocol {
        self.content = Text(content)
    }
    
    public var body: some View {
        tagStyle.apply(TagStyleConfiguration(label: content))
    }
}

public extension Tag {
    /// Creates an instance that wraps an `Image`, suitable for concatenating
    /// with other `Text`
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    init(_ image: Image) {
        self.content = Text(image)
    }
}

public extension Tag {
    /// Creates a Tag view that displays localized content identified by a key.
    ///
    /// Use this initializer to look for the `key` parameter in a localization
    /// table and display the associated string value in the initialized text
    /// view. If the initializer can't find the key in the table, or if no table
    /// exists, the text view displays the string representation of the key
    /// instead.
    ///
    ///     Tag("pencil") // Localizes the key if possible, or displays "pencil" if not.
    ///
    /// When you initialize a text view with a string literal, the view triggers
    /// this initializer because it assumes you want the string localized, even
    /// when you don't explicitly specify a table, as in the above example. If
    /// you haven't provided localization for a particular string, you still get
    /// reasonable behavior, because the initializer displays the key, which
    /// typically contains the unlocalized string.
    ///
    /// If you initialize a text view with a string variable rather than a
    /// string literal, the view triggers the ``Text/init(_:)-9d1g4``
    /// initializer instead, because it assumes that you don't want localization
    /// in that case. If you do want to localize the value stored in a string
    /// variable, you can choose to call the `init(_:tableName:bundle:comment:)`
    /// initializer by first creating a ``LocalizedStringKey`` instance from the
    /// string variable:
    ///
    ///     Text(LocalizedStringKey(someString)) // Localizes the contents of `someString`.
    ///
    /// If you have a string literal that you don't want to localize, use the
    /// ``Text/init(verbatim:)`` initializer instead.
    ///
    /// - Parameters:
    ///   - key: The key for a string in the table identified by `tableName`.
    ///   - tableName: The name of the string table to search. If `nil`, use the
    ///     table in the `Localizable.strings` file.
    ///   - bundle: The bundle containing the strings file. If `nil`, use the
    ///     main bundle.
    ///   - comment: Contextual information about this key-value pair.
    init(_ key: LocalizedStringKey, tableName: String? = nil, bundle: Bundle? = nil, comment: StaticString? = nil) {
        self.content = Text(key, tableName: tableName, bundle: bundle, comment: comment)
    }
}

struct Tag_Previews: PreviewProvider {
    static var previews: some View {
        Tag("hello").tagStyle(DarkTagStyle())
    }
}
