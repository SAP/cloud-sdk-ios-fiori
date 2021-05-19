// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct SideBarListSectionHeader<Title: View> {
    @Environment(\.titleModifier) private var titleModifier

    let _title: Title
	
    private var isModelInit: Bool = false
	

    public init(
        @ViewBuilder title: @escaping () -> Title
        ) {
            self._title = title()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.SideBarListSectionHeader.title).concat(Fiori.SideBarListSectionHeader.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.SideBarListSectionHeader.title))
        }
    }
    
	
}

extension SideBarListSectionHeader where Title == Text {

    public init(model: SideBarListSectionHeaderModel) {
        self.init(title: model.title_)
    }

    public init(title: String) {
        self._title = Text(title)

		isModelInit = true
		
    }
}
