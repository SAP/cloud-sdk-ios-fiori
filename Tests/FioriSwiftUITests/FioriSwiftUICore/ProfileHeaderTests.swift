@testable import FioriSwiftUICore
import SwiftUI
import ViewInspector
import XCTest

final class ProfileHeaderTests: XCTestCase {
    // MARK: - Initialization Tests
    
    func testProfileHeaderWithMinimalConfiguration() throws {
        // Given: A ProfileHeader with only required title
        let title = AttributedString("Test Title")
        
        // When: Creating the ProfileHeader
        let profileHeader = ProfileHeader(title: title)
        
        // Then: The component should be created successfully
        XCTAssertNotNil(profileHeader)
        XCTAssertEqual(profileHeader.animatable, false, "Default animatable should be false")
    }
    
    func testProfileHeaderWithFullConfiguration() throws {
        // Given: All configuration parameters
        let title = AttributedString("Test Title")
        let subtitle = AttributedString("Test Subtitle")
        let description = AttributedString("Test Description")
        let image = Image(systemName: "person.circle.fill")
        
        // When: Creating ProfileHeader with all parameters
        let profileHeader = ProfileHeader(
            detailImage: image,
            title: title,
            subtitle: subtitle,
            description: description,
            animatable: true
        ) {
            Text("Detail Content")
        }
        
        // Then: All properties should be set correctly
        XCTAssertNotNil(profileHeader)
        XCTAssertEqual(profileHeader.animatable, true)
    }
    
    func testProfileHeaderWithViewBuilders() throws {
        // Given: ViewBuilder-based initialization
        let profileHeader = ProfileHeader(
            detailImage: { Image(systemName: "person") },
            title: { Text("Custom Title") },
            subtitle: { Text("Custom Subtitle") },
            description: { Text("Custom Description") }
        ) {
            HStack {
                Button("Mail") {}
                Button("Message") {}
            }
        }
        
        // Then: Component should be created successfully
        XCTAssertNotNil(profileHeader)
    }
    
    func testProfileHeaderDefaultAnimatable() {
        // Given: ProfileHeader without specifying animatable
        let profileHeader = ProfileHeader(title: AttributedString("Title"))
        
        // Then: animatable should default to false
        XCTAssertEqual(profileHeader.animatable, false)
    }
    
    func testProfileHeaderWithAnimatable() {
        // Given: ProfileHeader with animatable set to true
        let profileHeader = ProfileHeader(
            title: AttributedString("Title"),
            animatable: true
        )
        
        // Then: animatable should be true
        XCTAssertEqual(profileHeader.animatable, true)
    }
    
    // MARK: - Configuration Tests
    
    func testProfileHeaderConfiguration() {
        // Given: A ProfileHeaderConfiguration
        let config = ProfileHeaderConfiguration(
            detailImage: ProfileHeaderConfiguration.DetailImage(Image(systemName: "person")),
            title: ProfileHeaderConfiguration.Title(Text("Title")),
            subtitle: ProfileHeaderConfiguration.Subtitle(Text("Subtitle")),
            description: ProfileHeaderConfiguration.Description(Text("Description")),
            animatable: true,
            detailContent: ProfileHeaderConfiguration.DetailContent(Text("Detail"))
        )
        
        // Then: Configuration should be set correctly
        XCTAssertEqual(config.animatable, true)
        XCTAssertEqual(config.componentIdentifier, "fiori_profileheader_component")
    }
    
    func testProfileHeaderFromConfiguration() {
        // Given: A configuration
        let config = ProfileHeaderConfiguration(
            detailImage: ProfileHeaderConfiguration.DetailImage(Image(systemName: "person")),
            title: ProfileHeaderConfiguration.Title(Text("Title")),
            subtitle: ProfileHeaderConfiguration.Subtitle(Text("Subtitle")),
            description: ProfileHeaderConfiguration.Description(Text("Description")),
            animatable: false,
            detailContent: ProfileHeaderConfiguration.DetailContent(EmptyView())
        )
        
        // When: Creating ProfileHeader from configuration
        let profileHeader = ProfileHeader(config)
        
        // Then: Properties should match configuration
        XCTAssertEqual(profileHeader.animatable, false)
    }
    
