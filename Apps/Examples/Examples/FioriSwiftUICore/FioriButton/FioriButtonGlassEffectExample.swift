import FioriSwiftUICore
import SwiftUI

struct FioriButtonGlassEffectExample: View {
    let glassEffects: [FioriButtonGlassEffectStyle] = [.plain, .tint]
    let imagePositions: [FioriButtonImagePosition] = [.top, .leading, .bottom, .trailing]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20, content: {
                if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *) {
                    ForEach(glassEffects, id: \.self) { glassEffect in
                        FioriButton { _ in
                            print("Tapped")
                        } image: { _ in
                            Image(fioriName: "fiori.accept")
                        }
                        .fioriButtonStyle(FioriGlassButtonStyle(glassEffect: glassEffect))
                        
                        FioriButton { _ in
                            print("Tapped")
                        } label: { _ in
                            Text("Label")
                        }
                        .fioriButtonStyle(FioriGlassButtonStyle(glassEffect: glassEffect))
                        
                        ForEach(imagePositions, id: \.self) { imagePosition in
                            FioriButton(action: { _ in
                                print("Tapped")
                            }, label: { _ in
                                Text("Label")
                            }, image: { _ in
                                Image(fioriName: "fiori.accept")
                            }, imagePosition: imagePosition)
                                .fioriButtonStyle(FioriGlassButtonStyle(glassEffect: glassEffect))
                        }
                    }
                } else {
                    Text("FioriButton glass effect is available in iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0")
                }
            })
            .frame(maxWidth: .infinity)
        }
        .navigationTitle(Text("Glass Effect"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            FioriButton(title: "Done") { _ in
            }
            .fioriButtonStyle(self.toolBarFioriButtonStyle())
        })
    }
    
    func toolBarFioriButtonStyle() -> some FioriButtonStyle {
        if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *) {
            FioriGlassButtonStyle(glassEffect: .systemManaged).eraseToAnyFioriButtonStyle()
        } else {
            FioriPrimaryButtonStyle().eraseToAnyFioriButtonStyle()
            // Fallback on earlier versions
        }
    }
}

#Preview {
    FioriButtonGlassEffectExample()
}
