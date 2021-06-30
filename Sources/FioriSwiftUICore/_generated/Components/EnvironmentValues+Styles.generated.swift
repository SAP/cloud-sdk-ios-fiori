// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension EnvironmentValues {

    public var titleModifier: AnyViewModifier {
        get { return self[TitleModifierKey.self] }
        set { self[TitleModifierKey.self] = newValue }
    }


    public var subtitleModifier: AnyViewModifier {
        get { return self[SubtitleModifierKey.self] }
        set { self[SubtitleModifierKey.self] = newValue }
    }


    public var tagsModifier: AnyViewModifier {
        get { return self[TagsModifierKey.self] }
        set { self[TagsModifierKey.self] = newValue }
    }


    public var footnoteModifier: AnyViewModifier {
        get { return self[FootnoteModifierKey.self] }
        set { self[FootnoteModifierKey.self] = newValue }
    }


    public var descriptionTextModifier: AnyViewModifier {
        get { return self[DescriptionTextModifierKey.self] }
        set { self[DescriptionTextModifierKey.self] = newValue }
    }


    public var detailImageModifier: AnyViewModifier {
        get { return self[DetailImageModifierKey.self] }
        set { self[DetailImageModifierKey.self] = newValue }
    }


    public var attributeModifier: AnyViewModifier {
        get { return self[AttributeModifierKey.self] }
        set { self[AttributeModifierKey.self] = newValue }
    }


    public var secondaryAttributeModifier: AnyViewModifier {
        get { return self[SecondaryAttributeModifierKey.self] }
        set { self[SecondaryAttributeModifierKey.self] = newValue }
    }


    public var timestampModifier: AnyViewModifier {
        get { return self[TimestampModifierKey.self] }
        set { self[TimestampModifierKey.self] = newValue }
    }


    public var secondaryTimestampModifier: AnyViewModifier {
        get { return self[SecondaryTimestampModifierKey.self] }
        set { self[SecondaryTimestampModifierKey.self] = newValue }
    }


    public var trendModifier: AnyViewModifier {
        get { return self[TrendModifierKey.self] }
        set { self[TrendModifierKey.self] = newValue }
    }


    public var trendImageModifier: AnyViewModifier {
        get { return self[TrendImageModifierKey.self] }
        set { self[TrendImageModifierKey.self] = newValue }
    }


    public var statusModifier: AnyViewModifier {
        get { return self[StatusModifierKey.self] }
        set { self[StatusModifierKey.self] = newValue }
    }


    public var substatusModifier: AnyViewModifier {
        get { return self[SubstatusModifierKey.self] }
        set { self[SubstatusModifierKey.self] = newValue }
    }


    public var bodyTextModifier: AnyViewModifier {
        get { return self[BodyTextModifierKey.self] }
        set { self[BodyTextModifierKey.self] = newValue }
    }


    public var iconModifier: AnyViewModifier {
        get { return self[IconModifierKey.self] }
        set { self[IconModifierKey.self] = newValue }
    }


    public var accessoryIconModifier: AnyViewModifier {
        get { return self[AccessoryIconModifierKey.self] }
        set { self[AccessoryIconModifierKey.self] = newValue }
    }


    public var iconsModifier: AnyViewModifier {
        get { return self[IconsModifierKey.self] }
        set { self[IconsModifierKey.self] = newValue }
    }


    public var actionTitleModifier: AnyViewModifier {
        get { return self[ActionTitleModifierKey.self] }
        set { self[ActionTitleModifierKey.self] = newValue }
    }


    public var seriesTitlesModifier: AnyViewModifier {
        get { return self[SeriesTitlesModifierKey.self] }
        set { self[SeriesTitlesModifierKey.self] = newValue }
    }


    public var keyModifier: AnyViewModifier {
        get { return self[KeyModifierKey.self] }
        set { self[KeyModifierKey.self] = newValue }
    }


    public var valueModifier: AnyViewModifier {
        get { return self[ValueModifierKey.self] }
        set { self[ValueModifierKey.self] = newValue }
    }


    public var valuesModifier: AnyViewModifier {
        get { return self[ValuesModifierKey.self] }
        set { self[ValuesModifierKey.self] = newValue }
    }


    public var valueAxisTitleModifier: AnyViewModifier {
        get { return self[ValueAxisTitleModifierKey.self] }
        set { self[ValueAxisTitleModifierKey.self] = newValue }
    }


    public var secondaryValuesAxisTitleModifier: AnyViewModifier {
        get { return self[SecondaryValuesAxisTitleModifierKey.self] }
        set { self[SecondaryValuesAxisTitleModifierKey.self] = newValue }
    }


    public var categoryAxisTitleModifier: AnyViewModifier {
        get { return self[CategoryAxisTitleModifierKey.self] }
        set { self[CategoryAxisTitleModifierKey.self] = newValue }
    }


    public var emptyTextModifier: AnyViewModifier {
        get { return self[EmptyTextModifierKey.self] }
        set { self[EmptyTextModifierKey.self] = newValue }
    }


    public var kpiModifier: AnyViewModifier {
        get { return self[KpiModifierKey.self] }
        set { self[KpiModifierKey.self] = newValue }
    }


    public var placeholderModifier: AnyViewModifier {
        get { return self[PlaceholderModifierKey.self] }
        set { self[PlaceholderModifierKey.self] = newValue }
    }


    public var lowerBoundTitleModifier: AnyViewModifier {
        get { return self[LowerBoundTitleModifierKey.self] }
        set { self[LowerBoundTitleModifierKey.self] = newValue }
    }


    public var upperBoundTitleModifier: AnyViewModifier {
        get { return self[UpperBoundTitleModifierKey.self] }
        set { self[UpperBoundTitleModifierKey.self] = newValue }
    }

}

