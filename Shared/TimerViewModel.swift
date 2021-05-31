//
//  TimerViewModel.swift
//  FocusTimer
//
//  Created by Sarah Lichter on 5/30/21.
//

import Foundation
import Combine

class TimerViewModel: ObservableObject {
    @Published var timeString: String = "25:00"
    @Published var mode: TimerMode = .stopped
    
    var secondsRemaining: TimeInterval
    var timerPublisher = Timer.publish(every: 1.0, on: .main, in: .common)
    var timerCancellable: Cancellable?
    var cancellables: Set<AnyCancellable> = []
    

    init(timerSeconds: TimeInterval) {
        secondsRemaining = timerSeconds
        
        timerPublisher
            .sink { [unowned self] timer in
                self.secondsRemaining -= 1.0
                self.timeString = formatTimeString(self.secondsRemaining)
            }
            .store(in: &cancellables)
    }
    
    func start() {
        mode = .running
        timerCancellable = timerPublisher.connect()
    }
    
    func stop() {
        mode = .stopped
        timerCancellable?.cancel()
    }

}


