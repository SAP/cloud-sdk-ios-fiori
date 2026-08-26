import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

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
                    .fioriButtonStyle(FioriCustomizeGlassButtonStyle(glassEffectTintColor: self.tintColors.randomElement()!))
                    
                    FioriButton { _ in
                        print("Tapped")
                    } label: { _ in
                        Text("Label")
                    }
                    .fioriButtonStyle(FioriCustomizeGlassButtonStyle(glassEffectTintColor: self.tintColors.randomElement()!))
                    
                    FioriButton { _ in
                        print("Tapped")
                    } label: { _ in
                        Text("Plain Glass")
                    }
                    .fioriButtonStyle(FioriCustomizeGlassButtonStyle(glassEffectTintColor: nil))
                    
                    ForEach(self.imagePositions, id: \.self) { imagePosition in
                        FioriButton(action: { _ in
                            print("Tapped")
                        }, label: { _ in
                            Text("Label")
                        }, image: { _ in
                            Image(fioriName: "fiori.accept")
                        }, imagePosition: imagePosition)
                            .fioriButtonStyle(FioriCustomizeGlassButtonStyle(glassEffectTintColor: self.tintColors.randomElement()!, maxWidth: 200, minHeight: 44))
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
