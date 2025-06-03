import SwiftUI

/// strings configuration in OnboardingScanConfirmView
public class OnboardingScanConfirmViewContext {
    /// :nodoc:
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
    @State var availableWidth = 0.0
    @State var availableHeight = 0.0
    
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
        VStack {
            Text(self.context.titleString)
                .foregroundStyle(Color.preferredColor(.secondaryGroupedBackground, background: .lightConstant))
                .font(.fiori(forTextStyle: .title1, weight: .black))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(width: getTitleWidth(width: self.availableWidth, height: self.availableHeight))
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
                .frame(width: getSuccessMessageWidth(width: self.availableWidth, height: self.availableHeight))
                .padding(.top, 32)

            Text(self.hcpServer)
                .foregroundStyle(Color.preferredColor(.secondaryGroupedBackground, background: .lightConstant))
                .font(.fiori(forTextStyle: .body, weight: .semibold))
                .lineLimit(3)
                .frame(width: getHcpServerWidth(width: self.availableWidth, height: self.availableHeight))
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
        .background(GeometryReader { geometry in
            Color.clear
                .onAppear {
                    self.availableWidth = geometry.size.width
                    self.availableHeight = geometry.size.height
                }
        })
        .padding(.top, isPadAndPortrait(width: self.availableWidth, height: self.availableHeight) ? UIEdgeInsets.getSafeAreaInsets().top + 20 : UIEdgeInsets.getSafeAreaInsets().top + 16)
        .padding([.leading, .trailing, .bottom], 16)
        .onAppear {
            let titleLines = numberOfLines(string: context.titleString, with: UIFont.preferredFioriFont(forTextStyle: .title1, weight: .black), width: getTitleWidth(width: self.availableWidth, height: self.availableHeight))
            let successMessageLines = numberOfLines(string: context.messageString, with: UIFont.preferredFioriFont(forTextStyle: .body, weight: .semibold), width: getHcpServerWidth(width: self.availableWidth, height: self.availableHeight))

            self.adjustLayout(width: self.availableWidth, height: self.availableHeight, titleLines: titleLines, successMessageLines: successMessageLines)
            self.setContinueButtonWidth(stringWidth: self.context.continueButtonTitleString.boundingBoxSize(with: UIFont.preferredFioriFont(forTextStyle: .body, weight: .semibold)).width)
        }
        .background(Color.preferredColor(.primaryLabel).opacity(0.9))
    }
    
    func adjustLayout(width: CGFloat, height: CGFloat, titleLines: Int, successMessageLines: Int) {
        let isIphoneSE = self.isIphoneSE(width: width, height: height)
        let isIphone = self.isIphoneExceptIphoneSE(width: width, height: height)
        let isPadPortrait = self.isPadAndPortrait(width: width, height: height)
        let paddingValues: (titleTop: CGFloat, continueButtonTop: CGFloat)
        switch (titleLines, successMessageLines) {
        case (2, 2):
            paddingValues = isIphoneSE ? (16, 76) :
                isIphone ? (38, 76) :
                isPadPortrait ? (194, 76) : (60, 95)
        case (2, 3):
            paddingValues = isIphoneSE ? (16, 56) :
                isIphone ? (38, 56) :
                isPadPortrait ? (194, 56) : (60, 50)
        default:
            paddingValues = isIphoneSE ? (34, 92) :
                isIphone ? (54, 94) :
                isPadPortrait ? (131, 114) : (80, 100)
        }
        self.titleTopPadding = paddingValues.titleTop
        self.continueButtonTopPadding = paddingValues.continueButtonTop
    }
    
    func setContinueButtonWidth(stringWidth: CGFloat) {
        var cbWidth = self.sizeCategory >= .accessibilityExtraLarge ? (stringWidth + 32.0) : (self.isPhone ? 201 : 343)
        guard let continueButtonWidth = self.context.continueButtonWidth else {
            self.continueButtonWidth = cbWidth
            return
        }
        cbWidth = max(continueButtonWidth, stringWidth)
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
