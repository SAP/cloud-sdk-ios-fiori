//
//  CalendarDayViewTests.swift
//  FioriSwiftUI
//
//  Created by Zhang, Hengyi (external - Project) on 2025/10/28.
//
@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class CalendarDayViewTests: XCTestCase {
    func testCalendarDayView_DefaultInitialization() {
        let dayView = CalendarDayView(title: "28")
        XCTAssertNotNil(dayView)
        XCTAssertNotNil(dayView.title)
        XCTAssertTrue(dayView.subtitle.isEmpty)
        XCTAssertFalse(dayView.isEventIndicatorVisible)
        XCTAssertEqual(dayView.state, .normal)
        XCTAssertTrue(dayView.customEventView.isEmpty)
        XCTAssertNotNil(dayView.body)
    }
    
    func testCalendarDayView_FullConfiguration() {
        let dayView = CalendarDayView(title: "28", subtitle: "08", isEventIndicatorVisible: true, state: .today, customEventView: Rectangle().aspectRatio(contentMode: .fit).frame(width: 5, height: 5).foregroundStyle(Color(UIColor.red)))
        XCTAssertNotNil(dayView)
        XCTAssertNotNil(dayView.title)
        XCTAssertFalse(dayView.subtitle.isEmpty)
        XCTAssertTrue(dayView.isEventIndicatorVisible)
        XCTAssertEqual(dayView.state, .today)
        XCTAssertFalse(dayView.customEventView.isEmpty)
    }
    
    func testAnyCalendarDayViewStyle() {
        let style = AnyCalendarDayViewStyle { _ in
            EmptyView()
        }
        let view = style.makeBody(self.configuration)
        XCTAssertNotNil(view)
    }
    
    func testCalendarDayViewConfiguration() {
        let configuration = CalendarDayViewConfiguration(
            title: CalendarDayViewConfiguration.Title(Text("28")),
            subtitle: CalendarDayViewConfiguration.Subtitle(Text("08")),
            isEventIndicatorVisible: true,
            state: .singleSelected,
            customEventView: Rectangle().aspectRatio(contentMode: .fit).frame(width: 5, height: 5).foregroundStyle(Color(UIColor.red))
        )
        XCTAssertNotNil(configuration)
        XCTAssertNotNil(configuration.title)
        XCTAssertFalse(configuration.subtitle.isEmpty)
        XCTAssertTrue(configuration.isEventIndicatorVisible)
        XCTAssertEqual(configuration.state, .singleSelected)
        XCTAssertFalse(configuration.customEventView.isEmpty)
        
        let style = CalendarDayViewBaseStyle()
        let view = style.makeBody(configuration)
        XCTAssertNotNil(view)
        XCTAssertNotEqual(style.scaleForSizeChange, 0.0)
        XCTAssertNotNil(style.eventForegroundColor(configuration))
        XCTAssertNotNil(style.multiSelectedBackgroundColor(configuration))
        
        let dayView = CalendarDayView(configuration, shouldApplyDefaultStyle: false)
        XCTAssertNotNil(dayView.body)
        
        let dayView2 = CalendarDayView(configuration, shouldApplyDefaultStyle: true)
        XCTAssertNotNil(dayView2.body)
        
        XCTAssertTrue(configuration.isDirectChild("fiori_calendardayview_component"))
    }
    
    func testCalendarDayViewConfiguration_singleSelectedAndToday() {
        let configuration = CalendarDayViewConfiguration(
            title: CalendarDayViewConfiguration.Title(Text("28")),
            subtitle: CalendarDayViewConfiguration.Subtitle(Text("08")),
            isEventIndicatorVisible: true,
            state: .singleSelectedAndToday,
            customEventView: Rectangle().aspectRatio(contentMode: .fit).frame(width: 5, height: 5).foregroundStyle(Color(UIColor.red))
        )
        XCTAssertNotNil(configuration)
        
        let style = CalendarDayViewBaseStyle()
        let view = style.makeBody(configuration)
        XCTAssertNotNil(view)
    }
    
    func testCalendarDayViewConfiguration_multiSelectedStart() {
        let configuration = CalendarDayViewConfiguration(
            title: CalendarDayViewConfiguration.Title(Text("28")),
            subtitle: CalendarDayViewConfiguration.Subtitle(Text("08")),
            isEventIndicatorVisible: true,
            state: .multiSelectedStart,
            customEventView: Rectangle().aspectRatio(contentMode: .fit).frame(width: 5, height: 5).foregroundStyle(Color(UIColor.red))
        )
        XCTAssertNotNil(configuration)
        let style = CalendarDayViewBaseStyle()
        let view = style.makeBody(configuration)
        XCTAssertNotNil(view)
    }
    
    var configuration = CalendarDayViewConfiguration(
        title: CalendarDayViewConfiguration.Title(Text("28")),
        subtitle: CalendarDayViewConfiguration.Subtitle(Text("08")),
        isEventIndicatorVisible: true,
        state: .normal,
        customEventView: Rectangle().aspectRatio(contentMode: .fit).frame(width: 5, height: 5).foregroundStyle(Color(UIColor.red))
    )
    
    func testCalendarDayViewFioriStyle_ContentFioriStyle() {
        let contentFioriStyle = CalendarDayViewFioriStyle.ContentFioriStyle()
        let view = contentFioriStyle.makeBody(self.configuration)
        XCTAssertNotNil(view)
        
        let fioriStyle = CalendarDayViewFioriStyle()
        let v2 = fioriStyle.makeBody(self.configuration)
        XCTAssertNotNil(v2)
    }
    
    func titleColor(state: CalendarDayState) -> Color {
        let configuration = CalendarDayViewConfiguration(
            title: CalendarDayViewConfiguration.Title(Text("28")),
            subtitle: CalendarDayViewConfiguration.Subtitle(Text("08")),
            isEventIndicatorVisible: true,
            state: state,
            customEventView: EmptyView()
        )
        let style = CalendarDayViewFioriStyle.TitleFioriStyle(calendarDayViewConfiguration: configuration)
        return style.titleColor
    }
    
    func testCalendarDayViewFioriStyle_TitleFioriStyle() {
        let style = CalendarDayViewFioriStyle.TitleFioriStyle(calendarDayViewConfiguration: self.configuration)
        let view = style.makeBody(TitleConfiguration(title: self.configuration.title))
        XCTAssertNotNil(view)
        XCTAssertNotEqual(style.titleFontSize, 0.0)
        XCTAssertEqual(style.titleWeight, .regular)
        XCTAssertNotEqual(style.scaleForSizeChange, 0.0)
        
        XCTAssertNotNil(self.titleColor(state: .normal))
        XCTAssertNotNil(self.titleColor(state: .today))
        XCTAssertNotNil(self.titleColor(state: .singleSelected))
        XCTAssertNotNil(self.titleColor(state: .disabled))
        XCTAssertNotNil(self.titleColor(state: .outOfMonth))
    }
    
    func subtitleColor(state: CalendarDayState) -> Color {
        let configuration = CalendarDayViewConfiguration(
            title: CalendarDayViewConfiguration.Title(Text("28")),
            subtitle: CalendarDayViewConfiguration.Subtitle(Text("08")),
            isEventIndicatorVisible: true,
            state: state,
            customEventView: EmptyView()
        )
        let style = CalendarDayViewFioriStyle.SubtitleFioriStyle(calendarDayViewConfiguration: configuration)
        return style.titleColor
    }
    
    func testCalendarDayViewFioriStyle_SubtitleFioriStyle() {
        let style = CalendarDayViewFioriStyle.SubtitleFioriStyle(calendarDayViewConfiguration: self.configuration)
        let view = style.makeBody(SubtitleConfiguration(subtitle: self.configuration.subtitle))
        XCTAssertNotNil(view)
        XCTAssertNotEqual(style.scaleForSizeChange, 0.0)
        
        XCTAssertNotNil(self.titleColor(state: .normal))
        XCTAssertNotNil(self.titleColor(state: .today))
        XCTAssertNotNil(self.titleColor(state: .singleSelected))
        XCTAssertNotNil(self.titleColor(state: .disabled))
        XCTAssertNotNil(self.titleColor(state: .outOfMonth))
    }
}
