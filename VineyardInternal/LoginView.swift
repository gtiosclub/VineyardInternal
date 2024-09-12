//
//  LoginView.swift
//  VineyardInternal
//
//  Created by Степан Кравцов on 12/9/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import Firebase

struct StartView: View {
    @State private var showingSignUp = false
    @State var isLoggedIn = false
    var body: some View {
        NavigationView {
            if !isLoggedIn {
                LoginView(showingSignUp: $showingSignUp, isLoggedIn: $isLoggedIn)
            } else {
                LoggedInView(isLoggedIn: $isLoggedIn)
            }
        }
        .sheet(isPresented: $showingSignUp) {
            SignUpView(showingSignUp: $showingSignUp, isLoggedIn: $isLoggedIn)
        }
    }
}

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @Binding var showingSignUp: Bool
    @State var loginError = ""
    @Binding var isLoggedIn: Bool

    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.purple)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
        

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            

            Button(action: {
                
                    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                        if let error = error {
                            if let errCode = AuthErrorCode(rawValue: error._code) {
                                switch errCode {
                                case .invalidEmail:
                                    loginError = "Invalid email"
                                case .missingEmail:
                                    loginError = "Invalid email"
                                case .weakPassword:
                                    loginError = "Password too weak"
                                case .invalidCredential:
                                    loginError = "Wrong password"
                                default:
                                    loginError = "Create User Error: \(error)"
                                }
                            }
                        } else {
                            loginError = ""
                            isLoggedIn.toggle()
                        }
                      }
                
                
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .cornerRadius(10)
            }
            Text(loginError)
                .foregroundColor(.red)
            

            Button(action: {
                showingSignUp = true
            }) {
                Text("Don't have an account yet? Sign Up")
                    .foregroundColor(.purple)
            }
        }
        .padding()
    }
}

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var passwordsMatch = true
    @Binding var showingSignUp: Bool
    @Binding var isLoggedIn: Bool
    @State var signUpError = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
            

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                

                SecureField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if !passwordsMatch {
                    Text("Passwords do not match")
                        .foregroundColor(.red)
                }
                Text(signUpError)
                    .foregroundColor(.red)

                Button(action: {
                    passwordsMatch = password == confirmPassword
                    if passwordsMatch {
                        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                            if let error = error {
                                if let errCode = AuthErrorCode(rawValue: error._code) {
                                    switch errCode {
                                    case .invalidEmail:
                                        signUpError = "Invalid email"
                                    case .missingEmail:
                                        signUpError = "Invalid email"
                                    case .weakPassword:
                                        signUpError = "Password too weak"
                                    case .emailAlreadyInUse:
                                        signUpError = "This email is already in use"
                                    default:
                                        signUpError = "Create User Error: \(error)"
                                    }
                                }
                            } else {
                                signUpError = ""
                                isLoggedIn.toggle()
                                showingSignUp.toggle()
                            }
                          }
                        
                    }
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(10)
                }
                
            }
            .padding()
            .navigationBarItems(trailing: Button("Cancel") {
                showingSignUp = false
            })
        }
    }

}

//#Preview {
//    LoginView()
//}
