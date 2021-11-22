// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct UserConsentView<UserConsentForms: IndexedViewContainer> {
    

    let _userConsentForms: UserConsentForms
	let _didAllow: ((Int) -> Void)?
	let _didDeny: ((Int, Bool) -> Void)?
	let _didCancel: ((Int) -> Void)?
	let _didFinish: (([Int]) -> Void)?
	@State var _allowedFormIndexes: [Int] = []
	@State var _formIndex = 0

    private var isModelInit: Bool = false
	private var isDidAllowNil: Bool = false
	private var isDidDenyNil: Bool = false
	private var isDidCancelNil: Bool = false
	private var isDidFinishNil: Bool = false

    public init(
        @IndexedViewBuilder userConsentForms: () -> UserConsentForms,
		didAllow: ((Int) -> Void)? = nil,
		didDeny: ((Int, Bool) -> Void)? = nil,
		didCancel: ((Int) -> Void)? = nil,
		didFinish: (([Int]) -> Void)? = nil
        ) {
            self._userConsentForms = userConsentForms()
			self._didAllow = didAllow
			self._didDeny = didDeny
			self._didCancel = didCancel
			self._didFinish = didFinish
    }

    var userConsentForms: UserConsentForms {
        _userConsentForms
    }
    
	
}

extension UserConsentView where UserConsentForms == _UserConsentFormsContainer {

    public init(model: UserConsentViewModel) {
        self.init(userConsentForms: model.userConsentForms, didAllow: model.didAllow, didDeny: model.didDeny, didCancel: model.didCancel, didFinish: model.didFinish)
    }

    public init(userConsentForms: [UserConsentFormModel] = [], didAllow: ((Int) -> Void)? = nil, didDeny: ((Int, Bool) -> Void)? = nil, didCancel: ((Int) -> Void)? = nil, didFinish: (([Int]) -> Void)? = nil) {
        self._userConsentForms = _UserConsentFormsContainer(userConsentForms: userConsentForms)
		self._didAllow = didAllow
		self._didDeny = didDeny
		self._didCancel = didCancel
		self._didFinish = didFinish

		isModelInit = true
		isDidAllowNil = didAllow == nil ? true : false
		isDidDenyNil = didDeny == nil ? true : false
		isDidCancelNil = didCancel == nil ? true : false
		isDidFinishNil = didFinish == nil ? true : false
    }
}
