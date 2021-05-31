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

    func testAppLoadsWithElements() throws {
        XCTAssert(app.staticTexts["Focus Time"].exists)
        XCTAssert(app.staticTexts["25:00"].exists)
        XCTAssert(app.buttons["Start"].exists)
    }
    
    func testTappingStartButtonStartsTimer() {
        XCTAssert(app.staticTexts["25:00"].exists)
        app.buttons["Start"].tap()
        app.staticTexts["24:58"].waitForExistence(timeout: 2)
        XCTAssert(app.buttons["Stop"].exists)
    }
    
    func testStopButtonStopsTimeCount() {
        app.buttons["Start"].tap()
        sleep(2)
        app.buttons["Stop"].tap()
        XCTAssert(app.staticTexts["24:58"].exists)
        sleep(1)
        XCTAssert(app.staticTexts["24:58"].exists)
    }

}
