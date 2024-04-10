# Component Generation

Not relevant for app developers ("Consumers"). The following information are relevant for SDK maintainers and contributors in order to add new components.

To ensure API consistency and avoid writing boilerplate code, we use [Sourcery](https://github.com/krzysztofzablocki/Sourcery) to generate code for our components. Run `sourcery/GenerateComponent.sh` to start the generation process.

The output of the generation is at `Sources/FioriSwiftUICore/_generated`, and should be checked into source control.

- `StyleableComponents` folder contains component and corresponding style definitions. Do not modify these files.
- `FioriStyleTemplates` folder contains templates for providing SDK default styles for each component. SDK developers should modify these files and implement style logic based on the design spec.
- `SupportingFiles` folder contains other definitions that are used to support the overall architecture.

## Example Component Declaration

### Base Component

Base components are basic building blocks that can be reused to build more complex UI components. They usually have very simple declarations such as `_TitleComponent`. You add the declaration in [BaseComponentProtocols.swift](Sources/FioriSwiftUICore/_ComponentProtocols/BaseComponentProtocols.swift)

```swift
// sourcery: BaseComponent
protocol _TitleComponent {
    // sourcery: @ViewBuilder
    var title: AttributedString { get }
}
```

`Title` component has only one property `var title: AttributedString` which represents the title section of a component. Sourcery annotation `sourcery: BaseComponent` tells Sourcery to treat this component as a base component when generating the component definition. Annotation `sourcery: @ViewBuilder` specifies the title can also be created by a view builder in addition to its primitive type `AttributedString`.

After these base components are properly defined, you can combine them in different ways to build more complex UI components. 

### Composite Component

Composite components are complex UI components that consist of multiple base components or other composite components. You declare a composite component in [CompositeComponentProtocols.swift](Sources/FioriSwiftUICore/_ComponentProtocols/CompositeComponentProtocols.swift). Let's take `ObjectItem` as an example.

```swift
/// A view that displays information of an object.
// sourcery: CompositeComponent
protocol _ObjectItemComponent: _TitleComponent, _SubtitleComponent, _FootnoteComponent, _DescriptionComponent, _StatusComponent, _SubstatusComponent, _DetailImageComponent, _IconsComponent, _AvatarsComponent, _FootnoteIconsComponent, _TagsComponent, _ActionComponent {}
```

`ObjectItem` components gets all the properties it needs to support by conforming to those base component protocols. Annotation `sourcery: CompositeComponent` tells Sourcery to treat this component as a composite component when generating the component definition. You can add header doc to this component by adding documentation comments above the component protocol declaration. After code generation, the same documentation will be added to the component definition.

```swift
/// A view that displays information of an object.
public struct ObjectItem {
    // ... 
}
```

As a result of code generation, you will find the following files created:

- [Sources/FioriSwiftUICore/_generated/StyleableComponents/ObjectItem/ObjectItem.generated.swift](Sources/FioriSwiftUICore/_generated/StyleableComponents/ObjectItem/ObjectItem.generated.swift)

This file provides the component definition. Typically an UI component contains two initializers, one with `@ViewBuilder` parameters which gives developers great flexibility for controlling the appearance of each data field. 

```swift
public struct ObjectItem {
    // ...

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @ViewBuilder footnote: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() },
                @ViewBuilder status: () -> any View = { EmptyView() },
                @ViewBuilder substatus: () -> any View = { EmptyView() },
                @ViewBuilder detailImage: () -> any View = { EmptyView() },
                @IconBuilder icons: () -> any View = { EmptyView() },
                @AvatarsBuilder avatars: () -> any View = { EmptyView() },
                @FootnoteIconsBuilder footnoteIcons: () -> any View = { EmptyView() },
                @TagBuilder tags: () -> any View = { EmptyView() },
                @ViewBuilder action: () -> any View = { EmptyView() })
    {
        // ...
    }
```

The other one comes with parameters of primitive data types. It allows for easy data binding.

```swift
public extension ObjectItem {
    init(title: AttributedString,
         subtitle: AttributedString? = nil,
         footnote: AttributedString? = nil,
         description: AttributedString? = nil,
         status: TextOrIcon? = nil,
         substatus: TextOrIcon? = nil,
         detailImage: Image? = nil,
         icons: [TextOrIcon] = [],
         avatars: [TextOrIcon] = [],
         footnoteIcons: [TextOrIcon] = [],
         tags: [AttributedString] = [],
         action: FioriButton? = nil)
    {
        // ...
    }
}
```

- [Sources/FioriSwiftUICore/_generated/StyleableComponents/ObjectItem/ObjectItemStyle.generated.swift](Sources/FioriSwiftUICore/_generated/StyleableComponents/ObjectItem/ObjectItemStyle.generated.swift)

This file contains component specific style protocol declaration and style configuration definition. You can provide custom style implementations to totally change the appearance of the component.

```swift
// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol ObjectItemStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ObjectItemConfiguration) -> Body
}

struct AnyObjectItemStyle: ObjectItemStyle {
    let content: (ObjectItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ObjectItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ObjectItemConfiguration {
    public let title: Title
    public let subtitle: Subtitle
    public let footnote: Footnote
    public let description: Description
    public let status: Status
    public let substatus: Substatus
    public let detailImage: DetailImage
    public let icons: Icons
    public let avatars: Avatars
    public let footnoteIcons: FootnoteIcons
    public let tags: Tags
    public let action: Action

    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias Footnote = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
    public typealias Status = ConfigurationViewWrapper
    public typealias Substatus = ConfigurationViewWrapper
    public typealias DetailImage = ConfigurationViewWrapper
    public typealias Icons = ConfigurationViewWrapper
    public typealias Avatars = ConfigurationViewWrapper
    public typealias FootnoteIcons = ConfigurationViewWrapper
    public typealias Tags = ConfigurationViewWrapper
    public typealias Action = ConfigurationViewWrapper
```

- [Sources/FioriSwiftUICore/_generated/FioriStyleTemplates/ObjectItemStyle.fiori.generated.swift](Sources/FioriSwiftUICore/_generated/FioriStyleTemplates/ObjectItemStyle.fiori.generated.swift)

This is a template file that defines entry point for implementing default layout and styles for this component in SDK. SDK developers should uncomment the code in this file first and move this file from [_generated/FioriStyleTemplates](Sources/FioriSwiftUICore/_generated/FioriStyleTemplates) folder to [_FioriStyles](Sources/FioriSwiftUICore/_FioriStyles) once the implementation is completed. 

Default layout implementation should go into `BaseStyle`.

```swift
// Base Layout style
public struct ObjectItemBaseStyle: ObjectItemStyle {
    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        // Add default layout here
        //        VStack {
        //            configuration.title
        //            configuration.subtitle
        //            configuration.footnote
        //            configuration.description
        //            configuration.status
        //            configuration.substatus
        //            configuration.detailImage
        //            configuration.icons
        //            configuration.avatars
        //            configuration.footnoteIcons
        //            configuration.tags
        //            configuration.action
        //        }
    }
}
```

Default styles should be provided in `FioriStyle`.

```swift
// Default fiori styles
extension ObjectItemFioriStyle {
    struct ContentFioriStyle: ObjectItemStyle {
        func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
            ObjectItem(configuration)
            // Add default style for its content
            //.background()
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
            // Add default style for Title
            //.foregroundStyle(Color.preferredColor(<#fiori color#>))
            //.font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct SubtitleFioriStyle: SubtitleStyle {
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
            // Add default style for Subtitle
            //.foregroundStyle(Color.preferredColor(<#fiori color#>))
            //.font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct FootnoteFioriStyle: FootnoteStyle {
        func makeBody(_ configuration: FootnoteConfiguration) -> some View {
            Footnote(configuration)
            // Add default style for Footnote
            //.foregroundStyle(Color.preferredColor(<#fiori color#>))
            //.font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct DescriptionFioriStyle: DescriptionStyle {
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
            // Add default style for Description
            //.foregroundStyle(Color.preferredColor(<#fiori color#>))
            //.font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct StatusFioriStyle: StatusStyle {
        func makeBody(_ configuration: StatusConfiguration) -> some View {
            Status(configuration)
            // Add default style for Status
            //.foregroundStyle(Color.preferredColor(<#fiori color#>))
            //.font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct SubstatusFioriStyle: SubstatusStyle {
        func makeBody(_ configuration: SubstatusConfiguration) -> some View {
            Substatus(configuration)
            // Add default style for Substatus
            //.foregroundStyle(Color.preferredColor(<#fiori color#>))
            //.font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct DetailImageFioriStyle: DetailImageStyle {
        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
            // Add default style for DetailImage
            //.foregroundStyle(Color.preferredColor(<#fiori color#>))
            //.font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct IconsFioriStyle: IconsStyle {
        func makeBody(_ configuration: IconsConfiguration) -> some View {
            Icons(configuration)
            // Add default style for Icons
            //.foregroundStyle(Color.preferredColor(<#fiori color#>))
            //.font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct AvatarsFioriStyle: AvatarsStyle {
        func makeBody(_ configuration: AvatarsConfiguration) -> some View {
            Avatars(configuration)
            // Add default style for Avatars
            //.foregroundStyle(Color.preferredColor(<#fiori color#>))
            //.font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct FootnoteIconsFioriStyle: FootnoteIconsStyle {
        func makeBody(_ configuration: FootnoteIconsConfiguration) -> some View {
            FootnoteIcons(configuration)
            // Add default style for FootnoteIcons
            //.foregroundStyle(Color.preferredColor(<#fiori color#>))
            //.font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct TagsFioriStyle: TagsStyle {
        func makeBody(_ configuration: TagsConfiguration) -> some View {
            Tags(configuration)
            // Add default style for Tags
            //.foregroundStyle(Color.preferredColor(<#fiori color#>))
            //.font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct ActionFioriStyle: ActionStyle {
        func makeBody(_ configuration: ActionConfiguration) -> some View {
            Action(configuration)
            // Add default style for Action
            //.foregroundStyle(Color.preferredColor(<#fiori color#>))
            //.font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
}
```

You can provide other SDK pre-defined styles in this file as well.

```swift
/// Card style
public struct ObjectItemCardStyle: ObjectItemStyle {
    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(.secondary)
            }
    }
}

public extension ObjectItemStyle where Self == ObjectItemCardStyle {
    static var card: Self {
        ObjectItemCardStyle()
    }
}
```

## Supported Sourcery Annotations

### Define a base component or composite component

Declare [BaseComponent](#base-component) with annotation `// sourcery: BaseComponent`

Declare [CompositeComponent](#composite-component) with annotation `// sourcery: CompositeComponent`

### Define an internal component

In order to create a component to be used internally in SDK, use `// sourcery: InternalComponent`. The generated component will have access level of internal.

### Initialize a component with `resultBuilder`

SDK provides two methods for initializing a UI component. One initializer comes with `resultBuilder` parameters. The other one has parameters with data types. 

When you declare a component property, you first declare it as a data type. Then use sourcery annotation to specify the resultBuilder for it. 

Use `// sourcery: resultBuilder.name` to provide the name of the resultBuilder and `// sourcery: resultBuilder.backingComponent` to specify the type of the component that could represent the data.

```swift
// sourcery: BaseComponent
protocol _TagsComponent {
    // sourcery: resultBuilder.name = @TagBuilder, resultBuilder.backingComponent = TagStack
    var tags: [AttributedString] { get }
}
```

Generated code

```swift
public struct Tags {
    let tags: any View

    public init(@TagBuilder tags: () -> any View = { EmptyView() }) {
        self.tags = tags()
    }
}

public extension Tags {
    init(tags: [AttributedString] = []) {
        // TagStack is the view representation of tags
        self.init(tags: { TagStack(tags) })
    }
}
```

You can change the return type of the resultBuilder using `// sourcery: resultBuilder.returnType`. 

Use `// sourcery: resultBuilder.defaultValue` to provide default value for the resultBuilder.

```swift
// sourcery: BaseComponent
protocol _TagsComponent {
    // sourcery: resultBuilder.name = @TagBuilder, resultBuilder.backingComponent = TagStack, resultBuilder.returnType = MyCustomType, resultBuilder.defaultValue = { Text("Tag 1") }
    var tags: [AttributedString] { get }
}
```

Generated code

```swift
public struct Tags {
    let tags: any View

    public init(@TagBuilder tags: () -> MyCustomType = { Text("Tag 1") }) {
        self.tags = tags()
    }
}
```

To make a property a `ViewBuilder`, use `// sourcery: @ViewBuilder`. This is an equivalent of `// sourcery: resultBuilder.name = @ViewBuilder, resultBuilder.backingComponent = Text`

```swift
// sourcery: BaseComponent
protocol _TitleComponent {
    // sourcery: @ViewBuilder
    var title: AttributedString { get }
}
```

Generated code

```swift
public struct Title {
    let title: any View

    public init(@ViewBuilder title: () -> any View) {
        self.title = title()
    }
}

public extension Title {
    init(title: AttributedString) {
        self.init(title: { Text(title) })
    }
}
```

In cases where a component property is a ViewBuilder without a associated data type, declare the property with `@ViewBuilder` attribute directly.

```swift
// sourcery: BaseComponent
protocol _TitleComponent {
    // sourcery: @ViewBuilder
    var title: AttributedString { get }
}

// sourcery: BaseComponent
protocol _CardBodyComponent {
    @ViewBuilder
    var cardBody: (() -> any View)? { get }
}

// sourcery: CompositeComponent
protocol _CardComponent: _TitleComponent, _CardBodyComponent {}
```

Generated code

```swift
public struct Card {
    public init(@ViewBuilder title: () -> any View, 
                @ViewBuilder cardBody: () -> any View = { EmptyView() })
    {
        self.title = Title { title() }
        self.cardBody = CardBody { cardBody() }
    }
}

public extension Card {
    init(title: AttributedString, 
        @ViewBuilder cardBody: () -> any View = { EmptyView() }) 
    {
        self.init(title: { Text(title) }, cardBody: cardBody)
    }
}
```

### Component property which is editable

Use [Binding](https://developer.apple.com/documentation/swiftui/binding) to connect the data storage and the view that displays and modifies the data.

Apply annotation `// sourcery: @Binding` to an editable property.

```swift
// sourcery: BaseComponent
protocol _TextViewComponent {
    // sourcery: @Binding
    var text: String { get }
}
```

Generated code

```swift
public struct TextView {
    @Binding var text: String

    public init(text: Binding<String>) {
        self._text = text
    }
}
```

### Set default value for a property

Use sourcery annotation `// sourcery: defaultValue` to provide a default value for a component property. 

If the default value is a string literal, add double double-quotation marks (`""value""`) around the value.

```swift
// sourcery: CompositeComponent
protocol _MyCustomControlComponent {
    // sourcery: defaultValue = .normal
    var controlState: ControlState { get }
    // sourcery: defaultValue = ""This is an error""
    var errorMessage: AttributedString? { get }
}
```

Generated code

```swift
public struct MyCustomControl {
    let controlState: ControlState
    let errorMessage: AttributedString?

    public init(controlState: ControlState = .normal,
                errorMessage: AttributedString? = "This is an error")
    {
        self.controlState = controlState
        self.errorMessage = errorMessage
    }
}
```

## Next Steps

For now, feel free to prototype with this pattern to add & modify your own controls, and propose enhancements or changes in the Issues tab.

## Future Improvements
