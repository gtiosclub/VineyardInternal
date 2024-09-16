//
//  GroupViewModel.swift
//  VineyardInternal
//
//  Created by Josheev Rai on 9/12/24.
//

import Foundation
import FirebaseFirestore

class GroupViewModel: ObservableObject {
    
    // Local Stuff
    @Published var groupTitle: String = "Group Name"
    @Published var yearlyResolutionName: String = "Yearly Resolution"
    
    @Published var curr_name: String = ""
    @Published var curr_age: String = ""
    @Published var people: [Person] = []

    @Published var curr_timeBound: TimeBound? = .day
    @Published var curr_resolution_name: String = ""
    @Published var curr_freq: String = ""
    @Published var resolutions: [Resolution] = []
    
    private let databaseService: DatabaseServiceProtocol = FirebaseDataManager()
    var group: Group? = nil
    
    func clearAll() {
        groupTitle = "Group Name"
        yearlyResolutionName = "Yearly Resolution"
        people = []
        resolutions = []
    }

    func addPerson() {
        if !curr_name.isEmpty && !curr_age.isEmpty {
        if let age = Int(curr_age) {
            let person = Person(name: self.curr_name, age: age)
            people.append(person)
            //print("Button pressed - Adding person with name: \(curr_name) and age: \(age)")
            self.curr_name = ""
            self.curr_age = ""
        } else {
          print("Invalid age format.")
        }
      } else {
        print("Please enter a name and age.")
      }
        print("People: \(people)")
    }
    
    func addResolution() {
        if let timeBound = self.curr_timeBound, let freq = Int(curr_freq), !self.curr_resolution_name.isEmpty {
            let resolution = Resolution(timeBound: timeBound, name: self.curr_resolution_name, successCheckoff: .incomplete, progress: 0.0, goal: 100.0, freq: freq)
            self.resolutions.append(resolution)
            //print("Added resolution: \(resolution)")
            self.curr_resolution_name = ""
            self.curr_timeBound = .day
            self.curr_freq = ""
        } else {
            print("Failed to add resolution: Missing or invalid information.")
        }
        print("Resolutions: \(resolutions)")
    }

    @MainActor
    func addGroup() async throws {
        for person in people {
            try await addPersonToFirestore(person: person)
        }
        
        for resolution in resolutions {
            try await addResolutionToFirestore(resolution: resolution)
        }

        self.group = Group(people: self.people, yearlyResolution: YearlyResolution(name: yearlyResolutionName, resolutions: self.resolutions), title: groupTitle)
        
        if let group = self.group {
            try await addGroupToFirestore(group: group)
        }
    }
    
    @MainActor
    func addPersonToFirestore(person: Person) async throws{
        try await databaseService.addPersonToDB(person: person)
    }
    
    @MainActor
    func addResolutionToFirestore(resolution: Resolution) async throws{
        try await databaseService.addResolutionToDB(resolution: resolution)
    }
    
    @MainActor
    func addGroupToFirestore(group: Group) async throws{
        try await databaseService.addGroupToDB(group: group)
    }
    
    
    @MainActor
    func fetchGroupFromFirestore(groupID: String) async throws{
        let group = try await databaseService.fetchGroupFromDB(groupID: groupID)
        self.groupTitle = group!.title
        self.people = group!.people
        self.yearlyResolutionName = group!.yearlyResolution.name
    }

    @MainActor
    func fetchPeopleFromFirestore(peopleIDs: [String]) async throws {
        self.people = try await databaseService.fetchPeopleFromDB(peopleIDs: peopleIDs)
    }
    
    @MainActor
    func fetchResolutionsFromFirestore(resolutionIDs: [String]) async throws{
        self.resolutions = try await databaseService.fetchResolutionsFromDB(resolutionIDs: resolutionIDs)
    }

}
