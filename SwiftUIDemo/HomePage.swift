//
//  HomePage.swift
//  SwiftUIDemo
//
//  Created by Auriga on 29/08/22.
//

import SwiftUI

struct HomePage: View {
    
    var userdb: UserAdd = UserAdd()
    @State private var contacts: [UserDetails] = []
    
    var body: some View {
        List(contacts) { contact in
            NavigationLink(destination: UserDetailView(contact: contact)) {
                ContactRow(contact: contact)
            }
        }
        .onAppear{
            self.contacts = self.userdb.getData()
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

struct ContactRow: View {
    
    let contact: UserDetails
    
    var body: some View {
        HStack {
            Image(contact.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(50)
            VStack(alignment: .leading) {
                Text(contact.name)
                    .font(.system(size: 21, weight: .medium, design: .default))
                Text("ID " + contact.employeeId)
            }
        }
    }
}

