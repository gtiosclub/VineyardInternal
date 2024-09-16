//
//  GroupView.swift
//  VineyardInternal
//
//  Created by Josheev Rai on 9/12/24.
//

import Foundation
import SwiftUI

struct GroupView: View {
    @StateObject var viewModel = GroupViewModel()
    @State private var showEditPopup: Bool = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Text(viewModel.groupTitle)
                        .font(.largeTitle)
                        .bold()

                    Button(action: {
                        showEditPopup = true
                    }) {
                        Image(systemName: "pencil")
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                    }
                    Spacer()
                    VStack{
                        Button("Add Group") {
                            Task {
                                try await viewModel.addGroup()
                            }
                        }
                        .padding(1)
                        Button("Fetch Group") {
                            Task {
                                try await viewModel.fetchGroupFromFirestore(groupID: "F3827ED2-5E70-47AC-BCB1-FEBDF79AF494")
                            }
                        }
                        .padding(1)
                        Button("Clear All") {
                            viewModel.clearAll()
                        }
                        
                    }
                    
                }
                .padding([.top, .leading, .trailing])


                Text(viewModel.yearlyResolutionName)
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .padding([.leading, .bottom, .trailing])
                
                List {
                    Section(header: Text("People")) {
                        ForEach(viewModel.people) { person in
                            HStack {
                                Spacer()
                                Text("\(person.name)")
                                    .padding()
                                Spacer()
                                    .padding(10)
                                Text("\(person.age)")
                                    .padding()
                                Spacer()
                            }
                        }
                    }

                    Section(header: Text("Resolutions")) {
                        ForEach(viewModel.resolutions) { resolution in
                            Text("\(resolution.name) - \(resolution.freq) times per \(resolution.timeBound.rawValue)")
                        }
                    }
                }
                .frame(height:250)
                .navigationTitle("")

                HStack {
                    Spacer()
                    Button("Add Person") {
                        viewModel.addPerson()
                    }
                    .padding()

                    Button("Add Resolution") {
                        viewModel.addResolution()
                    }
                    Spacer()
                }

                Form {
                    Section(header: Text("Add New Person")) {
                        TextField("Name", text: $viewModel.curr_name)
                        TextField("Age", text: $viewModel.curr_age)
                            .keyboardType(.numberPad)
                    }

                    Section(header: Text("Add New Resolution")) {
                        TextField("Resolution Name", text: $viewModel.curr_resolution_name)
                        Picker("Time Bound", selection: $viewModel.curr_timeBound) {
                            ForEach(TimeBound.allCases, id: \.self) { bound in
                                Text(bound.description()).tag(bound as TimeBound?)
                            }
                        }
                        TextField("Frequency", text: $viewModel.curr_freq)
                    }
                }
                .scrollDisabled(false)
            }
        }
        .sheet(isPresented: $showEditPopup) {
            VStack {
                Form {
                    Section(header: Text("Edit Group Title")) {
                        TextField("Group Title", text: $viewModel.groupTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    Section(header: Text("Edit Yearly Resolution Name")) {
                        TextField("Yearly Resolution Name", text: $viewModel.yearlyResolutionName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }

                HStack {
                    Button("Cancel") {
                        showEditPopup = false
                    }
                    .padding()

                    Spacer()

                    Button("Save") {
                        showEditPopup = false
                    }
                    .padding()
                }
            }
            .padding()
            .presentationDetents([.medium])
        }
    }
}

extension TimeBound {
    func description() -> String {
        switch self {
        case .day:
            return "Daily"
        case .week:
            return "Weekly"
        case .month:
            return "Monthly"
        }
    }
}


#Preview {
    GroupView()
}
