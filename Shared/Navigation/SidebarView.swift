//
//  SidebarView.swift
//  FocusTimer
//
//  Created by Sarah Lichter on 6/12/21.
//

import SwiftUI

struct SidebarView: View {
    @State var state: Screen? = Screen.timer
    @EnvironmentObject var settings: SettingsConfig
    
    var body: some View {
        List {
            NavigationLink(
                destination: TimerView(vm: TimerViewModel(workTime: settings.workTime,
                                                      breakTime: settings.breakTime,
                                                      numOfRounds: settings.numberOfRounds)),
                tag: Screen.timer,
                selection: $state,
                label: { Text("Timer") }
            )
            NavigationLink(
                destination: SettingsView(),
                tag: Screen.settings,
                selection: $state,
                label: { Text("Settings") }
            )
        }.listStyle(SidebarListStyle())
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
