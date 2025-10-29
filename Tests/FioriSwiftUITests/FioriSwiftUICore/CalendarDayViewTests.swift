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
    
    func testCalendarDayViewConfiguration() {
        let configuration = CalendarDayViewConfiguration(
            title: CalendarDayViewConfiguration.Title(Text("28")),
            subtitle: CalendarDayViewConfiguration.Subtitle(Text("08")),
            isEventIndicatorVisible: true,
            state: .today,
            customEventView: Rectangle().aspectRatio(contentMode: .fit).frame(width: 5, height: 5).foregroundStyle(Color(UIColor.red))
        )
        XCTAssertNotNil(configuration)
        XCTAssertNotNil(configuration.title)
        XCTAssertFalse(configuration.subtitle.isEmpty)
        XCTAssertTrue(configuration.isEventIndicatorVisible)
        XCTAssertEqual(configuration.state, .today)
        XCTAssertFalse(configuration.customEventView.isEmpty)
    }
}
