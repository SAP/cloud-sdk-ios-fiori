import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct FioriButtonProcessingStyle: FioriButtonStyle {
    @State var minWidth: CGFloat = 44.0
    @State var maxWidth: CGFloat?
    @State var minHeight: CGFloat = 44
    let loadingState: FioriButtonLoadingState
    
    func makeBody(configuration: FioriButtonStyle.Configuration) -> some View {
        let foregroundColor = Color.white
        let backgroundColor = Color.preferredColor(.tintColorTapState)
        
        return self.containerView(self.loadingState, configuration: configuration)
            .font(.fiori(forTextStyle: .body, weight: .semibold))
            .foregroundColor(foregroundColor)
            .tint(foregroundColor)
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .frame(minWidth: self.minWidth, maxWidth: self.maxWidth, minHeight: self.minHeight)
            .background(RoundedRectangle(cornerRadius: 8).fill(backgroundColor))
            .contentShape(Rectangle())
    }
    
    @ViewBuilder
    func containerView(_ loadingState: FioriButtonLoadingState, configuration: FioriButtonStyle.Configuration) -> some View {
        let showImageView = showImageView(loadingState, image: configuration.image)
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
    
    @ViewBuilder
    private func showImageView(_ loadingState: FioriButtonLoadingState, image: FioriButtonStyleConfiguration.Image) -> some View {
        switch loadingState {
        case .unspecified:
            image
        case .processing:
            ProgressView(value: 0).progressViewStyle(.circular)
        case .success:
            FioriIcon.status.sysEnter
        }
    }
}

struct LoadingButtonSingleStatusExample: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 40) {
                HStack {
                    FioriButton()
                        .fioriButtonStyle(FioriButtonProcessingStyle(minHeight: 38, loadingState: .processing).eraseToAnyFioriButtonStyle())
                        .disabled(true)
                    
                    Spacer()
                }
                
                FioriButton(label: { _ in
                    Text("Loading...")
                })
                .fioriButtonStyle(FioriButtonProcessingStyle(minWidth: 142, minHeight: 38, loadingState: .processing).eraseToAnyFioriButtonStyle())
                .disabled(true)
                
                FioriButton()
                    .fioriButtonStyle(FioriButtonProcessingStyle(minWidth: 142, minHeight: 38, loadingState: .processing).eraseToAnyFioriButtonStyle())
                    .disabled(true)
                
                FioriButton(label: { _ in
                    Text("Loading...")
                })
                .fioriButtonStyle(FioriButtonProcessingStyle(maxWidth: .infinity, loadingState: .processing).eraseToAnyFioriButtonStyle())
                .disabled(true)
                
                FioriButton(label: { _ in
                    Text("Loading...")
                }, imagePosition: .trailing).fioriButtonStyle(FioriButtonProcessingStyle(maxWidth: .infinity, loadingState: .processing).eraseToAnyFioriButtonStyle())
                    .disabled(true)
                
                FioriButton()
                    .fioriButtonStyle(FioriButtonProcessingStyle(maxWidth: .infinity, loadingState: .processing).eraseToAnyFioriButtonStyle())
                    .disabled(true)
            }
            .frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationTitle("Loading Button Single Status")
    }
}

#Preview {
    LoadingButtonSingleStatusExample()
}