    // MARK: - Style Tests
    
    func testProfileHeaderBaseStyle() throws {
        // Given: A ProfileHeaderConfiguration
        let config = ProfileHeaderConfiguration(
            detailImage: ProfileHeaderConfiguration.DetailImage(Image(systemName: "person")),
            title: ProfileHeaderConfiguration.Title(Text("Test Title")),
            subtitle: ProfileHeaderConfiguration.Subtitle(Text("Test Subtitle")),
            description: ProfileHeaderConfiguration.Description(Text("Test Description")),
            animatable: false,
            detailContent: ProfileHeaderConfiguration.DetailContent(EmptyView())
        )
        
        // When: Creating view with base style
        let baseStyle = ProfileHeaderBaseStyle()
        let view = baseStyle.makeBody(config)
        
        // Then: View should be created successfully
        XCTAssertNotNil(view)
    }
    
    func testProfileHeaderCustomStyle() throws {
        // Given: A custom style
        struct CustomProfileHeaderStyle: ProfileHeaderStyle {
            func makeBody(_ configuration: ProfileHeaderConfiguration) -> some View {
                VStack {
                    configuration.title
                    configuration.subtitle
                    configuration.description
                }
            }
        }
        
        let config = ProfileHeaderConfiguration(
            detailImage: ProfileHeaderConfiguration.DetailImage(EmptyView()),
            title: ProfileHeaderConfiguration.Title(Text("Title")),
            subtitle: ProfileHeaderConfiguration.Subtitle(Text("Subtitle")),
            description: ProfileHeaderConfiguration.Description(Text("Description")),
            animatable: false,
            detailContent: ProfileHeaderConfiguration.DetailContent(EmptyView())
        )
        
        // When: Applying custom style
        let customStyle = CustomProfileHeaderStyle()
        let view = customStyle.makeBody(config)
        
        // Then: View should be created
        XCTAssertNotNil(view)
        
        // And: Should contain VStack
        let vstack = try view.inspect().find(ViewType.VStack.self)
        XCTAssertNotNil(vstack)
    }
    
    // MARK: - View Hierarchy Tests with ViewInspector
    
    func testProfileHeaderViewHierarchy() throws {
        // Given: ProfileHeader with all components
        let profileHeader = ProfileHeader(
            detailImage: Image(systemName: "person.circle"),
            title: AttributedString("Test Title"),
            subtitle: AttributedString("Test Subtitle"),
            description: AttributedString("Test Description")
        )
        
        // When: Inspecting the view
        let view = try profileHeader.inspect()
        
        // Then: View should exist
        XCTAssertNotNil(view)
    }
    
    func testProfileHeaderWithDetailContent() throws {
        // Given: ProfileHeader with detail content
        let profileHeader = ProfileHeader(
            title: AttributedString("Title")
        ) {
            HStack {
                Button("Mail") {}
                Button("Message") {}
                Button("Phone") {}
            }
        }
        
        // Then: Component should be created
        XCTAssertNotNil(profileHeader)
    }
    
    // MARK: - Component Identifier Tests
    
    func testProfileHeaderIdentifier() {
        // Given: ProfileHeader component
        let profileHeader = ProfileHeader(title: AttributedString("Title"))
        
        // Then: Identifier should match expected value
        XCTAssertEqual(profileHeader.componentIdentifier, ProfileHeader.identifier)
        XCTAssertEqual(ProfileHeader.identifier, "fiori_profileheader_component")
    }
    
    func testProfileHeaderCustomIdentifier() {
        // Given: ProfileHeader with custom identifier
        let customIdentifier = "custom_profile_header"
        let profileHeader = ProfileHeader(
            title: { Text("Title") },
            componentIdentifier: customIdentifier
        )
        
        // Then: Identifier should match custom value
        XCTAssertEqual(profileHeader.componentIdentifier, customIdentifier)
    }
    
