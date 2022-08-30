//
//  TabBarView.swift
//  SwiftUIDemo
//
//  Created by Auriga on 29/08/22.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        ZStack {
            TabView {
                HomePage()
                    .tabItem{
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .navigationBarHidden(true)
                SettingsPage()
                    .tabItem{
                        Image(systemName: "person")
                        Text("Account")
                    }
            }
        }
        .navigationBarTitle("User List")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem {
                NavigationLink(destination: AddUserDetails()) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
