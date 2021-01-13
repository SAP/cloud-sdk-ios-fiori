import SwiftUI

extension ActivityItems: View {
    public var body: some View {
        ActivityControlLayoutContainer(model.activityItems_) { activity in
            ActivityButtonView(image: activity.icon) {
                model.didSelect(activity)
            }
        }
    }
}