public extension View {


    @ViewBuilder
    func titleModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.titleModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func subtitleModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.subtitleModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func tagsModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.tagsModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func footnoteModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.footnoteModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func descriptionTextModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.descriptionTextModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func detailImageModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.detailImageModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func attributeModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.attributeModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func secondaryAttributeModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.secondaryAttributeModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func timestampModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.timestampModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func secondaryTimestampModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.secondaryTimestampModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func trendModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.trendModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func trendImageModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.trendImageModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func statusModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.statusModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func substatusModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.substatusModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func bodyTextModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.bodyTextModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func iconModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.iconModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func accessoryIconModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.accessoryIconModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func iconsModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.iconsModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func actionTitleModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.actionTitleModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func seriesTitlesModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.seriesTitlesModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func keyModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.keyModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func valueModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.valueModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func valuesModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.valuesModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func valueAxisTitleModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.valueAxisTitleModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func secondaryValuesAxisTitleModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.secondaryValuesAxisTitleModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func categoryAxisTitleModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.categoryAxisTitleModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func emptyTextModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.emptyTextModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func kpiModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.kpiModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func placeholderModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.placeholderModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func lowerBoundTitleModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.lowerBoundTitleModifier, AnyViewModifier(transform))
    }



    @ViewBuilder
    func upperBoundTitleModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
        self.environment(\.upperBoundTitleModifier, AnyViewModifier(transform))
    }

}




	extension EnvironmentValues {

		public var actionTextModifier: AnyViewModifier {
			get { return self[ActionTextModifierKey.self] }
			set { self[ActionTextModifierKey.self] = newValue }
		}

	}

	public extension View {


		@ViewBuilder
		func actionTextModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
			self.environment(\.actionTextModifier, AnyViewModifier(transform))
		}

	}


	extension EnvironmentValues {

		public var actionItemsModifier: AnyViewModifier {
			get { return self[ActionItemsModifierKey.self] }
			set { self[ActionItemsModifierKey.self] = newValue }
		}

	}

	public extension View {


		@ViewBuilder
		func actionItemsModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
			self.environment(\.actionItemsModifier, AnyViewModifier(transform))
		}

	}


	extension EnvironmentValues {

		public var htmlContentModifier: AnyViewModifier {
			get { return self[HtmlContentModifierKey.self] }
			set { self[HtmlContentModifierKey.self] = newValue }
		}

	}

	public extension View {


		@ViewBuilder
		func htmlContentModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
			self.environment(\.htmlContentModifier, AnyViewModifier(transform))
		}

	}


	extension EnvironmentValues {
	}

	public extension View {
	}


	extension EnvironmentValues {

		public var progressIndicatorTextModifier: AnyViewModifier {
			get { return self[ProgressIndicatorTextModifierKey.self] }
			set { self[ProgressIndicatorTextModifierKey.self] = newValue }
		}

	}

	public extension View {


		@ViewBuilder
		func progressIndicatorTextModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
			self.environment(\.progressIndicatorTextModifier, AnyViewModifier(transform))
		}

	}


	extension EnvironmentValues {

		public var secondaryActionTextModifier: AnyViewModifier {
			get { return self[SecondaryActionTextModifierKey.self] }
			set { self[SecondaryActionTextModifierKey.self] = newValue }
		}

	}

	public extension View {


		@ViewBuilder
		func secondaryActionTextModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
			self.environment(\.secondaryActionTextModifier, AnyViewModifier(transform))
		}

	}


	extension EnvironmentValues {

		public var textInputValueModifier: AnyViewModifier {
			get { return self[TextInputValueModifierKey.self] }
			set { self[TextInputValueModifierKey.self] = newValue }
		}

	}

	public extension View {


		@ViewBuilder
		func textInputValueModifier<V: View>(_ transform: @escaping (AnyViewModifier.Content) -> V) -> some View {
			self.environment(\.textInputValueModifier, AnyViewModifier(transform))
		}

	}
