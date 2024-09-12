//
//  LoggedInView.swift
//  VineyardInternal
//
//  Created by Степан Кравцов on 12/9/24.
//

import SwiftUI
import FirebaseAuth

struct LoggedInView: View {
    @Binding var isLoggedIn: Bool
    var body: some View {
        VStack {
            Text(Auth.auth().currentUser?.uid ?? "No user")
            
            Button(action: {do {
                try Auth.auth().signOut()
                isLoggedIn.toggle()
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }}) {
                Text("Sign out")
            }
            
        }
    }
}

//#Preview {
//    LoggedInView()
//}
