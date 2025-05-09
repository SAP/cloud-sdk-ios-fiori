import Combine
import FioriThemeManager
import Foundation
import SwiftUI

@MainActor class ProfileHeaderViewModel: ObservableObject {
    @Published var transitionProgress: CGFloat = 0
    
    var contentYOffset: CGFloat? {
        didSet {
            self.validatedProgress()
        }
    }

    var adjustedContentInsetTop: CGFloat = 0 {
        didSet {
            self.validatedProgress()
        }
    }

    var animatable = false
    var contentOffsetSubscription: AnyCancellable?
    
    private var lastProgress: CGFloat = 0
    
    func validatedProgress() {
        let progress: CGFloat
        if let contentYOffset {
            let offset = self.adjustedContentInsetTop + contentYOffset
            if offset > 0 {
                if offset > 35 {
                    progress = 1
                } else {
                    progress = offset / 35
                }
            } else {
                progress = 0
            }
        } else {
            progress = self.lastProgress
        }
        
        if self.animatable, self.lastProgress != progress {
            self.lastProgress = progress
            self.transitionProgress = progress
        }
    }
}

// Base Layout style
public struct ProfileHeaderBaseStyle: ProfileHeaderStyle {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.headerSeparator) private var separatorConfiguration
    
    @StateObject var viewModel = ProfileHeaderViewModel()
    @State var subtitleSize: CGSize = .zero
    @State var titleSize: CGSize = .zero
    
    private let imageMaxSize = CGSize(width: 80, height: 80)
    private let imageMinSize = CGSize(width: 45, height: 45)
    
    private func subtitle(_ configuration: ProfileHeaderConfiguration) -> some View {
        configuration.subtitle
            .sizeReader(size: { size in
                if size.different(with: self.subtitleSize) {
                    self.subtitleSize = size
                }
            })
    }
    
    @ViewBuilder
    private func detailImage(_ configuration: ProfileHeaderConfiguration) -> some View {
        // 80 -> 45
        let validTransitionValue = min(max(viewModel.transitionProgress, 0), 1)
        let imgWidth = self.imageMaxSize.width - (self.imageMaxSize.width - self.imageMinSize.width) * validTransitionValue
        let imgHeight = self.imageMaxSize.height - (self.imageMaxSize.height - self.imageMinSize.height) * validTransitionValue
        configuration.detailImage
            .frame(width: imgWidth, height: imgHeight)
    }
    
    @ViewBuilder
    public func makeBody(_ configuration: ProfileHeaderConfiguration) -> some View {
        // Add default layout here
        Group {
            switch self.horizontalSizeClass {
            case .regular:
                self.regularView(configuration)
                    .ifApply(self.separatorConfiguration.showSeparator) { content in
                        VStack(spacing: 16) {
                            content
                            self.separatorConfiguration.color
                                .frame(height: self.separatorConfiguration.lineWidth)
                        }
                    }
            case .compact, .none, .some:
                self.compactView(configuration)
                    .ifApply(self.separatorConfiguration.showSeparator) { content in
                        VStack(spacing: 16) {
                            content
                            self.separatorConfiguration.color
                                .frame(height: self.separatorConfiguration.lineWidth)
                        }
                    }
            }
        }.modifier(FioriIntrospectModifier<UIScrollView>(introspection: { scrollView in
            DispatchQueue.main.async {
                self.viewModel.adjustedContentInsetTop = scrollView.adjustedContentInset.top
            }
            self.viewModel.animatable = configuration.animatable
            if self.viewModel.contentOffsetSubscription == nil {
                self.viewModel.contentOffsetSubscription = scrollView.publisher(for: \.contentOffset)
                    .sink { [weak viewModel] contentOffset in
                        DispatchQueue.main.async {
                            viewModel?.contentYOffset = contentOffset.y
                        }
                    }
            }
        }))
    }
    
    @ViewBuilder
    func compactView(_ configuration: ProfileHeaderConfiguration) -> some View {
        let validTransitionValue = min(max(viewModel.transitionProgress, 0), 1)
        VStack(spacing: 10) {
            self.detailImage(configuration)
            VStack(spacing: 0) {
                configuration.title
                
                VStack(spacing: 10) {
                    ZStack {
                        self.subtitle(configuration)
                            .opacity(1 - validTransitionValue)
                            .padding(.top, self.subtitlePadding(configuration))
                    }.clipped()
                    
                    if !configuration.description.isEmpty {
                        configuration.description
                    }
                    
                    if !configuration.detailContent.isEmpty {
                        Spacer().frame(height: 8)
                        configuration.detailContent
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func regularView(_ configuration: ProfileHeaderConfiguration) -> some View {
        let validTransitionValue = min(max(viewModel.transitionProgress, 0), 1)
        let oppositeValue = 1 - validTransitionValue
        HStack(spacing: 8) {
            self.detailImage(configuration)
            VStack(alignment: .leading, spacing: 8 * oppositeValue) {
                configuration.title
                    .sizeReader(size: { size in
                        if size.different(with: self.titleSize) {
                            self.titleSize = size
                        }
                    })
                ZStack {
                    self.subtitle(configuration)
                        .opacity(oppositeValue)
                        .padding(.top, self.subtitlePadding(configuration))
                }
                .clipped()
                .padding(.top, -8 * validTransitionValue)
            }
            Spacer()
            if !configuration.description.isEmpty, validTransitionValue < 1 {
                configuration.description
                    .opacity(oppositeValue)
                Spacer()
            }
            if !configuration.detailContent.isEmpty {
                configuration.detailContent
            }
        }
    }

    private func titlePadding(_ configuration: ProfileHeaderConfiguration) -> CGFloat {
        self.viewModel.transitionProgress * ((self.subtitleSize.height + 8) / 2)
    }
    
    private func subtitlePadding(_ configuration: ProfileHeaderConfiguration) -> CGFloat {
        -self.viewModel.transitionProgress * self.subtitleSize.height
    }
}

// Default fiori styles
extension ProfileHeaderFioriStyle {
    struct ContentFioriStyle: ProfileHeaderStyle {
        func makeBody(_ configuration: ProfileHeaderConfiguration) -> some View {
            ProfileHeader(configuration)
        }
    }
    
    struct DetailImageFioriStyle: DetailImageStyle {
        let profileHeaderConfiguration: ProfileHeaderConfiguration
        
        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
                .clipShape(Circle())
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let profileHeaderConfiguration: ProfileHeaderConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .title3, weight: .bold))
        }
    }
    
    struct SubtitleFioriStyle: SubtitleStyle {
        let profileHeaderConfiguration: ProfileHeaderConfiguration
        
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                .foregroundStyle(Color.preferredColor(.secondaryLabel))
                .font(.fiori(forTextStyle: .headline))
        }
    }
    
    struct DescriptionFioriStyle: DescriptionStyle {
        let profileHeaderConfiguration: ProfileHeaderConfiguration
        
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
        }
    }
}
