//
//  UserDetails.swift
//  SwiftUIDemo
//
//  Created by Auriga on 29/08/22.
//

import Foundation
import SwiftUI

struct UserDetails: Identifiable {
    var id = UUID()
    let imageName: String
    let name: String
    let gender: String
    let age: String
    let employeeId: String
}
