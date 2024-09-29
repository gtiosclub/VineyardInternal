//
//  ToDoListView.swift
//  VineyardInternal
//
//  Created by Jiyoon Lee on 9/28/24.
//

import SwiftUI
//
//struct ToDoListView: View {
//    var body: some View {
//        let placeholder = ["Task 1", "Task 2", "Task 3", "Task 4", "Task 5"]
//
//        NavigationView {
//            VStack(spacing: 20) {
//                ScrollView {
//                    ForEach(placeholder, id: \.self) { task in
//                        NavigationLink(destination: ToDoView()) {
//                            VStack{
//                                Text(task)
//                                Text("Group")
//                            }.font(.system(size: 25))
//                                .foregroundColor(.black)
//                                .padding(60)
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                                .background(
//                                    RoundedRectangle(cornerRadius: 16)
//                                        .fill(Color.gray.opacity(0.2))
//                                        .padding(5)
//                                )
//                        }
//                    }
//                    .padding()
//                }
//            }
//            .navigationTitle("Today's Tasks")
//        }
//    }
//}
//
//#Preview {
//    ToDoListView()
//}
//
struct ToDoListView: View {
    @StateObject private var viewModel = ToDoViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                ScrollView {
                    ForEach(viewModel.groups) { group in
                        ForEach(group.resolutions) { resolution in
                            NavigationLink(destination: ToDoView(resolution: resolution, group: group)) {
                                VStack(alignment: .leading) {
                                    Text(resolution.title)
                                    Text(group.name)
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
