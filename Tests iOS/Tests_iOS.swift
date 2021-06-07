//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Sarah Lichter on 5/25/21.
//

import XCTest

class Tests_iOS: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        app.launch()
    }
    
    func testTappingStartButtonStartsTimer() {
        XCTAssert(app.staticTexts["00:05"].exists)
        app.buttons["Start"].tap()
        app.staticTexts["00:03"].waitForExistence(timeout: 2)
        XCTAssert(app.staticTexts["Focus Time"].exists)
        XCTAssert(app.buttons["Stop"].exists)
    }
    
    func testStopButtonStopsTimeCount() {
        app.buttons["Start"].tap()
        sleep(2)
        app.buttons["Stop"].tap()
        XCTAssert(app.staticTexts["00:03"].exists)
        sleep(1)
        XCTAssert(app.staticTexts["00:03"].exists)
    }
    
    func testBreakIsLoadedAfterWorkTimerCompletes() {
        XCTAssert(app.staticTexts["Get Started"].exists)
        XCTAssert(app.staticTexts["00:05"].exists)
        app.buttons["Start"].tap()
        XCTAssert(app.buttons["Stop"].exists)
        sleep(6)
        XCTAssert(app.staticTexts["00:03"].exists)
        XCTAssert(app.buttons["Start"].exists)
        app.buttons["Start"].tap()
        XCTAssert(app.buttons["Stop"].exists)
        XCTAssert(app.staticTexts["Take a Break"].exists)
        
    }

}
