//
//  SettingsPage.swift
//  SwiftUIDemo
//
//  Created by Auriga on 29/08/22.
//

import SwiftUI

struct SettingsPage: View {
    var body: some View {
        VStack {
            NavigationLink(destination: AddUserDetails()) {
                Text("Add User")
            }
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(Color.blue)
            .cornerRadius(10)
            .padding()
            
            NavigationLink(destination: ContentView()) {
                Text("Log Out")
            }
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(Color.blue)
            .cornerRadius(10)
            .padding()

        }
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}
