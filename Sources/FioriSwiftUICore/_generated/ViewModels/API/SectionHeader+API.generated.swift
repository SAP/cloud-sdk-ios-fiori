// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct SectionHeader<Title: View, Attribute: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.attributeModifier) private var attributeModifier
    @Environment(\.colorScheme) var colorScheme
    
    private let _title: () -> Title
	private let _attribute: () -> Attribute

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute
        ) {
            self._title = title
			self._attribute = attribute
    }

    var title: some View {
        _title().modifier(titleModifier.concat(Fiori.SectionHeader.title))
    }
	var attribute: some View {
        _attribute().modifier(attributeModifier.concat(Fiori.SectionHeader.attribute))
    }
}

extension SectionHeader where Title == Text,
		Attribute == _ConditionalContent<Text, EmptyView> {
    
    public init(model: SectionHeaderModel) {
        self.init(title: model.title_, attribute: model.attribute_)
    }

    public init(title: String, attribute: String? = nil) {
        self._title = { Text(title) }
		self._attribute = { attribute != nil ? ViewBuilder.buildEither(first: Text(attribute!)) : ViewBuilder.buildEither(second: EmptyView()) }
    }
} 
