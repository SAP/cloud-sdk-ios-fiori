import SwiftUI

struct SingleAvatar: View, AvatarList {
    var count: Int {
        self.isEmpty ? 0 : 1
    }
    
    func view(at index: Int) -> some View {
        self
    }
    
    @Environment(\.avatarBorderColor) var borderColor
    @Environment(\.avatarBorderWidth) var borderWidth
    @Environment(\.isAvatarCircular) var isCircular
    @Environment(\.avatarSize) var avatarSize
    @Environment(\.avatarsLayout) var layout
    
    var size: CGSize {
        if let size = avatarSize {
            return size
        } else {
            switch self.layout {
            case .grouped:
                return CGSize(width: 45, height: 45)
            case .horizontal:
                return CGSize(width: 16, height: 16)
            }
        }
    }
    
    let avatar: any View
    
    var body: some View {
        if self.isCircular {
            self.avatar.typeErased
                .frame(width: self.size.width, height: self.size.height)
                .clipShape(Capsule())
                .overlay {
                    Capsule()
                        .inset(by: self.borderWidth / 2.0)
                        .stroke(self.borderColor, lineWidth: self.borderWidth)
                }
        } else {
            self.avatar.typeErased
                .frame(width: self.size.width, height: self.size.height)
                .border(self.borderColor, width: self.borderWidth)
        }
    }
}

struct AvatarListView<T: AvatarList>: View {
    @Environment(\.avatarsLayout) var layout
    @Environment(\.avatarsMaxCount) var maxCount
    @Environment(\.avatarsSpacing) var spacing
    @Environment(\.avatarSize) var avatarSize
    let avatars: T
    
    var size: CGSize {
        if let size = avatarSize {
            return size
        } else {
            switch self.layout {
            case .grouped:
                return CGSize(width: 45, height: 45)
            case .horizontal:
                return CGSize(width: 16, height: 16)
            }
        }
    }
    
    var count: Int {
        self.avatars.count
    }
    
    // This condition check if for handle recursive builder issue.
    private func checkIfIsNestingAvatars() -> Bool {
        if self.count == 1 {
            let typeString = String(describing: avatars.view(at: 0).self)
            return typeString.contains("AvatarsListStack")
        } else {
            return false
        }
    }
    
    /// :nodoc:
    var body: some View {
        if self.count == 0 {
            EmptyView()
        } else if self.count == 1, self.checkIfIsNestingAvatars() {
            self.avatars.view(at: 0)
        } else {
            self.buildAvatars()
        }
    }
    
    @ViewBuilder func buildAvatars() -> some View {
        switch self.layout {
        case .grouped:
            // Currently group avatars support 2 avatars default.
            let count = min(avatars.count, self.maxCount ?? 2)
            if count > 1 {
                ZStack(alignment: .topLeading) {
                    ForEach(0 ..< count, id: \.self) { index in
                        let position = CGPoint(x: CGFloat(index + 1) * self.size.width / 2,
                                               y: CGFloat(index + 1) * self.size.height / 2)
                        SingleAvatar(avatar: self.avatars.view(at: index))
                            .position(position)
                    }
                }
                .frame(width: self.size.width * (1 + CGFloat(count - 1) * 0.5),
                       height: self.size.height * (1 + CGFloat(count - 1) * 0.5))
            } else if count == 1 {
                SingleAvatar(avatar: self.avatars.view(at: 0))
            } else {
                EmptyView()
            }
        case .horizontal:
            HorizontalIconsHStack(spacing: self.spacing) {
                let validMaxCount = self.maxCount ?? 0
                let itemsCount = validMaxCount <= 0 ? self.count : min(self.count, validMaxCount)
                ForEach(0 ..< itemsCount, id: \.self) { index in
                    SingleAvatar(avatar: self.avatars.view(at: index))
                }
            }
        }
    }
}
