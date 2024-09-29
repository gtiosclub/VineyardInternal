//
//  GroupView.swift
//  VineyardInternal
//
//  Created by Josheev Rai on 9/12/24.
//

import Foundation
import SwiftUI

struct GroupView: View {
    var body: some View {
        Text("hello")
    }
}
//struct GroupView: View {
//    @StateObject var viewModel = GroupViewModel()
//    @State private var showEditPopup: Bool = false
//    @State var curr_name: String = ""
//    @State var curr_age: String = ""
//    @State var curr_timeBound: TimeBound = .day
//    @State var curr_resolution_name: String = ""
//    @State var curr_freq: String = ""
//    var canAddPerson: Bool {
//        return !curr_name.isEmpty && (Int(curr_age) ?? 0) > 0
//    }
//    var canAddResolution: Bool {
//        if !curr_resolution_name.isEmpty, let freq = Int(curr_freq), freq > 0 {
//            return true
//        } else {
//            return false
//        }
//    }
//
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .leading) {
//                HStack {
//                    Text(viewModel.group.title)
//                        .font(.largeTitle)
//                        .bold()
//
//                    Button(action: {
//                        showEditPopup = true
//                    }) {
//                        Image(systemName: "pencil")
//                            .font(.largeTitle)
//                            .foregroundColor(.primary)
//                    }
//                    Spacer()
//                    VStack{
//                        Button("Add Group") {
//                            Task {
//                                await viewModel.addGroup()
//                            }
//                        }
//                        .padding(1)
//                        Button("Fetch Group") {
//                            Task {
//                                await viewModel.fetchGroupFromFirestore(groupID: "C56F8D7F-5A5D-4817-9027-4C8EFD1198CC")
//                            }
//                        }
//                        .padding(1)
//                        Button("Clear All") {
//                            viewModel.clearAll()
//                        }
//                        
//                    }
//                    
//                }
//                .padding([.top, .leading, .trailing])
//
//
//                Text(viewModel.group.yearlyResolution.name)
//                    .font(.title3)
//                    .foregroundColor(.secondary)
//                    .padding([.leading, .bottom, .trailing])
//                
//                List {
//                    Section(header: Text("People")) {
//                        ForEach(viewModel.group.people) { person in
//                            HStack {
//                                Spacer()
//                                Text("\(person.name)")
//                                    .padding()
//                                Spacer()
//                                    .padding(10)
//                                Text("\(person.age)")
//                                    .padding()
//                                Spacer()
//                            }
//                        }
//                    }
//
//                    Section(header: Text("Resolutions")) {
//                        ForEach(viewModel.group.yearlyResolution.resolutions) { resolution in
//                            Text("\(resolution.name) - \(resolution.freq) times per \(resolution.timeBound.rawValue)")
//                        }
//                    }
//                }
//                .frame(height:250)
//                .navigationTitle("")
//
//                HStack {
//                    Spacer()
//                    Button("Add Person") {
//                        viewModel.addPerson(curr_name: curr_name, curr_age: curr_age)
//                        curr_name = ""
//                        curr_age = ""
//                    }
//                    .disabled(!canAddPerson)
//                    .padding()
//
//                    Button("Add Resolution") {
//                        viewModel.addResolution(curr_timeBound: curr_timeBound, curr_resolution_name: curr_resolution_name, curr_freq: curr_freq)
//                        curr_resolution_name = ""
//                        curr_timeBound = .day
//                        curr_freq = ""
//                    }
//                    .disabled(!canAddResolution)
//                    Spacer()
//                }
//                // All of these bound variables should not be linked to viewModel. They should instead be state variables of the view which are
//                // passed into the viewmodel when the buttons are pressed.
//                Form {
//                    Section(header: Text("Add New Person")) {
//                        TextField("Name", text: $curr_name)
//                        TextField("Age", text: $curr_age)
//                            .keyboardType(.numberPad)
//                    }
//
//                    Section(header: Text("Add New Resolution")) {
//                        TextField("Resolution Name", text: $curr_resolution_name)
//                        Picker("Time Bound", selection: $curr_timeBound) {
//                            ForEach(TimeBound.allCases, id: \.self) { bound in
//                                Text(bound.rawValue)
//                            }
//                        }
//                        TextField("Frequency", text: $curr_freq)
//                            .keyboardType(.numberPad)
//                    }
//                }
//                .scrollDisabled(false)
//            }
//        }
//        .sheet(isPresented: $showEditPopup) {
//            VStack {
//                Form {
//                    Section(header: Text("Edit Group Title")) {
//                        TextField("Group Title", text: $viewModel.group.title)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                    }
//
//                    Section(header: Text("Edit Yearly Resolution Name")) {
//                        TextField("Yearly Resolution Name", text: $viewModel.group.yearlyResolution.name)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                    }
//                }
//
//                HStack {
//                    Button("Cancel") {
//                        showEditPopup = false
//                    }
//                    .padding()
//
//                    Spacer()
//
//                    Button("Save") {
//                        showEditPopup = false
//                    }
//                    .padding()
//                }
//            }
//            .padding()
//            .presentationDetents([.medium])
//        }
//    }
//}


#Preview {
    GroupView()
}
