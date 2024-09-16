//
//  FirebaseDataManager.swift
//  VineyardInternal
//
//  Created by Vishnesh Jayanthi Ramanathan on 16/09/24.
//

import FirebaseFirestore

class FirebaseDataManager: DatabaseServiceProtocol {
    
    
    private let db = Firestore.firestore()
    
    // Implementations for database functions to fetch entries

    func fetchGroupFromDB(groupID: String) async throws -> Group? {
        var group: Group
        let docRef = db.collection("groups").document(groupID)
        do {
            let document = try await docRef.getDocument()
            if document.exists {
                let data = document.data() ?? [:]
                let title = data["title"] as? String ?? "Untitled Group"
                var people: [Person] = []
                if let peopleIDs = data["people"] as? [String] {
                    people = try await fetchPeopleFromDB(peopleIDs: peopleIDs)
                }
                
                var yearlyResolution: YearlyResolution?
                if let yearlyResolutionData = data["yearlyResolution"] as? [String: Any],
                   let yearlyResolutionName = yearlyResolutionData["name"] as? String,
                   let resolutionIDs = yearlyResolutionData["resolutions"] as? [String] {
                    
                    let resolutions = try await fetchResolutionsFromDB(resolutionIDs: resolutionIDs)
                    yearlyResolution = YearlyResolution(
                        name: yearlyResolutionName,
                        resolutions: resolutions
                    )
                }
                group = Group(
                    people: people,
                    yearlyResolution: yearlyResolution!,
                    title: title)
                return group
                
            } else {
                print("Document does not exist")
                return nil
            }
        } catch {
            print("Error getting document: \(error)")
            throw error
        }
    }
    
    func fetchPeopleFromDB(peopleIDs: [String]) async throws -> [Person] {
        var people: [Person] = []
        for personID in peopleIDs {
            let docRef = db.collection("people").document(personID)
            do {
                let document = try await docRef.getDocument()
                if document.exists {
                    if let data = document.data() {
                        let id = data["id"] as? String ?? ""
                        let name = data["name"] as? String ?? "Unknown"
                        let age = data["age"] as? Int ?? 0
                        
                        let person = Person(id: id, name: name, age: age)
                        people.append(person)
                    }
                } else {
                    print("Document does not exist")
                }
            } catch {
                print("Error getting document: \(error)")
                throw error
            }
        }
        return people
    }
    
    func fetchResolutionsFromDB(resolutionIDs: [String]) async throws -> [Resolution] {
        var resolutions: [Resolution] = []
        for resolutionID in resolutionIDs {
            let docRef = db.collection("resolutions").document(resolutionID)
            do {
                let document = try await docRef.getDocument()
                if document.exists {
                    if let data = document.data() {
                        let id = data["id"] as? String ?? ""
                        let name = data["name"] as? String ?? "Unknown Resolution"
                        let timeBoundRaw = data["timeBound"] as? String ?? "day"
                        let timeBound = TimeBound(rawValue: timeBoundRaw) ?? .day
                        let freq = data["freq"] as? Int ?? 0
                        
                        let resolution = Resolution(timeBound: timeBound, name: name, successCheckoff: .incomplete, progress: 0.0, goal: 100.0, freq: freq)
                        resolutions.append(resolution)
                    }
                } else {
                    print("Resolution document does not exist")
                }
            } catch {
                print("Error getting resolution document: \(error)")
                throw error
            }
        }
        return resolutions
    }
    
    // Implementations for database functions to add entries
    
    func addPersonToDB(person: Person) async throws {
        let personData = person.toDictionary()
        //print("Attempting to add person to Firestore with data: \(personData)")

        db.collection("people").document(person.id).setData(personData) { error in
            if let error = error {
                print("Error adding person to Firestore: \(error)")
            } else {
                print("Person successfully added to Firestore!")
            }
        }
    }
    
    func addResolutionToDB(resolution: Resolution) async throws {
        let resolutionData = resolution.toDictionary()
        //print("Attempting to add resolution to Firestore with data: \(resolutionData)")

        db.collection("resolutions").document(resolution.id).setData(resolutionData) { error in
            if let error = error {
                print("Error adding resolution to Firestore: \(error.localizedDescription)")
            } else {
                print("Resolution successfully added to Firestore!")
            }
        }
    }
    
    func addGroupToDB(group: Group) async throws {
        let groupData = group.toDictionary()
        //print("Attempting to add group to Firestore with data: \(groupData)")

        db.collection("groups").document(group.id).setData(groupData) { error in
            if let error = error {
                print("Error adding group to Firestore: \(error.localizedDescription)")
            } else {
                print("Group successfully added to Firestore!")
            }
        }
    }
    
    // Implementations for database functions to modify entries
    
    // Implementations for database functions to delete entries
    
    
}
