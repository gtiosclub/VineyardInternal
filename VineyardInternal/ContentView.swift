//
//  ContentView.swift
//  VineyardInternal
//
//  Created by Vishnesh Jayanthi Ramanathan on 11/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            DashboardView()
                .tabItem{
                    Label("Dashboard", systemImage: "flame")
                }
                .tag(0)
            GroupView()
                .tabItem{
                    Label("Groups", systemImage: "person.3.fill")
                }
                .tag(1)
        }
    }
}

#Preview {
    ContentView()
}
