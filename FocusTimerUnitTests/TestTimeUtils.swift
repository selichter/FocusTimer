//
//  TestTimeUtils.swift
//  FocusTimerUnitTests
//
//  Created by Sarah Lichter on 5/31/21.
//

import XCTest
@testable import FocusTimer

class TimeUtilTests: XCTestCase {
        
    func testFormatTimeStringConvertsIntToString() {
        let twentyFiveMinutes = 1500.00
        let formattedTime = formatTimeString(twentyFiveMinutes)
        XCTAssertEqual(formattedTime, "25:00")
    }

    func testFormatTimeStringFormatsTimeLessThanOneMinute() {
        let time: TimeInterval = 54.00
        let formattedTime = formatTimeString(time)
        XCTAssertEqual(formattedTime, "00:54")
    }
    
}
