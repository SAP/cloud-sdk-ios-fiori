# Concepts and Proposals

## ViewModel initializers

A control has up to three types of initializers (with multiple conditional implementations)
- @ViewBuilder based initializer
- Type-based initializer (e.g. passing `String` for title, `[ActivityItem]` for actionItems or `(ActivityItem) -> Void` as action handler)
- Protocol-based initializer (i.e. passing a model conforming to model protocol(s), for example `ContactItemModel`)

### @ViewBuilder based initializer

@ViewBuilder based initializers allow app developers to use any control(s), e.g. title can be an image

API:

```swift
public struct ContactItem<Title: View, Subtitle: View, DescriptionText: View, DetailImage: View, ActionItems: View> {

    let _title: Title
	let _subtitle: Subtitle
	let _descriptionText: DescriptionText
	let _detailImage: DetailImage
	let _actionItems: ActionItems

    public init(
        @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder actionItems: () -> ActionItems
        ) {
            self._title = title()
			self._subtitle = subtitle()
			self._descriptionText = descriptionText()
			self._detailImage = detailImage()
			self._actionItems = actionItems()
    }
}
```

Usage:

```swift
ContactItem {
    Image(systemName: "square.and.pencil") // not a text
}
subtitle: {
    Text("SubTitle")
}
footnote: {
    Text("Footnote")
}
descriptionText: {
    Text("Description")
}
detailImage: {
    Text("Not a detailed image :)")
}
actionItems: {
    HStack {
        EmailButtonView() {
            print("emailPressed handled in action of button passed to control")
        }
    }
}
```

### Default SDK controls when using type-based / protocol-based initializer

Any @ViewBuilder init argument should be backed by a default SDK control when the app developers users either type-based or protocol-based initializer.

API:

```swift
extension ContactItem where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		DetailImage == _ConditionalContent<Image, EmptyView>,
		ActionItems == _ConditionalContent<ActivityItems, EmptyView> {

    public init(model: ContactItemModel) {
        self.init(title: model.title, subtitle: model.subtitle, descriptionText: model.descriptionText, detailImage: model.detailImage, actionItems: model.actionItems != nil ? ActivityItems(model: model.actionItems!) : nil)
    }

    public init(title: String, subtitle: String? = nil, descriptionText: String? = nil, detailImage: Image? = nil, actionItems: ActivityItems? = nil) {
        self._title = Text(title)
		self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._detailImage = detailImage != nil ? ViewBuilder.buildEither(first: detailImage!) : ViewBuilder.buildEither(second: EmptyView())
		self._actionItems = actionItems != nil ? ViewBuilder.buildEither(first: actionItems!) : ViewBuilder.buildEither(second: EmptyView())
    }
}

```

Here is an example of using a composite control (`ActivityItems`) within a control (`ContactItem`)

```swift
ContactItem(title: "aString", actionItems: ActionItems(actionItems: [.init(type: .email, data: "address@gmail.com")], didSelectActivityItem: { selectedActionItem in
    print(selectedActionItem)
}))
```

Note: An app developer can conform the data model to the ViewModel protocol but it is more likely that the app developer prefers to back this with a custom view model or even prefers the @ViewBuilder based initializer overall (to interact with local view state easily). 

## Conditional Initializers

 A container / control shall support optionality, e.g. activityItems @ViewBuilder property does not need to be supplied by an app developer). This can be archived by conditional initializers on the extension of container/control. Sourcery-based code generation already supports this, see ContactItem+Init.generated.swift as example of such output

API: 

```swift
extension ContactItem where ActionItems == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder descriptionText: @escaping () -> DescriptionText,
        @ViewBuilder detailImage: @escaping () -> DetailImage)
    {
        self.init(
            title: title,
            subtitle: subtitle,
            footnote: footnote,
            descriptionText: descriptionText,
            detailImage: detailImage,
            email: email,
            actionItems: {
                EmptyView()
            })
    }
}
```

Usage:

```swift
ContactItem {
    Image(systemName: "square.and.pencil")
}
subtitle: {
    Text("SubTitle")
}
footnote: {
    Text("Footnote")
}
descriptionText: {
    Text("Description")
}
detailImage: {
    Text("Not a detailed image :)")
}
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
