//
//  SettingsViewModel.swift
//  FocusTimer
//
//  Created by Sarah Lichter on 6/8/21.
//

import Foundation

class SettingsViewModel: ObservableObject {
    @Published var numberOfRounds = 3
    @Published var workTime = 25
    @Published var breakTime = 5
    
}
