//
//  TimerView.swift
//  FocusTimer
//
//  Created by Sarah Lichter on 5/30/21.
//

import SwiftUI

struct TimerView: View {
    @StateObject private var vm = TimerViewModel()
    @State private var showSettingsView = false

    var body: some View {
        VStack {
            HStack(spacing: 40) {
                VStack(alignment: .leading) {
                    Text(vm.timerHeading)
                        .font(.caption)
                    Text(vm.timeString)
                        .font(.system(size: 64, weight: .bold))
                        .fontWeight(.bold)
                }
            }
            .padding()
            
            switch vm.mode {
            case .stopped:
                PrimaryButton(action: vm.start,
                              buttonText: "Start",
                              imageName: "play.fill")
            case .running:
                PrimaryButton(action: vm.stop,
                              buttonText: "Stop",
                              imageName: "stop.fill")
            
            }
        }
    }
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

