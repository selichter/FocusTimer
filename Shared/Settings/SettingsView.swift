//
//  SettingsView.swift
//  FocusTimer
//
//  Created by Sarah Lichter on 6/8/21.
//

import SwiftUI

struct SettingsView: View {
    @State private var vm = SettingsViewModel()
    let formatter = NumberFormatter()
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 15) {
            Text("Configure Your Timer")
                .bold()
            
            HStack {
                Text("Focus Time:")
                    .bold()
                Text("\(vm.workTime) Minutes")
                
                TextField(vm.workTime,
                          value: vm.workTime,
                          formatter: formatter)

            }
            
            HStack {
                Text("Break Time:")
                    .bold()
                Text("\(vm.breakTime) Minutes")
            }
            
            HStack {
                Text("Number of Rounds:")
                    .bold()
                Text("\(vm.numberOfRounds)")
            }
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
