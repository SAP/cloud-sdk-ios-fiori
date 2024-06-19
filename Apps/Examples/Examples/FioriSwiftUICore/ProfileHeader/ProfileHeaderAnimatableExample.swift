import FioriSwiftUICore
import SwiftUI

struct ProfileHeaderAnimatableExample: View {
    @State private var v: CGFloat = 0
    @Namespace var imgNameSpace
    
    var profileHeader: some View {
        ProfileHeader(detailImage: {
            Image("ProfilePic").resizable()
        }, title: {
            Text("Title")
        }, subtitle: {
            Text("This is a subtitle.")
        }, description: {
            Text("This is a description.")
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
    
    var body: some View {
        if #available(iOS 17, *) {
            ScrollView {
                LazyVStack(alignment: .center, pinnedViews: [.sectionHeaders], content: {
                    Section {
                        ForEach(0 ..< 30) { item in
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
                    } else if rect.origin.y <= -45 {
                        v = 1
                    } else {
                        v = -rect.origin.y / 45
                    }
                })
            }
            .coordinateSpace(.named("profileHeader"))
            .navigationTitle("Animatable Header")
        } else {
            ProfileHeaderStaticExample()
                .navigationTitle("Static Header")
        }
    }
}

#Preview {
    NavigationStack {
        if #available(iOS 17.0, *) {
            ProfileHeaderAnimatableExample()
                .toolbarTitleDisplayMode(.inline)
        } else {
            ProfileHeaderAnimatableExample()
        }
    }
}

@available(iOS 17.0, *)
#Preview(traits: .landscapeLeft) {
    NavigationStack {
        ProfileHeaderAnimatableExample()
    }
}

extension View {
    func frameReader(in coordinateSpace: CoordinateSpace = .global, rect: @escaping (CGRect) -> Void) -> some View {
        background(
            GeometryReader { geometry in
                let frame = geometry.frame(in: coordinateSpace)
                Color.clear
                    .preference(key: ContentFrameReaderPreferenceKey.self, value: frame)
                    .onPreferenceChange(ContentFrameReaderPreferenceKey.self) { newValue in
                        rect(newValue)
                    }
            }
            .hidden()
        )
    }
}

struct ContentFrameReaderPreferenceKey: PreferenceKey {
    static var defaultValue: CGRect { CGRect() }
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) { value = nextValue() }
}
