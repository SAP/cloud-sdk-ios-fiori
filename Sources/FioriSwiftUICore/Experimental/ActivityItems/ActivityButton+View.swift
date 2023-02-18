import SwiftUI

public struct ActivityButtonView: View {
    public var image: Image
    public var handle: () -> Void

    public init(image: Image, handle: @escaping () -> Void) {
        self.image = image
        self.handle = handle
    }

    public init(_ activity: ActivityItemDataType, handle: @escaping () -> Void) {
        self.image = activity.icon
        self.handle = handle
    }

    public var body: some View {
        Button(action: handle) {
            image
                .font(.fiori(forTextStyle: .body).weight(.light))
                .imageScale(.large)
                .foregroundColor(.preferredColor(.tintColor))
                .frame(width: 44, height: 44, alignment: .center)
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}

public struct ActivityButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.preferredColor(.tintColor))
    }
}
