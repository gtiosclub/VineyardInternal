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
    
    var group: Group? = nil

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

    func addGroup() {
        for person in people {
            addPersonToFirestore(person: person)
        }
        
        for resolution in resolutions {
            addResolutionToFirestore(resolution: resolution)
        }

        self.group = Group(people: self.people, yearlyResolution: YearlyResolution(name: yearlyResolutionName, resolutions: self.resolutions), title: groupTitle)
        
        if let group = self.group {
            addGroupToFirestore(group: group)
        }
    }
    
    
    // Conversion stuff
    func personToDictionary(person: Person) -> [String: Any] {
        return [
            "id": person.id,
            "name": person.name,
            "age": person.age
        ]
    }
    
    func resolutionToDictionary(resolution: Resolution) -> [String: Any] {
        return [
            "id": resolution.id,
            "name": resolution.name,
            "timeBound": resolution.timeBound.rawValue,
            "successCheckoff": resolution.successCheckoff.rawValue,
            "progress": resolution.progress,
            "goal": resolution.goal,
            "freq": resolution.freq
        ]
    }
    
    func yearlyResolutionsToDictionary(yearlyResolution: YearlyResolution) -> [String: Any] {
        let resolutionIDs = yearlyResolution.resolutions.map { $0.id } // This creates an array of resolutionIDs
        return [
            "name": yearlyResolution.name,
            "resolutions": resolutionIDs
        ]
    }
    
    func groupToDictionary(group: Group) -> [String: Any] {
        let peopleIDs = group.people.map { $0.id } // This creates an array of peopleIDs
        let yearlyResolutionDict = yearlyResolutionsToDictionary(yearlyResolution: group.yearlyResolution)
        return [
            "id": group.id,
            "people": peopleIDs,
            "yearlyResolution": yearlyResolutionDict
        ]
    }
    
    
    // Firestore stuff
    let db = Firestore.firestore()
    
    func addPersonToFirestore(person: Person) {
        let personData = personToDictionary(person: person)
        //print("Attempting to add person to Firestore with data: \(personData)")

        db.collection("people").document(person.id).setData(personData) { error in
            if let error = error {
                print("Error adding person to Firestore: \(error)")
            } else {
                print("Person successfully added to Firestore!")
            }
        }
    }
    
    func addResolutionToFirestore(resolution: Resolution) {
        let resolutionData = resolutionToDictionary(resolution: resolution)
        //print("Attempting to add resolution to Firestore with data: \(resolutionData)")

        db.collection("resolutions").document(resolution.id).setData(resolutionData) { error in
            if let error = error {
                print("Error adding resolution to Firestore: \(error.localizedDescription)")
            } else {
                print("Resolution successfully added to Firestore!")
            }
        }
    }
    
    func addGroupToFirestore(group: Group) {
        let groupData = groupToDictionary(group: group)
        //print("Attempting to add group to Firestore with data: \(groupData)")

        db.collection("groups").document(group.id).setData(groupData) { error in
            if let error = error {
                print("Error adding group to Firestore: \(error.localizedDescription)")
            } else {
                print("Group successfully added to Firestore!")
            }
        }
    }
}
