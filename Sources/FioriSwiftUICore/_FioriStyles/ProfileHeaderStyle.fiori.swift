import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ProfileHeaderBaseStyle: ProfileHeaderStyle {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
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
        let validTransitionValue = min(max(configuration.transitionProgress, 0), 1)
        let imgWidth = self.imageMaxSize.width - (self.imageMaxSize.width - self.imageMinSize.width) * validTransitionValue
        let imgHeight = self.imageMaxSize.height - (self.imageMaxSize.height - self.imageMinSize.height) * validTransitionValue
        configuration.detailImage
            .frame(width: imgWidth, height: imgHeight)
    }
    
    @ViewBuilder
    public func makeBody(_ configuration: ProfileHeaderConfiguration) -> some View {
        // Add default layout here
        let validTransitionValue = min(max(configuration.transitionProgress, 0), 1)
        let oppositeValue = 1 - validTransitionValue
        
        switch self.horizontalSizeClass {
        case .regular:
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
        case .compact, .none, .some:
            VStack(spacing: 10) {
                self.detailImage(configuration)
                VStack(spacing: 0) {
                    configuration.title
                    
                    VStack(spacing: 10) {
                        ZStack {
                            self.subtitle(configuration)
                                .opacity(oppositeValue)
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
    }
    
    private func titlePadding(_ configuration: ProfileHeaderConfiguration) -> CGFloat {
        configuration.transitionProgress * ((self.subtitleSize.height + 8) / 2)
    }
    
    private func subtitlePadding(_ configuration: ProfileHeaderConfiguration) -> CGFloat {
        -configuration.transitionProgress * self.subtitleSize.height
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
                .font(.fiori(forTextStyle: .title3, weight: .bold))
        }
    }
    
    struct SubtitleFioriStyle: SubtitleStyle {
        let profileHeaderConfiguration: ProfileHeaderConfiguration
        
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                .font(.fiori(forTextStyle: .body))
        }
    }
    
    struct DescriptionFioriStyle: DescriptionStyle {
        let profileHeaderConfiguration: ProfileHeaderConfiguration
        
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
        }
    }
}

#Preview {
    NavigationStack {
        ProfileHeaderPreview()
            .navigationTitle("ProfileHeader")
    }
}

struct ProfileHeaderPreview: View {
    @State private var v: CGFloat = 0
    var body: some View {
        if #available(iOS 17, *) {
            ScrollView {
                LazyVStack(alignment: .center, pinnedViews: [.sectionHeaders], content: {
                    Section {
                        ForEach(0 ..< 20) { item in
                            Text("List Item \(item)")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(.gray)
                                .cornerRadius(10)
                        }
                    } header: {
                        profileHeader
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.preferredColor(.secondaryGroupedBackground))
                    }
                })
                .frameReader(in: .named("profileHeader"), rect: { rect in
                    if rect.origin.y >= 0 {
                        v = 0
                    } else if rect.origin.y <= -35 {
                        v = 1
                    } else {
                        v = -rect.origin.y / 35
                    }
                })
            }
            .coordinateSpace(.named("profileHeader"))
        }
    }
    
    var profileHeader: some View {
        ProfileHeader(detailImage: {
            Image(systemName: "sun.min")
                .resizable()
        }, title: {
            Text("This is a Title")
        }, subtitle: {
            Text("This is a subtitle This is a subtitle This is a subtitle This is a subtitle This is a subtitle")
        }, description: {
            Text("This is a description")
        }, transitionProgress: self.$v) {
            HStack(spacing: 30) {
                Button(action: {}, label: {
                    Image(systemName: "mail")
                })
                Button(action: {}, label: {
                    Image(systemName: "message")
                })
                    
                Button(action: {}, label: {
                    Image(systemName: "phone")
                })
            }
        }
    }
}
