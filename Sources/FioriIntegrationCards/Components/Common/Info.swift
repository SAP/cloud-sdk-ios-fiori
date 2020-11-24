import SwiftUI

public final class Info: Decodable, AnyBodyProducing {
    var value: String?
    var state: String?

    func body() -> AnyView {
        AnyView(
            Text(self.value ?? "")
                .foregroundColor(.forStatus(status: self.state))
        )
    }

    init(value: String?, state: String?) {
        self.value = value
        self.state = state
    }
}

extension Info: Placeholding {
    public func replacingPlaceholders(withValuesIn objects: Any...) -> Info {
        let _value = self.value?.replacingPlaceholders(withValuesIn: objects)
        let _state = self.state?.replacingPlaceholders(withValuesIn: objects)
        return Info(value: _value, state: _state)
    }
}

extension Info: Hashable {
    public static func == (lhs: Info, rhs: Info) -> Bool {
        lhs.value == rhs.value && lhs.state == rhs.state
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.value)
        hasher.combine(self.state)
    }
}
