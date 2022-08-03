import SwiftUI

@available(*, deprecated, message: "Module FioriIntegrationCards is deprecated and will be removed in a future major version")
public struct TimelineCardView: View {
    @ObservedObject public var model: TimelineCard
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView(model: model.header)
            Divider().accentColor(Color.primary)
                .padding([.bottom, .top])
            ForEach(model.content, id: \.self) { object in
                TimelineItemView(model: object, isLast: self.model.content.firstIndex(of: object) == self.model.content.count - 1)
            }
        }
        .padding(16)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.gray, lineWidth: 0.5)
        ).padding(16)
    }
    
    public init(model: TimelineCard) {
        self.model = model
    }
}
