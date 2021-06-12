//
//  NavigationUITests.swift
//  Tests macOS
//
//  Created by Sarah Lichter on 6/12/21.
//

import XCTest
import SwiftUI

class NavigationUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        app.launch()
    }
    
    func testSidebarDisplaysNavList() {
        let window = app.windows["FocusTimer"]
        XCTAssert(window.staticTexts["Get Started"].exists)
        
        window.outlines.buttons["Settings"].click()
        XCTAssert(window.staticTexts["Configure Your Timer"].exists)
        
        window.outlines.buttons["Timer"].click()
        XCTAssert(window.staticTexts["Get Started"].exists)  
    }
    
}
