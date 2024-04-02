// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct SectionHeader<Title: View, Attribute: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.attributeModifier) private var attributeModifier
	@Environment(\.colorScheme) var colorScheme

    let _title: Title
	let _attribute: Attribute
	
    private var isModelInit: Bool = false
	private var isAttributeNil: Bool = false

    public init(
        @ViewBuilder title: () -> Title,
		@ViewBuilder attribute: () -> Attribute
        ) {
            self._title = title()
			self._attribute = attribute()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.SectionHeader.title).concat(Fiori.SectionHeader.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.SectionHeader.title))
        }
    }
	@ViewBuilder var attribute: some View {
        if isModelInit {
            _attribute.modifier(attributeModifier.concat(Fiori.SectionHeader.attribute).concat(Fiori.SectionHeader.attributeCumulative))
        } else {
            _attribute.modifier(attributeModifier.concat(Fiori.SectionHeader.attribute))
        }
    }
    
	var isAttributeEmptyView: Bool {
        ((isModelInit && isAttributeNil) || Attribute.self == EmptyView.self) ? true : false
    }
}

extension SectionHeader where Title == Text,
		Attribute == _ConditionalContent<Text, EmptyView> {

    public init(model: SectionHeaderModel) {
        self.init(title: model.title, attribute: model.attribute)
    }

    public init(title: String, attribute: String? = nil) {
        self._title = Text(title)
		self._attribute = attribute != nil ? ViewBuilder.buildEither(first: Text(attribute!)) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isAttributeNil = attribute == nil ? true : false
    }
}
