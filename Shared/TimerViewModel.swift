//
//  TimerViewModel.swift
//  FocusTimer
//
//  Created by Sarah Lichter on 5/30/21.
//

import Foundation
import Combine

class TimerViewModel: ObservableObject {
    var totalTime: TimeInterval
    @Published var mode: TimerMode = .stopped
    @Published var timeString: String
    var timer: Timer?
    
    init(timerSeconds: TimeInterval = 10.0) {
        totalTime = timerSeconds
        timeString = formatTimeString(timerSeconds)
    }
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {_ in
            self.totalTime -= 1
            self.timeString = formatTimeString(self.totalTime)
        }
    }
    
    func stop() {
        mode = .stopped
        timer?.invalidate()
    }

}
