//
//  Widget.swift
//  VineyardInternal
//
//  Created by Vishnesh Jayanthi Ramanathan on 29/09/24.
//

import SwiftUI

protocol Widget {
    var title: String { get }
    func renderContent() -> AnyView
}

struct TodaysTasksWidget: Widget {
    var title: String = "Today's Tasks"

    func renderContent() -> AnyView {
        AnyView(
            VStack {
                Text(title).font(.headline)
                HStack {
                    Text("Drink 5 cups of water")
                    Spacer()
                    Text("John's Group")
                }
                .padding()
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
        )
    }
}

struct RecentActivitiesWidget: Widget {
    var title: String = "Recent Activities"

    func renderContent() -> AnyView {
        AnyView(
            VStack {
                Text(title).font(.headline)
                HStack {
                    Text("Amy")
                    Spacer()
                    Text("30 min")
                }
                .padding()
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
        )
    }
}

