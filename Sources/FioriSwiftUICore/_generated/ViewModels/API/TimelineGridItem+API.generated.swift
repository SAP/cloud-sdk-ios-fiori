// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct TimelineGridItem<Title: View, Timestamp: View, Status: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.timestampModifier) private var timestampModifier
	@Environment(\.statusModifier) private var statusModifier

    private let _title: Title
	private let _timestamp: Timestamp
	private let _status: Status

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
            self._title = title()
			self._timestamp = timestamp()
			self._status = status()
    }

    var title: some View {
        _title.modifier(titleModifier.concat(Fiori.TimelineGridItem.title))
    }
	var timestamp: some View {
        _timestamp.modifier(timestampModifier.concat(Fiori.TimelineGridItem.timestamp))
    }
	var status: some View {
        _status.modifier(statusModifier.concat(Fiori.TimelineGridItem.status))
    }
}

extension TimelineGridItem where Title == Text,
		Timestamp == _ConditionalContent<Text, EmptyView>,
		Status == _ConditionalContent<Text, EmptyView> {
    
    public init(model: TimelineGridItemModel) {
        self.init(title: model.title_, timestamp: model.timestamp_, status: model.status_) 
    }

    public init(title: String, timestamp: String? = nil, status: String? = nil) {
        self._title = Text(title)
			self._timestamp = timestamp != nil ? ViewBuilder.buildEither(first: Text(timestamp!)) : ViewBuilder.buildEither(second: EmptyView())
			self._status = status != nil ? ViewBuilder.buildEither(first: Text(status!)) : ViewBuilder.buildEither(second: EmptyView()) 
    }
} 
