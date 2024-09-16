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
    @Published var curr_name: String = ""
    @Published var curr_age: String = ""

    @Published var curr_timeBound: TimeBound? = .day
    @Published var curr_resolution_name: String = ""
    @Published var curr_freq: String = ""
    
    @Published var group: Group = .init()
    
    
    private let databaseService: DatabaseServiceProtocol = FirebaseDataManager()
    
    func clearAll() {
        self.group = .init()
    }

    func addPerson() {
        if !curr_name.isEmpty && !curr_age.isEmpty {
        if let age = Int(curr_age) {
            let person = Person(name: self.curr_name, age: age)
            group.people.append(person)
            //print("Button pressed - Adding person with name: \(curr_name) and age: \(age)")
            self.curr_name = ""
            self.curr_age = ""
        } else {
          print("Invalid age format.")
        }
      } else {
        print("Please enter a name and age.")
      }
        print("People: \(group.people)")
    }
    
    func addResolution() {
        if let timeBound = self.curr_timeBound, let freq = Int(curr_freq), !self.curr_resolution_name.isEmpty {
            let resolution = Resolution(timeBound: timeBound, name: self.curr_resolution_name, successCheckoff: .incomplete, progress: 0.0, goal: 100.0, freq: freq)
            self.group.yearlyResolution.resolutions.append(resolution)
            //print("Added resolution: \(resolution)")
            self.curr_resolution_name = ""
            self.curr_timeBound = .day
            self.curr_freq = ""
        } else {
            print("Failed to add resolution: Missing or invalid information.")
        }
        print("Resolutions: \(group.yearlyResolution.resolutions)")
    }

    @MainActor
    func addGroup() async {
        for person in group.people {
            await addPersonToFirestore(person: person)
        }
        
        for resolution in group.yearlyResolution.resolutions {
            await addResolutionToFirestore(resolution: resolution)
        }

        await addGroupToFirestore(group: group)
    }
    
    @MainActor
    func addPersonToFirestore(person: Person) async {
        do {
            try await databaseService.addPersonToDB(person: person)
        }
        catch {
           print("Error adding person:  \(error)")
       }
    }
    
    @MainActor
    func addResolutionToFirestore(resolution: Resolution) async {
        do {
            try await databaseService.addResolutionToDB(resolution: resolution)
        }
        catch {
           print("Error adding person:  \(error)")
       }
    }
    
    @MainActor
    func addGroupToFirestore(group: Group) async {
        do {
            try await databaseService.addGroupToDB(group: group)
        }
        catch {
           print("Error adding group:  \(error)")
       }
    }
    
    
    
    @MainActor
    func fetchGroupFromFirestore(groupID: String) async {
        do {
            if let group = try await databaseService.fetchGroupFromDB(groupID: groupID) {
                self.group = group
            }
        }
        catch {
           print("Error fetching group:  \(error)")
       }
    }

    @MainActor
    func fetchPeopleFromFirestore(peopleIDs: [String]) async {
        do {
            self.group.people = try await databaseService.fetchPeopleFromDB(peopleIDs: peopleIDs)
        }
        catch {
           print("Error fetching people:  \(error)")
       }
    }
    
    @MainActor
    func fetchResolutionsFromFirestore(resolutionIDs: [String]) async {
        do {
            self.group.yearlyResolution.resolutions = try await databaseService.fetchResolutionsFromDB(resolutionIDs: resolutionIDs)
        }
        catch {
           print("Error fetching resolutions:  \(error)")
       }
    }
}
