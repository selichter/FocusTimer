//
//  FocusTimerApp.swift
//  Shared
//
//  Created by Sarah Lichter on 5/25/21.
//

import SwiftUI

@main
struct FocusTimerApp: App {
    var body: some Scene {
        WindowGroup {
        #if os(iOS)
            TabNav()
        #else
            NavigationView {
                SidebarView()
            }
            .frame(minWidth: 400, minHeight: 200)
        #endif
        }
    }
}
