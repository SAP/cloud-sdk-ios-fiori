# Concepts and Proposals

## Styleable Component

*Doc in progress*

## Initialization patterns

A UI component has two types of initializers

- ResultBuilder (e.g. ViewBuilder) based initializer
- Type-based initializer

### ResultBuilder based initializer

ResultBuilder based initializers allow app developers to create components from closures. It provides great flexibity when app developers want to fully control the appearance of each field of the component. For example, a title field can also be an image.

```swift
/// A view that displays information of an object.
public struct ObjectItem {
    let title: any View
    let subtitle: any View
    let footnote: any View
    let description: any View
    let status: any View
    let substatus: any View
    let detailImage: any View
    let icons: any View
    let avatars: any View
    let footnoteIcons: any View
    let tags: any View
    let action: any View

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
        self.title = Title { title() }
        self.subtitle = Subtitle { subtitle() }
        self.footnote = Footnote { footnote() }
        self.description = Description { description() }
        self.status = Status { status() }
        self.substatus = Substatus { substatus() }
        self.detailImage = DetailImage { detailImage() }
        self.icons = Icons { icons() }
        self.avatars = Avatars { avatars() }
        self.footnoteIcons = FootnoteIcons { footnoteIcons() }
        self.tags = Tags { tags() }
        self.action = Action { action() }
    }
}
```

Usage

```swift
ObjectItem(title: {
    Text("Rouja Pakiman")
}, description: {
    Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
}, status: {
    Text("Available")
}, detailImage: {
    Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
})
```

### Type based initializer

Type based initializers allow for easy data binding. It is useful when app developers need to create the component from data model and want to adopt the default styles from SDK.

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
        self.init(title: { Text(title) }, subtitle: { OptionalText(subtitle) }, footnote: { OptionalText(footnote) }, description: { OptionalText(description) }, status: { TextOrIconView(status) }, substatus: { TextOrIconView(substatus) }, detailImage: { detailImage }, icons: { IconStack(icons) }, avatars: { AvatarStack(avatars) }, footnoteIcons: { FootnoteIconStack(footnoteIcons) }, tags: { TagStack(tags) }, action: { action })
    }
}
```

Usage

```swift
ObjectItem(title: "Transformer Overheating When After Being on for 1 Hour or Longer",
            subtitle: "Three Phase Pad Mounted Transformer (533423)", footnote: "1000 - Hamburg, MECHANIK",
            description: "Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.",
            status: TextOrIcon.text("High"),
            detailImage: Image(systemName: "person"),
            icons: [TextOrIcon.text("1"),
                    TextOrIcon.icon(Image(systemName: "circle.fill")),
                    TextOrIcon.icon(Image(systemName: "mail"))]
        )
```

## Collection containers (Experimental)

A layout collection container shall provide option to style / handle individual elements and could be used directly by an app developer

```swift
// pro: can work with any view
// pro: allow individual styling
KPILayoutContainer(data, id: \.title_) {
    element in
    KPI {
        Text(element.title_)
    }

    icon: {
        if element.icon_ != nil {
            element.icon_!
        }
        else {
            EmptyView()
        }
    }

}
// pro: can restrict number of elements (i.e. only two KPIs will be shown even more were specified)
KPILayoutContainer(0..<6, id: \.self) {
    index in
    KPI {
        Text("\(index)")
    }

    icon: {
        EmptyView()
    }

}
```

A business semantic collection container can be simpler

```swift
// pro: don't have to work with KPI view
// con: no individual styling possible
KPIHeaderControl(data, id: \.title_).titleModifier({
    $0.font(.headline).foregroundColor(.red)
})
```

# Examples

The [Example application](./Apps/Examples/Examples/FioriSwiftUICore/Experimental) contains established concept proposals like

- Theming
- State Handling

but also contains experimental controls (new or existing ones modified) and their usage. Example: KPI Header (as semantic collection container) vs. layout collection container

<img width="1255" alt="KPIHeaderVsLayoutContainer" src="https://user-images.githubusercontent.com/4176826/104635511-da06ff80-5656-11eb-9005-dc20a34106bf.png">
