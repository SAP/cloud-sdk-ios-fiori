// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// This file provides APIs for easy component construction which can be used when implementing the base layout.

// MARK: AIUserFeedbackConfiguration

@MainActor extension AIUserFeedbackConfiguration {
    var _illustratedMessage: IllustratedMessage {
        IllustratedMessage(.init(detailImage: .init(self.detailImage), title: .init(self.title), description: .init(self.description), action: .init(self.action), secondaryAction: .init(self.secondaryAction), detailImageSize: self.detailImageSize, isActionVerticallyAligned: self.isActionVerticallyAligned, contentAlignment: self.contentAlignment), shouldApplyDefaultStyle: true)
    }
}

// MARK: CardConfiguration

@MainActor extension CardConfiguration {
    var _cardHeader: CardHeader {
        CardHeader(.init(mediaImage: .init(self.mediaImage), description: .init(self.description), title: .init(self.title), subtitle: .init(self.subtitle), icons: .init(self.icons), detailImage: .init(self.detailImage), headerAction: .init(self.headerAction), counter: .init(self.counter), flexItem: .init(self.flexItem), flexItemPosition: self.flexItemPosition, row1: .init(self.row1), row2: .init(self.row2), row3: .init(self.row3), kpi: .init(self.kpi), kpiCaption: .init(self.kpiCaption)), shouldApplyDefaultStyle: true)
    }

    var _cardFooter: CardFooter {
        CardFooter(.init(action: .init(self.action), secondaryAction: .init(self.secondaryAction), tertiaryAction: .init(self.tertiaryAction), overflowAction: .init(self.overflowAction)), shouldApplyDefaultStyle: true)
    }
}

// MARK: CardHeaderConfiguration

@MainActor extension CardHeaderConfiguration {
    var _cardMedia: CardMedia {
        CardMedia(.init(mediaImage: .init(self.mediaImage), description: .init(self.description)), shouldApplyDefaultStyle: true)
    }

    var _cardMainHeader: CardMainHeader {
        CardMainHeader(.init(title: .init(self.title), subtitle: .init(self.subtitle), icons: .init(self.icons), detailImage: .init(self.detailImage), headerAction: .init(self.headerAction), counter: .init(self.counter), flexItem: .init(self.flexItem), flexItemPosition: self.flexItemPosition), shouldApplyDefaultStyle: true)
    }

    var _cardExtHeader: CardExtHeader {
        CardExtHeader(.init(row1: .init(self.row1), row2: .init(self.row2), row3: .init(self.row3), kpi: .init(self.kpi), kpiCaption: .init(self.kpiCaption)), shouldApplyDefaultStyle: true)
    }
}

// MARK: DateRangePickerConfiguration

@MainActor extension DateRangePickerConfiguration {
    var _formView: FormView {
        FormView(.init(controlState: self.controlState, errorMessage: self.errorMessage), shouldApplyDefaultStyle: true)
    }
}

// MARK: DateTimePickerConfiguration

@MainActor extension DateTimePickerConfiguration {
    var _formView: FormView {
        FormView(.init(controlState: self.controlState, errorMessage: self.errorMessage), shouldApplyDefaultStyle: true)
    }
}

// MARK: DemoViewConfiguration

@MainActor extension DemoViewConfiguration {
    var _switch: Switch {
        Switch(.init(isOn: self.$isOn), shouldApplyDefaultStyle: true)
    }
}

// MARK: DurationPickerConfiguration

@MainActor extension DurationPickerConfiguration {
    var _formView: FormView {
        FormView(.init(controlState: self.controlState, errorMessage: self.errorMessage), shouldApplyDefaultStyle: true)
    }
}

// MARK: FilterFormViewConfiguration

@MainActor extension FilterFormViewConfiguration {
    var _formView: FormView {
        FormView(.init(controlState: self.controlState, errorMessage: self.errorMessage), shouldApplyDefaultStyle: true)
    }

    var _options: Options {
        Options(.init(options: self.options), shouldApplyDefaultStyle: true)
    }
}

// MARK: FioriSliderConfiguration

