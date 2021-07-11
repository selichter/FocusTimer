//
//  TimerViewModel.swift
//  FocusTimer
//
//  Created by Sarah Lichter on 5/30/21.
//

import Foundation
import Combine
import AVFoundation

class TimerViewModel: ObservableObject {
    
    @Published var mode: TimerMode = .stopped
    @Published var timeString: String = ""
    @Published var timerHeading: String = ""
    
    var totalTime: TimeInterval?
    var timer: Timer?
    var round: [FocusTimer] = []
    var completedTimers: [FocusTimer] = []
    
    
    init(workTime: Int, breakTime: Int, numOfRounds: Int) {
        loadTimers(workTime, breakTime, numOfRounds)
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
        AudioServicesPlaySystemSound(1016)
        timer?.invalidate()
    }
    
    func loadTimers(_ workTime: Int, _ breakTime: Int, _ numOfRounds: Int) {
        round = [FocusTimer(type: .work, secondsRemaining: Double(workTime * 60), status: .pending),
                FocusTimer(type: .rest, secondsRemaining: Double(breakTime * 60), status: .pending),
                FocusTimer(type: .work, secondsRemaining: Double(workTime * 60), status: .pending),
                FocusTimer(type: .rest, secondsRemaining: Double(breakTime * 60), status: .pending),
                FocusTimer(type: .work, secondsRemaining: Double(workTime * 60), status: .pending),
                FocusTimer(type: .rest, secondsRemaining: Double(breakTime * 60), status: .pending)
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
