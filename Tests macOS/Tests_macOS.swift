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
        XCTAssert(window.staticTexts["25:00"].exists)
        window.buttons["Start"].click()
        window.staticTexts["24:58"].waitForExistence(timeout: 2)
        XCTAssert(window.buttons["Stop"].exists)
    }
    
    func testStopButtonStopsTimeCount() {
        let window = app.windows["FocusTimer"]
        window.buttons["Start"].tap()
        sleep(2)
        window.buttons["Stop"].tap()
        XCTAssert(window.staticTexts["24:58"].exists)
        sleep(1)
        XCTAssert(window.staticTexts["24:58"].exists)
    }
    
    func testUpdatingSettingsValuesUpdatesTimer() {
        let window = app.windows["FocusTimer"]
        
        XCTAssert(window.staticTexts["25:00"].exists)
        window.outlines.buttons["Settings"].click()
        
        app.textFields["Focus Time in Minutes"].click()
        app.textFields["Focus Time in Minutes"].clear()
        app.textFields["Focus Time in Minutes"].typeText("22")
        
        window.outlines.buttons["Timer"].click()
        XCTAssert(window.staticTexts["22:00"].exists)
    }
}

extension XCUIElement {
    public func clear() {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }

        let lowerRightCorner = self.coordinate(withNormalizedOffset: CGVector(dx: 0.9, dy: 0.9))
        lowerRightCorner.tap()

        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        self.typeText(deleteString)
    }
}
