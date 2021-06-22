//
//  TimerViewModel.swift
//  FocusTimer
//
//  Created by Sarah Lichter on 5/30/21.
//

import Foundation
import Combine

class TimerViewModel: ObservableObject {
    
    @Published var mode: TimerMode = .stopped
    @Published var timeString: String = ""
    @Published var timerHeading: String = ""
    
    var totalTime: TimeInterval?
    var timer: Timer?
    var round: [FocusTimer] = []
    var completedTimers: [FocusTimer] = []
    
    
    init() {
        loadTimers()
        setTimeValues(secondsRemaining: round.first?.secondsRemaining ?? 0)
        timerHeading = "Get Started"
    }
    
    func start() {
        mode = .running
        timerHeading = round.first?.type == .work ?  "Focus Time" : "Take a Break"
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {_ in
            if self.totalTime! > 0 {
                self.totalTime! -= 1
                self.timeString = formatTimeString(self.totalTime!)
            } else {
                self.stop()
                self.advanceTimer()
            }
        }
    }
    
    func stop() {
        mode = .stopped
        timer?.invalidate()
    }
    
    func loadTimers() {
        round = [FocusTimer(type: .work, secondsRemaining: 5, status: .pending),
                FocusTimer(type: .rest, secondsRemaining: 3, status: .pending),
                FocusTimer(type: .work, secondsRemaining: 5, status: .pending),
                FocusTimer(type: .rest, secondsRemaining: 3, status: .pending),
                FocusTimer(type: .work, secondsRemaining: 5, status: .pending),
                FocusTimer(type: .rest, secondsRemaining: 7, status: .pending)
            ]
    }
    
    func advanceTimer()  {
        var completed = round.removeFirst()
        completed.status = .completed
        completedTimers.append(completed)
        
        var nextTimer = round.first
        nextTimer?.status = .inProgress
        
        setTimeValues(secondsRemaining: nextTimer?.secondsRemaining ?? 0)
    }
    
    func setTimeValues(secondsRemaining: TimeInterval) {
        totalTime = secondsRemaining
        timeString = formatTimeString(secondsRemaining)
    }

}