@MainActor extension FioriSliderConfiguration {
    var _rangeSliderControl: RangeSliderControl {
        RangeSliderControl(.init(lowerThumb: .init(self.lowerThumb), upperThumb: .init(self.upperThumb), activeTrack: .init(self.activeTrack), inactiveTrack: .init(self.inactiveTrack), lowerValue: self.$lowerValue, upperValue: self.$upperValue, range: self.range, step: self.step, decimalPlaces: self.decimalPlaces, thumbHalfWidth: self.thumbHalfWidth, showsLowerThumb: self.showsLowerThumb, showsUpperThumb: self.showsUpperThumb, onRangeValueChange: self.onRangeValueChange), shouldApplyDefaultStyle: true)
    }

    var _informationView: InformationView {
        InformationView(.init(icon: .init(self.icon), description: .init(self.description)), shouldApplyDefaultStyle: true)
    }
}

// MARK: HierarchyItemViewConfiguration

@MainActor extension HierarchyItemViewConfiguration {
    var _accessoryView: AccessoryView {
        AccessoryView(.init(accessoryType: self.accessoryType), shouldApplyDefaultStyle: true)
    }
}

// MARK: KeyValueFormViewConfiguration

@MainActor extension KeyValueFormViewConfiguration {
    var _noteFormView: NoteFormView {
        NoteFormView(.init(text: self.$text, placeholder: .init(self.placeholder), controlState: self.controlState, errorMessage: self.errorMessage, minTextEditorHeight: self.minTextEditorHeight, maxTextEditorHeight: self.maxTextEditorHeight, maxTextLength: self.maxTextLength, hintText: self.hintText, hidesReadOnlyHint: self.hidesReadOnlyHint, isCharCountEnabled: self.isCharCountEnabled, allowsBeyondLimit: self.allowsBeyondLimit, charCountReachLimitMessage: self.charCountReachLimitMessage, charCountBeyondLimitMsg: self.charCountBeyondLimitMsg, isAINoticeEnabled: self.isAINoticeEnabled), shouldApplyDefaultStyle: true)
    }
}

// MARK: KeyValueItemConfiguration

@MainActor extension KeyValueItemConfiguration {
    var _formView: FormView {
        FormView(.init(controlState: self.controlState, errorMessage: self.errorMessage), shouldApplyDefaultStyle: true)
    }
}

// MARK: LinearProgressIndicatorViewConfiguration

@MainActor extension LinearProgressIndicatorViewConfiguration {
    var _linearProgressIndicator: LinearProgressIndicator {
        LinearProgressIndicator(.init(indicatorProgress: self.$indicatorProgress), shouldApplyDefaultStyle: true)
    }
}

// MARK: ListPickerItemConfiguration

@MainActor extension ListPickerItemConfiguration {
    var _formView: FormView {
        FormView(.init(controlState: self.controlState, errorMessage: self.errorMessage), shouldApplyDefaultStyle: true)
    }
}

// MARK: NoteFormViewConfiguration

@MainActor extension NoteFormViewConfiguration {
    var _placeholderTextEditor: PlaceholderTextEditor {
        PlaceholderTextEditor(.init(text: self.$text, placeholder: .init(self.placeholder)), shouldApplyDefaultStyle: true)
    }

    var _formView: FormView {
        FormView(.init(controlState: self.controlState, errorMessage: self.errorMessage), shouldApplyDefaultStyle: true)
    }
}

// MARK: PlaceholderTextEditorConfiguration

@MainActor extension PlaceholderTextEditorConfiguration {
    var _textView: TextView {
        TextView(.init(text: self.$text), shouldApplyDefaultStyle: true)
    }
}

// MARK: PlaceholderTextFieldConfiguration

@MainActor extension PlaceholderTextFieldConfiguration {
    var _textInputField: TextInputField {
        TextInputField(.init(text: self.$text, isSecureEnabled: self.isSecureEnabled, formatter: self.formatter), shouldApplyDefaultStyle: true)
    }
}

// MARK: ProgressIndicatorConfiguration

@MainActor extension ProgressIndicatorConfiguration {
    var _progressIndicatorProtocol: ProgressIndicatorProtocol {
        ProgressIndicatorProtocol(.init(progress: self.$progress), shouldApplyDefaultStyle: true)
    }
}

// MARK: RatingControlFormViewConfiguration

