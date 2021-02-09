import SwiftUI

extension ActivityItemsCustom: View {
    public var body: some View {
        ActivityControlLayoutContainer(activityItems) { activity in
            ActivityButtonView(image: activity.icon) {
                if let actionHandler = actionHandler {
                    actionHandler(activity)
                }
            }
        }
    }
}
