//
//  UserDetailView.swift
//  SwiftUIDemo
//
//  Created by Auriga on 30/08/22.
//

import SwiftUI

struct UserDetailView: View {
    let contact: UserDetails
    
    var body: some View {
        VStack {
            Image(contact.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)

            Text(contact.name)
                .font(.title)
                .fontWeight(.medium)

            Form {
                Section {
                    HStack {
                        Text("Employee Id")
                        Spacer()
                        Text(contact.employeeId)
                            .foregroundColor(.gray)
                            .font(.callout)
                            .padding(.trailing, 7.0)
                    }
                    HStack {
                        Text("Gender")
                        Spacer()
                        Text(contact.gender)
                            .foregroundColor(.gray)
                            .font(.callout)
                            .padding(.trailing, 7.0)
                    }
                    HStack {
                        Text("Age")
                        Spacer()
                        Text(contact.age)
                            .foregroundColor(.gray)
                            .font(.callout)
                            .padding(.trailing, 7.0)
                    }
                }
            }
        }
    }}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let con = UserDetails(imageName: "male", name: "ddd", gender: "dff", age: "fff", employeeId: "ffff")
        UserDetailView(contact: con)
            .padding(.top, 60)
    }
}