@MainActor extension RatingControlFormViewConfiguration {
    var _ratingControl: RatingControl {
        RatingControl(.init(valueLabel: .init(self.valueLabel), onStarImage: .init(self.onStarImage), offStarImage: .init(self.offStarImage), halfStarImage: .init(self.halfStarImage), reviewCountLabel: .init(self.reviewCountLabel), rating: self.$rating, ratingControlStyle: self.ratingControlStyle, ratingBounds: self.ratingBounds, itemSize: self.itemSize, interItemSpacing: self.interItemSpacing, ratingValueFormat: self.ratingValueFormat, showsValueLabel: self.showsValueLabel, averageRating: self.averageRating, averageRatingFormat: self.averageRatingFormat, reviewCount: self.reviewCount, reviewCountFormat: self.reviewCountFormat, reviewCountCeiling: self.reviewCountCeiling, reviewCountCeilingFormat: self.reviewCountCeilingFormat, showsReviewCountLabel: self.showsReviewCountLabel), shouldApplyDefaultStyle: true)
    }
}

// MARK: SegmentedControlPickerConfiguration

@MainActor extension SegmentedControlPickerConfiguration {
    var _options: Options {
        Options(.init(options: self.options), shouldApplyDefaultStyle: true)
    }
}

// MARK: SideBarListItemConfiguration

@MainActor extension SideBarListItemConfiguration {
    var _switch: Switch {
        Switch(.init(isOn: self.$isOn), shouldApplyDefaultStyle: true)
    }
}

// MARK: StepperFieldConfiguration

@MainActor extension StepperFieldConfiguration {
    var _textInputField: TextInputField {
        TextInputField(.init(text: self.$text, isSecureEnabled: self.isSecureEnabled, formatter: self.formatter), shouldApplyDefaultStyle: true)
    }
}

// MARK: StepperViewConfiguration

@MainActor extension StepperViewConfiguration {
    var _stepperField: StepperField {
        StepperField(.init(decrementAction: .init(self.decrementAction), text: self.$text, isSecureEnabled: self.isSecureEnabled, formatter: self.formatter, incrementAction: .init(self.incrementAction), step: self.step, stepRange: self.stepRange, isDecimalSupported: self.isDecimalSupported), shouldApplyDefaultStyle: true)
    }

    var _informationView: InformationView {
        InformationView(.init(icon: .init(self.icon), description: .init(self.description)), shouldApplyDefaultStyle: true)
    }
}

// MARK: SwitchViewConfiguration

@MainActor extension SwitchViewConfiguration {
    var _informationView: InformationView {
        InformationView(.init(icon: .init(self.icon), description: .init(self.description)), shouldApplyDefaultStyle: true)
    }

    var _switch: Switch {
        Switch(.init(isOn: self.$isOn), shouldApplyDefaultStyle: true)
    }
}

// MARK: TextFieldFormViewConfiguration

@MainActor extension TextFieldFormViewConfiguration {
    var _titleFormView: TitleFormView {
        TitleFormView(.init(text: self.$text, isSecureEnabled: self.isSecureEnabled, formatter: self.formatter, placeholder: .init(self.placeholder), controlState: self.controlState, errorMessage: self.errorMessage, maxTextLength: self.maxTextLength, hintText: self.hintText, hidesReadOnlyHint: self.hidesReadOnlyHint, isCharCountEnabled: self.isCharCountEnabled, allowsBeyondLimit: self.allowsBeyondLimit, charCountReachLimitMessage: self.charCountReachLimitMessage, charCountBeyondLimitMsg: self.charCountBeyondLimitMsg, isAINoticeEnabled: self.isAINoticeEnabled), shouldApplyDefaultStyle: true)
    }
}

// MARK: TextInputInfoViewConfiguration

@MainActor extension TextInputInfoViewConfiguration {
    var _informationView: InformationView {
        InformationView(.init(icon: .init(self.icon), description: .init(self.description)), shouldApplyDefaultStyle: true)
    }
}

// MARK: TitleFormViewConfiguration

@MainActor extension TitleFormViewConfiguration {
    var _placeholderTextField: PlaceholderTextField {
        PlaceholderTextField(.init(text: self.$text, isSecureEnabled: self.isSecureEnabled, formatter: self.formatter, placeholder: .init(self.placeholder)), shouldApplyDefaultStyle: true)
    }

    var _formView: FormView {
        FormView(.init(controlState: self.controlState, errorMessage: self.errorMessage), shouldApplyDefaultStyle: true)
    }
}

// MARK: ValuePickerConfiguration

@MainActor extension ValuePickerConfiguration {
    var _options: Options {
        Options(.init(options: self.options), shouldApplyDefaultStyle: true)
    }
}
