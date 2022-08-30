//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Auriga on 29/08/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var showingLoginScreen = false
    @State private var isHidden = true
    var userdb: UserDB = UserDB()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack (spacing: 10) {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    Text("Username or Password is incorrect")
                        .foregroundColor(.blue)
                        .opacity(isHidden ? 0 : 1)
                    
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
                    
                    Button("Login") {
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                    }
                    .foregroundColor(.blue)
                    
                    NavigationLink(destination: TabBarView(), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    func authenticateUser(username: String, password: String) {
        if userdb.AlreadyLogin(Username: username.lowercased(), Password: password.lowercased()) > 0 {
                showingLoginScreen = true
        }else {
            isHidden = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
