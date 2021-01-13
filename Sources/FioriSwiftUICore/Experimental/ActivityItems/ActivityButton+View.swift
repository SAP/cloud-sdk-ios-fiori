import SwiftUI

public struct ActivityButtonView: View {
    public var image: Image
    public var handle: () -> Void

    public init(image: Image, handle: @escaping () -> Void) {
        self.image = image
        self.handle = handle
    }

    public init(_ activity: ActivityItem, handle: @escaping () -> Void) {
        self.image = activity.icon
        self.handle = handle
    }

    public var body: some View {
        Button(action: handle) {
            Image(systemName: "mail")
        }.buttonStyle(ActivityButtonStyle())
    }
}

public struct ActivityButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.blue)
            .background(Color.green)
    }
}
