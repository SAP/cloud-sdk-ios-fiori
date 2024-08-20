import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

private enum FioriButtonImagePosition {
    case top
    case leading
    case bottom
    case trailing
}

private enum FioriButtonTitleLength {
    case short
    case long
    case extra
}

private enum FioriButtonLineLimit {
    case none
    case one
    case two
    case three
}

struct FioriButtonCustomButtonExample: View {
    @State private var _truncationMode: Text.TruncationMode = .head
    @State private var _loadingState: FioriButtonLoadingState = .unspecified
    @State private var _imagePosition: FioriButtonImagePosition = .leading
    @State private var _titleAlignment: TextAlignment = .center
    @State private var _titleLength: FioriButtonTitleLength = .short
    @State private var _lineLimit: FioriButtonLineLimit = .none
    
    private let spacing = 10.0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: self.spacing) {
                FioriButton { _ in
                    switch self._imagePosition {
                    case .top:
                        VStack(spacing: self.spacing, content: {
                            self.imageView()
                            self.titleView()
                        })
                    case .leading:
                        HStack(spacing: self.spacing, content: {
                            self.imageView()
                            self.titleView()
                        })
                    case .bottom:
                        VStack(spacing: self.spacing, content: {
                            self.titleView()
                            self.imageView()
                        })
                    case .trailing:
                        HStack(spacing: self.spacing, content: {
                            self.titleView()
                            self.imageView()
                        })
                    }
                }
                .fioriButtonStyle(FioriPrimaryButtonStyle().eraseToAnyFioriButtonStyle())
                
                HStack {
                    Text("Loading State:")
                    Spacer()
                }
                Picker("Loading State:", selection: self.$_loadingState) {
                    Text("unspecified").tag(FioriButtonLoadingState.unspecified)
                    Text("processing").tag(FioriButtonLoadingState.processing)
                    Text("success").tag(FioriButtonLoadingState.success)
                }
                .pickerStyle(.segmented)
                
                HStack {
                    Text("Image Position:")
                    Spacer()
                }
                Picker("Image Position:", selection: self.$_imagePosition) {
                    Text("top").tag(FioriButtonImagePosition.top)
                    Text("leading").tag(FioriButtonImagePosition.leading)
                    Text("bottom").tag(FioriButtonImagePosition.bottom)
                    Text("trailing").tag(FioriButtonImagePosition.trailing)
                }
                .pickerStyle(.segmented)
                
                HStack {
                    Text("Title Alignment:")
                    Spacer()
                }
                Picker("Title Alignment", selection: self.$_titleAlignment) {
                    Text("leading").tag(TextAlignment.leading)
                    Text("center").tag(TextAlignment.center)
                    Text("trailing").tag(TextAlignment.trailing)
                }
                .pickerStyle(.segmented)
                
                HStack {
                    Text("Truncation Mode:")
                    Spacer()
                }
                Picker("Truncation Mode", selection: self.$_truncationMode) {
                    Text("head").tag(Text.TruncationMode.head)
                    Text("middle").tag(Text.TruncationMode.middle)
                    Text("tail").tag(Text.TruncationMode.tail)
                }
                .pickerStyle(.segmented)
                
                HStack {
                    Text("Title Length:")
                    Spacer()
                }
                Picker("Title Length", selection: self.$_titleLength) {
                    Text("short").tag(FioriButtonTitleLength.short)
                    Text("long").tag(FioriButtonTitleLength.long)
                    Text("extra").tag(FioriButtonTitleLength.extra)
                }
                .pickerStyle(.segmented)
                
                HStack {
                    Text("Line Limit:")
                    Spacer()
                }
                Picker("Line Limit", selection: self.$_lineLimit) {
                    Text("none").tag(FioriButtonLineLimit.none)
                    Text("one").tag(FioriButtonLineLimit.one)
                    Text("two").tag(FioriButtonLineLimit.two)
                    Text("three").tag(FioriButtonLineLimit.three)
                }
                .pickerStyle(.segmented)
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
        .navigationTitle("Custom Button")
        .font(.headline.bold())
    }
    
    func imageView() -> some View {
        switch self._loadingState {
        case .unspecified:
            AnyView(FioriIcon.actions.actionSettingsFill.font(.fiori(forTextStyle: .subheadline)))
        case .processing:
            AnyView(ProgressView(value: 0)
                .progressViewStyle(.circular))
        case .success:
            AnyView(FioriIcon.status.sysEnter.font(.fiori(forTextStyle: .subheadline)))
        }
    }

    func titleView() -> some View {
        var titleStr = ""
        switch self._titleLength {
        case .short:
            titleStr = "Short Title"
        case .long:
            titleStr = "The title is too too too too too too too too too too too too too too too too long"
        case .extra:
            titleStr = "The title is too too too too too too too too too too too too too too too too extra extra extra extra extra extra extra extra extra extra extra extra extra extra extra extra extra extra extra extra extra long"
        }
        return Text(titleStr)
            .truncationMode(self._truncationMode)
            .multilineTextAlignment(self._titleAlignment)
            .lineLimit(self.lineLimit())
    }
    
    func lineLimit() -> Int? {
        switch self._lineLimit {
        case .none:
            return nil
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        }
    }
}

#Preview {
    FioriButtonCustomButtonExample()
}
