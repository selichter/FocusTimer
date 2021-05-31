//
//  TimerView.swift
//  FocusTimer
//
//  Created by Sarah Lichter on 5/30/21.
//

import SwiftUI

struct TimerView: View {
    @StateObject private var vm = TimerViewModel(timerSeconds: 1500.00)

    var body: some View {
        VStack {
            HStack(spacing: 40) {
                VStack(alignment: .leading) {
                    Text("Focus Time")
                        .font(.caption)
                    Text(vm.timeString)
                        .font(.system(size: 64, weight: .bold))
                        .fontWeight(.bold)
                }
            }
            .padding()
            if vm.mode == .stopped {
                Button(action: vm.start) {
                    HStack {
                        Image(systemName: "play.fill")
                            .font(.system(size: 24, weight: .bold))
                        Text("Start")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .padding()
                .cornerRadius(40)
            }
            
            if vm.mode == .running {
                Button(action: vm.stop) {
                    HStack {
                        Image(systemName: "stop.fill")
                            .font(.system(size: 24, weight: .bold))
                        Text("Stop")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .padding()
                .cornerRadius(40)
            }
            
        }

    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
