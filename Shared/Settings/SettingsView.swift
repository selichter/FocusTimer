//
//  SettingsView.swift
//  FocusTimer
//
//  Created by Sarah Lichter on 6/8/21.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var vm = SettingsViewModel()
    let formatter = NumberFormatter()
    
    
    var body: some View {
        
        
        Form {
            Text("Configure Your Timer")
                .bold()
            
            HStack {
                Text("Focus Time in Minutes:")
                    .bold()
                
                TextField("\(vm.workTime)",
                          value: $vm.workTime,
                          formatter: formatter)
                    .keyboardType(.numberPad)
                    
            }
            
            HStack {
                Text("Break Time in Minutes:")
                    .bold()
                TextField("\(vm.breakTime)",
                          value: $vm.breakTime,
                          formatter: formatter)
                    .keyboardType(.numberPad)
            }
            
            HStack {
                Text("Number of Rounds:")
                    .bold()
                TextField("\(vm.numberOfRounds)",
                          value: $vm.numberOfRounds,
                          formatter: formatter)
                    .keyboardType(.numberPad)
            }
        }
        
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
