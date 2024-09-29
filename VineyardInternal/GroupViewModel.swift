//
//  GroupViewModel.swift
//  VineyardInternal
//
//  Created by Josheev Rai on 9/12/24.
//

import Foundation
import FirebaseFirestore

class GroupViewModel: ObservableObject {
//    
//    // Local Stuff
//    @Published var group: Group = .init()
//    
//    
//    private let databaseService: DatabaseServiceProtocol = FirebaseDataManager()
//    
//    func clearAll() {
//        self.group = .init()
//    }
//
//    func addPerson(curr_name: String, curr_age: String) {
//        if !curr_name.isEmpty && !curr_age.isEmpty {
//        if let age = Int(curr_age) {
//            let person = Person(name: curr_name, age: age)
//            group.people.append(person)
//        } else {
//          print("Invalid age format.")
//        }
//      } else {
//        print("Please enter a name and age.")
//      }
//        print("People: \(group.people)")
//    }
//    
//    func addResolution(curr_timeBound: TimeBound, curr_resolution_name: String, curr_freq: String) {
//        if let freq = Int(curr_freq), !curr_resolution_name.isEmpty {
//            let resolution = Resolution(timeBound: curr_timeBound, 
//                                        name: curr_resolution_name,
//                                        successCheckoff: .incomplete,
//                                        progress: 0.0,
//                                        goal: 100.0,
//                                        freq: freq)
//            self.group.yearlyResolution.resolutions.append(resolution)
//        } else {
//            print("Failed to add resolution: Missing or invalid information.")
//        }
//        print("Resolutions: \(group.yearlyResolution.resolutions)")
//    }
//
//    @MainActor
//    func addGroup() async {
//        for person in group.people {
//            await addPersonToFirestore(person: person)
//        }
//        
//        for resolution in group.yearlyResolution.resolutions {
//            await addResolutionToFirestore(resolution: resolution)
//        }
//
//        await addGroupToFirestore(group: group)
//    }
//    
//    @MainActor
//    func addPersonToFirestore(person: Person) async {
//        do {
//            try await databaseService.addPersonToDB(person: person)
//        }
//        catch {
//           print("Error adding person:  \(error)")
//       }
//    }
//    
//    @MainActor
//    func addResolutionToFirestore(resolution: Resolution) async {
//        do {
//            try await databaseService.addResolutionToDB(resolution: resolution)
//        }
//        catch {
//           print("Error adding person:  \(error)")
//       }
//    }
//    
//    @MainActor
//    func addGroupToFirestore(group: Group) async {
//        do {
//            try await databaseService.addGroupToDB(group: group)
//        }
//        catch {
//           print("Error adding group:  \(error)")
//       }
//    }
//    
//    
//    
//    @MainActor
//    func fetchGroupFromFirestore(groupID: String) async {
//        do {
//            if let group = try await databaseService.fetchGroupFromDB(groupID: groupID) {
//                self.group = group
//            }
//        }
//        catch {
//           print("Error fetching group:  \(error)")
//       }
//    }
//
//    @MainActor
//    func fetchPeopleFromFirestore(peopleIDs: [String]) async {
//        do {
//            self.group.people = try await databaseService.fetchPeopleFromDB(peopleIDs: peopleIDs)
//        }
//        catch {
//           print("Error fetching people:  \(error)")
//       }
//    }
//    
//    @MainActor
//    func fetchResolutionsFromFirestore(resolutionIDs: [String]) async {
//        do {
//            self.group.yearlyResolution.resolutions = try await databaseService.fetchResolutionsFromDB(resolutionIDs: resolutionIDs)
//        }
//        catch {
//           print("Error fetching resolutions:  \(error)")
//       }
//    }
}