    // MARK: - Empty View Tests
    
    func testProfileHeaderWithEmptyOptionalFields() {
        // Given: ProfileHeader with only required title
        let profileHeader = ProfileHeader(title: AttributedString("Title"))
        
        // Then: Component should be created successfully
        XCTAssertNotNil(profileHeader)
        XCTAssertEqual(profileHeader.animatable, false)
    }
    
    func testProfileHeaderWithNilOptionalFields() {
        // Given: ProfileHeader with nil optional fields
        let profileHeader = ProfileHeader(
            detailImage: nil,
            title: AttributedString("Title"),
            subtitle: nil,
            description: nil,
            animatable: false
        )
        
        // Then: Component should be created successfully
        XCTAssertNotNil(profileHeader)
    }
    
    // MARK: - AttributedString Tests
    
    func testProfileHeaderWithAttributedStrings() {
        // Given: AttributedStrings with formatting
        var title = AttributedString("Bold Title")
        title.font = .headline
        
        var subtitle = AttributedString("Italic Subtitle")
        subtitle.font = .subheadline
        
        var description = AttributedString("Description Text")
        description.font = .caption
        
        // When: Creating ProfileHeader
        let profileHeader = ProfileHeader(
            title: title,
            subtitle: subtitle,
            description: description
        )
        
        // Then: Component should be created
        XCTAssertNotNil(profileHeader)
    }
    
    // MARK: - Integration Tests
    
    func testProfileHeaderInScrollView() throws {
        // Given: ProfileHeader embedded in ScrollView
        struct TestView: View {
            var body: some View {
                ScrollView {
                    ProfileHeader(
                        detailImage: Image(systemName: "person"),
                        title: AttributedString("Profile"),
                        subtitle: AttributedString("Software Engineer"),
                        description: AttributedString("iOS Developer"),
                        animatable: true
                    )
                }
            }
        }
        
        let testView = TestView()
        
        // When: Inspecting the view
        let scrollView = try testView.inspect().find(ViewType.ScrollView.self)
        
        // Then: ScrollView should exist
        XCTAssertNotNil(scrollView)
    }
    
    func testProfileHeaderInLazyVStack() throws {
        // Given: ProfileHeader in LazyVStack (common usage pattern)
        struct TestView: View {
            var body: some View {
                ScrollView {
                    LazyVStack(pinnedViews: [.sectionHeaders]) {
                        Section {
                            ForEach(0 ..< 10) { item in
                                Text("Item \(item)")
                            }
                        } header: {
                            ProfileHeader(
                                title: AttributedString("Header"),
                                animatable: true
                            )
                        }
                    }
                }
            }
        }
        
        let testView = TestView()
        
        // When: Inspecting the view
        let scrollView = try testView.inspect().find(ViewType.ScrollView.self)
        
        // Then: ScrollView should exist
        XCTAssertNotNil(scrollView)
    }
    
    // MARK: - Configuration isDirectChild Tests
    
    func testConfigurationIsDirectChild() {
        // Given: A configuration
        let config = ProfileHeaderConfiguration(
            detailImage: ProfileHeaderConfiguration.DetailImage(EmptyView()),
            title: ProfileHeaderConfiguration.Title(Text("Title")),
            subtitle: ProfileHeaderConfiguration.Subtitle(EmptyView()),
            description: ProfileHeaderConfiguration.Description(EmptyView()),
            animatable: false,
            detailContent: ProfileHeaderConfiguration.DetailContent(EmptyView())
        )
        
        // When: Checking if identifier is direct child
        let isDirectChild = config.isDirectChild("fiori_profileheader_component")
        let isNotDirectChild = config.isDirectChild("other_component")
        
        // Then: Should correctly identify direct child
        XCTAssertTrue(isDirectChild)
        XCTAssertFalse(isNotDirectChild)
    }
}
