import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *)
@available(visionOS, unavailable)
struct FioriCustomizeGlassButtonStyle: FioriButtonStyle {
    private let maxWidth: CGFloat?
    private let minHeight: CGFloat?
    private let glassEffectTintColor: Color?
    
    init(maxWidth: CGFloat? = nil, minHeight: CGFloat? = nil, glassEffectTintColor: Color = .red) {
        self.maxWidth = maxWidth
        self.minHeight = minHeight
        self.glassEffectTintColor = glassEffectTintColor
    }
    
    func makeBody(configuration: FioriButtonStyle.Configuration) -> some View {
        let foregroundColor: Color = .white
        return self.containerView(configuration)
            .font(.fiori(forTextStyle: .body, weight: .semibold))
            .foregroundColor(foregroundColor)
            .tint(foregroundColor)
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .frame(minWidth: 44, maxWidth: self.maxWidth, minHeight: self.minHeight)
            .glassEffect(.regular.tint(self.glassEffectTintColor).interactive())
    }
    
    @ViewBuilder
    func containerView(_ configuration: FioriButtonStyle.Configuration) -> some View {
        let showImageView = configuration.image
        let label = configuration.label
        switch configuration.imagePosition {
        case .top:
            VStack(spacing: configuration.imageTitleSpacing, content: {
                showImageView
                label
            })
        case .leading:
            HStack(spacing: configuration.imageTitleSpacing, content: {
                showImageView
                label
            })
        case .bottom:
            VStack(spacing: configuration.imageTitleSpacing, content: {
                label
                showImageView
            })
        case .trailing:
            HStack(spacing: configuration.imageTitleSpacing, content: {
                label
                showImageView
            })
        }
    }
}

struct FioriButtonCustomizeGlassEffectExample: View {
    let tintColors: [Color] = [.red, .blue, .green, .yellow, .black, .cyan, .pink]
    let imagePositions: [FioriButtonImagePosition] = [.top, .leading, .bottom, .trailing]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20, content: {
                if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *) {
                    FioriButton { _ in
                        print("Tapped")
                    } image: { _ in
                        Image(fioriName: "fiori.accept")
                    }
                    .fioriButtonStyle(FioriCustomizeGlassButtonStyle(glassEffectTintColor: tintColors.randomElement()!))
                    
                    FioriButton { _ in
                        print("Tapped")
                    } label: { _ in
                        Text("Label")
                    }
                    .fioriButtonStyle(FioriCustomizeGlassButtonStyle(glassEffectTintColor: tintColors.randomElement()!))
                    
                    ForEach(imagePositions, id: \.self) { imagePosition in
                        FioriButton(action: { _ in
                            print("Tapped")
                        }, label: { _ in
                            Text("Label")
                        }, image: { _ in
                            Image(fioriName: "fiori.accept")
                        }, imagePosition: imagePosition)
                            .fioriButtonStyle(FioriCustomizeGlassButtonStyle(glassEffectTintColor: tintColors.randomElement()!))
                    }
                } else {
                    Text("FioriButton glass effect is available in iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0")
                }
            })
            .frame(maxWidth: .infinity)
        }
        .navigationTitle(Text("Customize Glass Effect"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FioriButtonCustomizeGlassEffectExample()
}
