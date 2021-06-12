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
                TextField("Focus Time in Minutes",
                          value: $vm.workTime,
                          formatter: formatter)
                    .accessibility(identifier: "Focus Time in Minutes")
                    
            }
            
            HStack {
                Text("Break Time in Minutes:")
                    .bold()
                TextField("Break Time in Minutes",
                          value: $vm.breakTime,
                          formatter: formatter)
            }
            
            HStack {
                Text("Number of Rounds:")
                    .bold()
                TextField("Number of Rounds",
                          value: $vm.numberOfRounds,
                          formatter: formatter)
                    .accessibility(identifier: "Number of Rounds")
            }
            
        }
        
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
