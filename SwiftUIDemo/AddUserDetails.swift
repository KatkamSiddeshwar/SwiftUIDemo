//
//  AddUserDetails.swift
//  SwiftUIDemo
//
//  Created by Auriga on 30/08/22.
//

import SwiftUI

struct AddUserDetails: View {
    @State private var EmployeeId = ""
    @State private var Gender = ""
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var age = ""
    @State private var showingLoginScreen = false
    var userdb: UserAdd = UserAdd()
    var gender = ["Male", "Female" ]
        @State private var selectedgender = 0
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                Text("Add User Details")
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
                TextField("Age", text: $age)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                
                Picker(selection: $selectedgender, label: Text("Select Gender")) {
                    ForEach(0..<gender.count) {
                        Text(self.gender[$0])
                    }
                }
                .frame(width: 300, height: 40)
                .cornerRadius(10)

                
                TextField("Employee Id", text: $EmployeeId)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .keyboardType(.numberPad)

                Button("Add User") {
                    authenticateUser(employeeid: EmployeeId, gen: self.gender[selectedgender], firstname: firstname, lastname: lastname, Age: age)
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .padding()
                
                NavigationLink(destination: TabBarView(), isActive: $showingLoginScreen) {
                    EmptyView()
                }
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .offset(y: -60)
        
    }
    
    func authenticateUser(employeeid: String, gen: String, firstname: String, lastname: String, Age: String) {
        userdb.insert(FirstName: firstname, LastName: lastname, Age: Age, Gender: gen, EmployeeId: employeeid)
        showingLoginScreen = true
    }
}

struct AddUserDetails_Previews: PreviewProvider {
    static var previews: some View {
        AddUserDetails()
    }
}
