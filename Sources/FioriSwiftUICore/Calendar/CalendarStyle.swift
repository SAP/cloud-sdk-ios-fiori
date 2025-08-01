import Foundation

/**
 The enum denoting `CalendarStyle`.
 */
public enum CalendarStyle {
    /**
     Creates a calendar displaying one month at a time on the screen with vertical scrolling enabled. Allows for single selection only.
     */
    case month

    /**
     Creates a calendar displaying months on the full screen of the device with vertical scrolling enabled.

     Allows single selection only.
     */
    case fullScreenMonth

    /**
     Creates a calendar displaying one week at a time on the screen with horizontal scrolling enabled. Allows for single selection only.
     */
    case week

    /**
     Creates a calendar displaying one month at a time on the screen with horizontal scrolling enabled, which can be transitioned to a week view and vice versa using the provided handle. Allows for single selection only.
     */
    case expandable
    
    /**
     Creates a calendar displaying each month on the screen with vertical scrolling enabled and occupies the entire height of the screen. This view allows for the selection of a single range of contiguous dates.
     */
    case rangeSelection

    /**
     Creates a calendar displaying each month on the screen with vertical scrolling enabled and occupies the entire height of the screen. This view allows for selecting a non-contiguous set of dates.
     */
    case datesSelection
}
