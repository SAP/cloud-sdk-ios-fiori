// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension UserConsent where ActionTitle == EmptyView {
    public init(
    forms: [UserConsentFormData],
		@ViewBuilder firstActionTitle: @escaping () -> FirstActionTitle,
		@ViewBuilder secondActionTitle: @escaping () -> SecondActionTitle
    ) {
        self.init(
            forms: forms,
			actionTitle: { EmptyView() },
			firstActionTitle: firstActionTitle,
			secondActionTitle: secondActionTitle
        )
    }
}

extension UserConsent where FirstActionTitle == EmptyView {
    public init(
    forms: [UserConsentFormData],
		@ViewBuilder actionTitle: @escaping () -> ActionTitle,
		@ViewBuilder secondActionTitle: @escaping () -> SecondActionTitle
    ) {
        self.init(
            forms: forms,
			actionTitle: actionTitle,
			firstActionTitle: { EmptyView() },
			secondActionTitle: secondActionTitle
        )
    }
}

extension UserConsent where SecondActionTitle == EmptyView {
    public init(
    forms: [UserConsentFormData],
		@ViewBuilder actionTitle: @escaping () -> ActionTitle,
		@ViewBuilder firstActionTitle: @escaping () -> FirstActionTitle
    ) {
        self.init(
            forms: forms,
			actionTitle: actionTitle,
			firstActionTitle: firstActionTitle,
			secondActionTitle: { EmptyView() }
        )
    }
}

extension UserConsent where ActionTitle == EmptyView, FirstActionTitle == EmptyView {
    public init(
    forms: [UserConsentFormData],
		@ViewBuilder secondActionTitle: @escaping () -> SecondActionTitle
    ) {
        self.init(
            forms: forms,
			actionTitle: { EmptyView() },
			firstActionTitle: { EmptyView() },
			secondActionTitle: secondActionTitle
        )
    }
}

extension UserConsent where ActionTitle == EmptyView, SecondActionTitle == EmptyView {
    public init(
    forms: [UserConsentFormData],
		@ViewBuilder firstActionTitle: @escaping () -> FirstActionTitle
    ) {
        self.init(
            forms: forms,
			actionTitle: { EmptyView() },
			firstActionTitle: firstActionTitle,
			secondActionTitle: { EmptyView() }
        )
    }
}

extension UserConsent where FirstActionTitle == EmptyView, SecondActionTitle == EmptyView {
    public init(
    forms: [UserConsentFormData],
		@ViewBuilder actionTitle: @escaping () -> ActionTitle
    ) {
        self.init(
            forms: forms,
			actionTitle: actionTitle,
			firstActionTitle: { EmptyView() },
			secondActionTitle: { EmptyView() }
        )
    }
}
