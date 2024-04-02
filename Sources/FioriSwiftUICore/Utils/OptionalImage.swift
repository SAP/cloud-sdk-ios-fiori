import SwiftUI

struct OptionalImage: View {
    let image: Image?
    
    init(_ image: Image?) {
        self.image = image
    }
    
    var body: some View {
        if let image {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } else {
            EmptyView()
        }
    }
}

extension OptionalImage: _ViewEmptyChecking {
    var isEmpty: Bool {
        self.image == nil
    }
}

#Preview {
    OptionalImage(Image(systemName: "square.and.arrow.up.circle"))
}
