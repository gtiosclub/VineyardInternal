//
//  ToDoListView.swift
//  VineyardInternal
//
//  Created by Jiyoon Lee on 9/28/24.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject private var viewModel = ToDoViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                ScrollView {
                    ForEach(viewModel.person.allProgress) { progress in
                        
                        let activityProg = progress.completionArray.count / progress.frequencyGoal.count
                        NavigationLink(destination: ToDoView(resolution: progress.resolution, group: progress.resolution.groupName)) {
                            VStack(alignment: .leading) {
                                Text(progress.resolution.title)
                                Text(progress.resolution.groupName)
//                                Text("Progress: \(Int(progress.quantityGoal))")
                                Text("\(activityProg)")
                            }
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                            .padding(60)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.gray.opacity(0.2))
                                    .padding(5)
                            )
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Today's Tasks")
        }
    }
}

#Preview {
    ToDoListView()
}
