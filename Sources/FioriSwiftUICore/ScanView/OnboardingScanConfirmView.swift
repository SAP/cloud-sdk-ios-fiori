import SwiftUI

/// strings configuration in OnboardingScanConfirmView
public class OnboardingScanConfirmViewContext {
    public init() {}
    
    /**
     The title string for the QR code scan confirmation screen.
     The default string is from localized strings file -
     "Confirmation"
     */
    public var titleString: String = "Confirmation".localizedFioriString()
    
    /**
     The success message for the QR code scan confirmation screen.
     The default string is from localized strings file -
     "Scan succeeded. You will be connected to:"
     */
    public var messageString: String = "Scan succeeded. You will be connected to:".localizedFioriString()

    /**
     The title string for the "Continue" button.
     The default string is from localized strings file -
     "Continue"
     */
    public var continueButtonTitleString: String = "Continue".localizedFioriString()
    
    /**
     The custom width for the "Continue" button.
     The default is 201.
     */
    public var continueButtonWidth: CGFloat?
}

public struct OnboardingScanConfirmView: View {
    var context = OnboardingScanConfirmViewContext()
    var hcpServer: String = ""
    let isPhone = UIDevice.current.userInterfaceIdiom == .phone
    private var defaultContinueButtonWidth: CGFloat = 201.0
    
    @State var titleTopPadding: CGFloat = 54.0
    @State var continueButtonTopPadding: CGFloat = 92.0
    @State var continueButtonWidth: CGFloat = 201.0
    @Environment(\.sizeCategory) private var sizeCategory

    var didTapContinue: (() -> Void)?
    
    /// Create `OnboardingScanConfirmView`
    /// - Parameters:
    ///   - context: The hint messages of OnboardingScanConfirmView.
    ///   - hcpServer: HcpServer description.
    ///   - didTapContinue: The call back when continue button is tapped.
    init(context: OnboardingScanConfirmViewContext? = nil, hcpServer: String, didTapContinue: (() -> Void)? = nil) {
        if let c = context {
            self.context = c
        }
        self.hcpServer = hcpServer
        self.didTapContinue = didTapContinue
    }
    
    public var body: some View {
        GeometryReader { proxy in
            let availableHeight = proxy.size.height + proxy.safeAreaInsets.top + proxy.safeAreaInsets.bottom
            let availableWidth = proxy.size.width + proxy.safeAreaInsets.leading + proxy.safeAreaInsets.trailing
            VStack {
                Text(self.context.titleString)
                    .foregroundStyle(Color.preferredColor(.secondaryGroupedBackground, background: .lightConstant))
                    .font(.fiori(forTextStyle: .title1, weight: .black))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(width: getTitleWidth(width: availableWidth, height: availableHeight))
                    .padding(.top, self.titleTopPadding)

                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(Color.preferredColor(.secondaryGroupedBackground, background: .lightConstant))
                    .foregroundStyle(.green)
                    .frame(width: self.isPhone ? 54 : 64, height: self.isPhone ? 54 : 64)
                    .clipShape(Circle())
                    .padding(.top, 32)
                
                Text(self.context.messageString)
                    .foregroundStyle(Color.preferredColor(.secondaryGroupedBackground, background: .lightConstant))
                    .font(.fiori(forTextStyle: .body))
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .frame(width: getSuccessMessageWidth(width: availableWidth, height: availableHeight))
                    .padding(.top, 32)

                Text(self.hcpServer)
                    .foregroundStyle(Color.preferredColor(.secondaryGroupedBackground, background: .lightConstant))
                    .font(.fiori(forTextStyle: .body, weight: .semibold))
                    .lineLimit(3)
                    .frame(width: getHcpServerWidth(width: availableWidth, height: availableHeight))
                    .padding(.top, 12)
                
                FioriButton { _ in
                    self.didTapContinue?()
                } label: { _ in
                    Text(self.context.continueButtonTitleString)
                }
                .fioriButtonStyle(FioriPrimaryButtonStyle(self.continueButtonWidth, minHeight: 40))
                .padding(.top, self.continueButtonTopPadding)
                
                Spacer(minLength: 16)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, isPadAndPortrait(width: availableWidth, height: availableHeight) ? proxy.safeAreaInsets.top + 20 : proxy.safeAreaInsets.top + 16)
            .padding([.leading, .trailing, .bottom], 16)
            .onAppear {
                let titleLines = numberOfLines(string: context.titleString, with: UIFont.preferredFioriFont(forTextStyle: .title1, weight: .black), width: getTitleWidth(width: availableWidth, height: availableHeight))
                let successMessageLines = numberOfLines(string: context.messageString, with: UIFont.preferredFioriFont(forTextStyle: .body, weight: .semibold), width: getHcpServerWidth(width: availableWidth, height: availableHeight))

                self.adjustLayout(width: availableWidth, height: availableHeight, titleLines: titleLines, successMessageLines: successMessageLines)
                self.setContinueButtonWidth(stringWidth: self.context.continueButtonTitleString.boundingBoxSize(with: UIFont.preferredFioriFont(forTextStyle: .body, weight: .semibold)).width)
            }
        }
        .background(Color.preferredColor(.primaryLabel).opacity(0.9))
    }
    
