//
//  Tests_macOS.swift
//  Tests macOS
//
//  Created by Sarah Lichter on 5/25/21.
//

import XCTest

class Tests_macOS: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        app.launch()
    }
    
    func testTappingStartButtonStartsTimer() {
        let window = app.windows["FocusTimer"]
        XCTAssert(window.staticTexts["00:05"].exists)
        window.buttons["Start"].click()
        window.staticTexts["00:03"].waitForExistence(timeout: 2)
        XCTAssert(window.buttons["Stop"].exists)
    }
    
    func testStopButtonStopsTimeCount() {
        let window = app.windows["FocusTimer"]
        window.buttons["Start"].tap()
        sleep(2)
        window.buttons["Stop"].tap()
        XCTAssert(window.staticTexts["00:03"].exists)
        sleep(1)
        XCTAssert(window.staticTexts["00:03"].exists)
    }
    
    func testBreakIsLoadedAfterWorkTimerCompletes() {
        let window = app.windows["FocusTimer"]
        XCTAssert(window.staticTexts["Get Started"].exists)
        XCTAssert(app.staticTexts["00:05"].exists)
        window.buttons["Start"].tap()
        XCTAssert(window.buttons["Stop"].exists)
        sleep(6)
        XCTAssert(window.staticTexts["00:03"].exists)
        XCTAssert(window.buttons["Start"].exists)
        window.buttons["Start"].tap()
        XCTAssert(window.buttons["Stop"].exists)
        XCTAssert(window.staticTexts["Take a Break"].exists)
        
    }
}
