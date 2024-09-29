//
//  DashboardView.swift
//  VineyardInternal
//
//  Created by Vishnesh Jayanthi Ramanathan on 29/09/24.
//

import SwiftUI

struct DashboardView: View {
    private var widgets: [Widget] = [TodaysTasksWidget(), RecentActivitiesWidget()]

    var body: some View {
        ScrollView {
            HStack{
                VStack(alignment: .leading) {
                    Text("Dashboard")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("29 September, 2024") // Need to change this to display the current date
                        .font(.subheadline)
                }
                .padding()
                Spacer()
                Button(action: {
                }) {
                 Image(systemName: "ellipsis")
                     .font(.title)
                }
            }
            VStack(spacing: 20) {
                ForEach(widgets.indices, id: \.self) { index in
                    widgets[index].renderContent()
                }
            }
            .padding()
        }
    }
}

#Preview {
    DashboardView()
}
