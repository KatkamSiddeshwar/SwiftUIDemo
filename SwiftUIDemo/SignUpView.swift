//
//  SignUpView.swift
//  SwiftUIDemo
//
//  Created by Auriga on 29/08/22.
//

import SwiftUI

struct SignUpView: View {

    @State private var username = ""
    @State private var password = ""
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var age = "25"
    @State private var showingLoginScreen = false
    var userdb: UserDB = UserDB()

    var body: some View {
        ZStack {            
            VStack(spacing: 10) {
                Text("Sign Up")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                HStack() {
                    TextField("First Name", text: $firstname)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    TextField("Last Name", text: $lastname)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)

                }

                TextField("Username", text: $username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                Button("Sign Up") {
                    authenticateUser(username: username, password: password, firstname: firstname, lastname: lastname, Age: age)
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                
                NavigationLink(destination: TabBarView(), isActive: $showingLoginScreen) {
                    EmptyView()
                }
            }
        }
        .offset(y: -60)

    }
    
    func authenticateUser(username: String, password: String, firstname: String, lastname: String, Age: String) {
        userdb.insert(FirstName: firstname.lowercased(), LastName: lastname.lowercased(), Age: "26", Username: username.lowercased(), Password: password.lowercased())
        showingLoginScreen = true
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
