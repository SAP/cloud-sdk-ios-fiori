import Combine
import FioriSwiftUICore
import FioriThemeManager
import Foundation
import SwiftUI

struct AvatarStackExample: View {
    @StateObject var model = AvatarStackModel()
    
    @ViewBuilder var avatarStack: some View {
        AvatarStack {
            ForEach(0 ..< self.model.avatarsCount, id: \.self) { _ in
                Color.random
            }
        } avatarsTitle: {
            if self.model.title.isEmpty {
                EmptyView()
            } else {
                Text(self.model.title)
            }
        }
        .avatarsLayout(self.model.avatarsLayout)
        .isAvatarCircular(self.model.isCircular)
        .avatarsTitlePosition(self.model.titlePosition)
        .avatarsSpacing(self.model.spacing)
        .avatarsMaxCount(self.model.maxCount)
        .avatarsBorder(self.model.borderColor, width: self.model.borderWidth)
        .avatarSize(self.avatarSize)
    }
    
    var avatarSize: CGSize? {
        if let sideLength = model.sideLength {
            CGSize(width: sideLength, height: sideLength)
        } else {
            nil
        }
    }

    var body: some View {
        List {
            Section {
                self.avatarStack
            }
            
            Picker("Avatar Count", selection: self.$model.avatarsCount) {
                ForEach(0 ... 20, id: \.self) { number in
                    Text("\(number)").tag(number)
                }
            }
            TextField("Enter Title", text: self.$model.title)
            Toggle("isCircle", isOn: self.$model.isCircular)
            
            Picker("Avatars Layout", selection: self.$model.avatarsLayout) {
                Text("grouped").tag(AvatarStack.Layout.grouped)
                Text("horizontal").tag(AvatarStack.Layout.horizontal)
            }
            Picker("Title Position", selection: self.$model.titlePosition) {
                Text("leading").tag(AvatarStack.TextPosition.leading)
                Text("trailing").tag(AvatarStack.TextPosition.trailing)
                Text("top").tag(AvatarStack.TextPosition.top)
                Text("bottom").tag(AvatarStack.TextPosition.bottom)
            }
            
            Picker("Spacing (only work for horizontal avatars)", selection: self.$model.spacing) {
                ForEach([-4, -1, 0, 1, 4], id: \.self) { number in
                    Text("\(number)").tag(CGFloat(number))
                }
            }
            
            Picker("Max Count", selection: self.$model.maxCount) {
                Text("None").tag(nil as Int?)
                ForEach([2, 4, 8], id: \.self) { number in
                    Text("\(number)").tag(number as Int?)
                }
            }
            
            Picker("Side Length", selection: self.$model.sideLength) {
                Text("Default").tag(nil as CGFloat?)
                ForEach([10, 16, 20, 30, 40], id: \.self) { number in
                    Text("\(number)").tag(CGFloat(number) as CGFloat?)
                }
            }
            
            Picker("Border Width", selection: self.$model.borderWidth) {
                ForEach([0, 1, 2, 4], id: \.self) { number in
                    Text("\(number)").tag(CGFloat(number))
                }
            }
            
            ColorPicker(selection: self.$model.borderColor, supportsOpacity: false) {
                Text("Border Color")
            }
        }
    }
}

class AvatarStackModel: ObservableObject {
    @Published var avatarsCount: Int = 2
    @Published var title: String = "This is a text for avatar stack."
    @Published var isCircular: Bool = true
    @Published var avatarsLayout: AvatarStack.Layout = .grouped
    @Published var titlePosition: AvatarStack.TextPosition = .trailing
    @Published var spacing: CGFloat = -1
    @Published var maxCount: Int? = nil
    @Published var sideLength: CGFloat? = nil
    @Published var borderColor = Color.clear
    @Published var borderWidth: CGFloat = 1
}

#Preview {
    AvatarStackExample()
}
