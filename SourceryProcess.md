# Sourcery Process 


### Step 1
Run `setupForCollaborators.sh` to install Sourcery, SwiftFormat, SwiftLint, and other tools.

### Step 2
Using `SegmentedControlPicker` as an example, start with a basic SwiftUI implementation.

```swift
var options: [AttributedString] = ["Segment 1", "Segment 2", "Segment 3"]
@State var selectedIndex: Int = 0

var body: some View {
  Picker("", selection: self.$selectedIndex) {
                 ForEach(0 ..< options.count, id: \.self, content: { index in
                    Text(options[index])
                 })
  }
  .pickerStyle(.segmented)
}
```

### Step 3
Break down the implementation into base components containing one property each, and a composite component containing base components. Include the new components in `BaseComponentProtocols` and `CompositeComponentProtocols`.

In `BaseComponentProtocols`, create `OptionsComponent` to hold the array needed for the Picker values.

```swift
// sourcery: BaseComponent
protocol _OptionsComponent {
	var options: [AttributedString] { get }
}
```

In `CompositeComponentProtocols`, create `SegmentedControlPickerComponent`, made up of the `Options` base component and another property to store the Picker's selected index.

```swift
// sourcery: CompositeComponent
protocol _SegmentedControlPickerComponent: _OptionsComponent {
    	// sourcery: @Binding
    	/// The selected value index of the Picker
    	var selectedIndex: Int { get }
}
```

Reminders:
- Before creating new base components, see if any existing components can be reused
- Include thorough documentation and code usage
- Make use of sourcery tags when needed

### Step 4
Run `sourcery/GenerateComponent.sh` to generate the components.

### Step 5
Move the newly generated style files from `_generated/FioriStyleTemplates` to `_FioriStyles` and remove `.generated` from the file names. Then, implement the base layout in `BaseStyle` and Fiori styling in `FioriStyle`. 
The other generated files should not be edited, only the style files.

In `SegmentedControlPickerStyle.fiori.swift`, add a modified implementation from Step 2 into the `BaseStyle`, accessing the component properties through the configuration. 

```swift
// Base Layout style
public struct SegmentedControlPickerBaseStyle: SegmentedControlPickerStyle {
    public func makeBody(_ configuration: SegmentedControlPickerConfiguration) -> some View {
        Picker("", selection: configuration.$selectedIndex) {
            ForEach(0 ..< configuration.options.count, id: \.self, content: { index in
                Text(configuration.options[index])
            })
        }
        .pickerStyle(.segmented)
    }
}
```

Then in `FioriStyle`, add the default Fiori style including colors, fonts, and border.

```swift
// Default fiori styles
extension SegmentedControlPickerFioriStyle {
    struct ContentFioriStyle: SegmentedControlPickerStyle {
        func makeBody(_ configuration: SegmentedControlPickerConfiguration) -> some View {
            let appearance = UISegmentedControl.appearance()
            appearance.selectedSegmentTintColor = Color.preferredColor(.primaryBackground).uiColor()
            appearance.backgroundColor = Color.preferredColor(.tertiaryFill).uiColor()
            appearance.setTitleTextAttributes([.foregroundColor: Color.preferredColor(.primaryLabel).uiColor(), .font: UIFont.preferredFioriFont(forTextStyle: .footnote, weight: .semibold)], for: .selected)
            appearance.setTitleTextAttributes([.foregroundColor: Color.preferredColor(.primaryLabel).uiColor(), .font: UIFont.preferredFioriFont(forTextStyle: .footnote)], for: .normal)
            
            return SegmentedControlPicker(configuration)
                .overlay(
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(Color.preferredColor(.separatorOpaque), lineWidth: 0.33)
                )
                .padding()
        }
    }
    
    struct OptionsFioriStyle: OptionsStyle {
        let segmentedControlPickerConfiguration: SegmentedControlPickerConfiguration
        
        func makeBody(_ configuration: OptionsConfiguration) -> some View {
            Options(configuration)
        }
    }
}
```

### Step 6
Create test cases in the corresponding folder under `Examples/FioriSwiftUICore`. Add the new test cases in `CoreContentView` to include them in the Examples test app.


### For more details: 
- [CoreComponentGeneration](https://github.com/SAP/cloud-sdk-ios-fiori/blob/main/CoreComponentGeneration.md)
- [CONTRIBUTING](https://github.com/SAP/cloud-sdk-ios-fiori/blob/main/CONTRIBUTING.md)