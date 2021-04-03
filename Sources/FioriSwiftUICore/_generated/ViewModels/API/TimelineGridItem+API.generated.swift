// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct TimelineGridItem<Title: View, Timestamp: View, Status: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.timestampModifier) private var timestampModifier
	@Environment(\.statusModifier) private var statusModifier

    private let _title: Title
	private let _timestamp: Timestamp
	private let _status: Status
	
    private var isModelInit: Bool = false
	private var isTimestampNil: Bool = false
	private var isStatusNil: Bool = false

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
            self._title = title()
			self._timestamp = timestamp()
			self._status = status()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.TimelineGridItem.title).concat(Fiori.TimelineGridItem.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.TimelineGridItem.title))
        }
    }
	@ViewBuilder var timestamp: some View {
        if isModelInit {
            _timestamp.modifier(timestampModifier.concat(Fiori.TimelineGridItem.timestamp).concat(Fiori.TimelineGridItem.timestampCumulative))
        } else {
            _timestamp.modifier(timestampModifier.concat(Fiori.TimelineGridItem.timestamp))
        }
    }
	@ViewBuilder var status: some View {
        if isModelInit {
            _status.modifier(statusModifier.concat(Fiori.TimelineGridItem.status).concat(Fiori.TimelineGridItem.statusCumulative))
        } else {
            _status.modifier(statusModifier.concat(Fiori.TimelineGridItem.status))
        }
    }
    
	var isTimestampEmptyView: Bool {
        ((isModelInit && isTimestampNil) || Timestamp.self == EmptyView.self) ? true : false
    }

	var isStatusEmptyView: Bool {
        ((isModelInit && isStatusNil) || Status.self == EmptyView.self) ? true : false
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

		isModelInit = true
		isTimestampNil = timestamp == nil ? true : false
		isStatusNil = status == nil ? true : false
    }
}
