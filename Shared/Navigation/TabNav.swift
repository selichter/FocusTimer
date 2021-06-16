//
//  TabNav.swift
//  FocusTimer
//
//  Created by Sarah Lichter on 6/15/21.
//

import SwiftUI

struct TabNav: View {
    var body: some View {
        TabView {
            TimerView()
                .tabItem {
                    Label("Timer", systemImage: "deskclock.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}

struct TabNav_Previews: PreviewProvider {
    static var previews: some View {
        TabNav()
    }
}