    func adjustLayout(width: CGFloat, height: CGFloat, titleLines: Int, successMessageLines: Int) {
        if isIphoneSE(width: width, height: height) {
            if titleLines == 2, successMessageLines == 2 {
                self.titleTopPadding = 16
                self.continueButtonTopPadding = 76
            } else if titleLines == 2, successMessageLines == 3 {
                self.titleTopPadding = 16
                self.continueButtonTopPadding = 56
            } else {
                self.titleTopPadding = 34
                self.continueButtonTopPadding = 92
            }
        } else if isIphoneExceptIphoneSE(width: width, height: height) {
            if titleLines == 2, successMessageLines == 2 {
                self.titleTopPadding = 38
                self.continueButtonTopPadding = 76
            } else if titleLines == 2, successMessageLines == 3 {
                self.titleTopPadding = 38
                self.continueButtonTopPadding = 56
            } else {
                self.titleTopPadding = 54
                self.continueButtonTopPadding = 94
            }
        } else if isPadAndPortrait(width: width, height: height) {
            if titleLines == 2, successMessageLines == 2 {
                self.titleTopPadding = 194
                self.continueButtonTopPadding = 76
            } else if titleLines == 2, successMessageLines == 3 {
                self.titleTopPadding = 194
                self.continueButtonTopPadding = 56
            } else {
                self.titleTopPadding = 210
                self.continueButtonTopPadding = 114
            }
        } else if !isPadAndPortrait(width: width, height: height) {
            if titleLines == 2, successMessageLines == 2 {
                self.titleTopPadding = 60
                self.continueButtonTopPadding = 95
            } else if titleLines == 2, successMessageLines == 3 {
                self.titleTopPadding = 60
                self.continueButtonTopPadding = 50
            } else {
                self.titleTopPadding = 80
                self.continueButtonTopPadding = 100
            }
        }
    }
    
    func setContinueButtonWidth(stringWidth: CGFloat) {
        var cbWidth = self.sizeCategory >= .accessibilityExtraLarge ? (stringWidth + 32.0) : (self.isPhone ? 201 : 343)
        if self.context.continueButtonWidth != nil {
            cbWidth = max(self.context.continueButtonWidth!, stringWidth)
        }
        self.continueButtonWidth = cbWidth
    }
}

extension OnboardingScanConfirmView {
    func isPadAndPortrait(width: CGFloat, height: CGFloat) -> Bool {
        let device = UIDevice.current
        return device.userInterfaceIdiom == .pad && (height > width)
    }
    
    func isIphoneSE(width: CGFloat, height: CGFloat) -> Bool {
        if height > width {
            return height == 568.0
        } else {
            return height == 320.0
        }
    }
    
    func isIphoneExceptIphoneSE(width: CGFloat, height: CGFloat) -> Bool {
        UIDevice.current.userInterfaceIdiom == .phone && !self.isIphoneSE(width: width, height: height)
    }
    
    func getTitleWidth(width: CGFloat, height: CGFloat) -> CGFloat {
        if self.isIphoneSE(width: width, height: height) {
            return 270.0
        } else if self.isIphoneExceptIphoneSE(width: width, height: height) {
            return 270.0
        } else if self.isPadAndPortrait(width: width, height: height) {
            return 500.0
        } else if !self.isPadAndPortrait(width: width, height: height) {
            return 600.0
        }
        return 270.0
    }
    
    func getSuccessMessageWidth(width: CGFloat, height: CGFloat) -> CGFloat {
        if self.isIphoneSE(width: width, height: height) {
            return 270.0
        } else if self.isIphoneExceptIphoneSE(width: width, height: height) {
            return 270.0
        } else if self.isPadAndPortrait(width: width, height: height) {
            return 500.0
        } else if !self.isPadAndPortrait(width: width, height: height) {
            return 600.0
        }
        return 270.0
    }
    
    func getHcpServerWidth(width: CGFloat, height: CGFloat) -> CGFloat {
        if self.isIphoneSE(width: width, height: height) {
            return 288.0
        } else if self.isIphoneExceptIphoneSE(width: width, height: height) {
            return 343.0
        } else if self.isPadAndPortrait(width: width, height: height) {
            return 600.0
        } else if !self.isPadAndPortrait(width: width, height: height) {
            return 800.0
        }
        return 288.0
    }
    
    func numberOfLines(string: String, with font: UIFont, lineLimit: Int = 0, width: CGFloat = CGFloat(MAXFLOAT), height: CGFloat = CGFloat(MAXFLOAT)) -> Int {
        let targetWidth = lineLimit == 1 ? 10000 : width
        let size = (string as NSString).boundingRect(with: CGSize(width: targetWidth, height: height),
                                                     options: .usesLineFragmentOrigin,
                                                     attributes: [NSAttributedString.Key.font: font],
                                                     context: nil).size
        let fontSize = font.pointSize
        let tmpLineSpacing = font.lineHeight / fontSize
        let numberOfLines = Int(0.1 + (size.height + tmpLineSpacing) / (font.lineHeight + tmpLineSpacing))
        
        return numberOfLines
    }
}
