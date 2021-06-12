//
//  TimeUtils.swift
//  FocusTimerUnitTests
//
//  Created by Sarah Lichter on 5/31/21.
//

import Foundation

func formatTimeString(_ timeInterval: TimeInterval) -> String {
    if timeInterval < 10 {
        return "00:0\(Int(timeInterval))"
    } else if timeInterval < 60 {
        return "00:\(Int(timeInterval))"
    }
    let timeFormatter = DateComponentsFormatter()
    return timeFormatter.string(from: timeInterval) ?? ""
}
