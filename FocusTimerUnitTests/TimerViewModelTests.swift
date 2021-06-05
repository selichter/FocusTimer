//
//  TimerViewModelTests.swift
//  FocusTimerUnitTests
//
//  Created by Sarah Lichter on 6/4/21.
//

import XCTest
import Combine
@testable import FocusTimer

class TimerViewModelTests: XCTestCase {
    var timerViewModel: TimerViewModel!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        timerViewModel = TimerViewModel(timerSeconds: 5)
        cancellables = []
    }
    
    func testTimerViewModelEmitsTimeStrings() {
        var expectedValues = ["00:05", "00:04", "00:03", "00:02", "00:01", "00:00"]
        let receivedAllValues = expectation(description: "all values received")

        timerViewModel.start()
        timerViewModel.$timeString.sink(receiveValue: { value in
            guard  expectedValues.first != nil else {
            XCTFail("Received more values than expected.")
            return
          }
          
          expectedValues = Array(expectedValues.dropFirst())

          if expectedValues.isEmpty {
            receivedAllValues.fulfill()
          }
        }).store(in: &cancellables)

        waitForExpectations(timeout: 6, handler: nil)
      }
}
