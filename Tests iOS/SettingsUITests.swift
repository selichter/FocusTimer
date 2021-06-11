//
//  SettingsUITests.swift
//  Tests iOS
//
//  Created by Sarah Lichter on 6/11/21.
//

import XCTest

class SettingsUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        app.launch()
        app.buttons["gearshape.fill"].tap()
    }
    
    func testNavigateToSettingsView() {
        XCTAssert(app.staticTexts["Configure Your Timer"].exists)
        XCTAssert(app.staticTexts["Focus Time in Minutes:"].exists)
        XCTAssert(app.staticTexts["Break Time in Minutes:"].exists)
        XCTAssert(app.staticTexts["Number of Rounds:"].exists)
    }
    
    func testTextFieldsArePopulatedWithDefaults() {
        XCTAssertEqual(app.textFields["Focus Time in Minutes"].value as! String, "25")
        XCTAssertEqual(app.textFields["Break Time in Minutes"].value as! String, "5")
        XCTAssertEqual(app.textFields["Number of Rounds"].value as! String, "3")
    }
    
}
