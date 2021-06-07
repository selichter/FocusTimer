//
//  TimerMode.swift
//  FocusTimer
//
//  Created by Sarah Lichter on 5/30/21.
//

import Foundation

enum TimerMode {
    case running, stopped
}


enum TimerType {
    case work, rest
}

enum TimerStatus {
    case pending, inProgress, completed
}

struct FocusTimer {
    var type: TimerType
    var secondsRemaining: Double
    var status: TimerStatus
}
