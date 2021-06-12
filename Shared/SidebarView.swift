//
//  SidebarView.swift
//  FocusTimer
//
//  Created by Sarah Lichter on 6/12/21.
//

import SwiftUI

struct SidebarView: View {
    @State var state: Screen? = Screen.timer
    
    var body: some View {
        List {
            NavigationLink(
                destination: TimerView(),
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
