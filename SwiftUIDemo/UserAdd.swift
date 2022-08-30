//
//  UserAdd.swift
//  SwiftUIDemo
//
//  Created by Auriga on 30/08/22.
//

import Foundation
import SQLite3

class UserAdd {
    init() {
        createtable()
    }
    
    func createtable() {
        let createTableString = """
        CREATE TABLE IF NOT EXISTS UserDB (
            Login TEXT PRIMARY KEY NOT NULL,
            FirstName TEXT,
            LastName TEXT,
            Age TEXT,
            Gender TEXT,
            EmployeeId TEXT);
        """
        var createTableStatement: OpaquePointer?
        if sqlite3_prepare_v2(dbQuere, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("UserDB created.")
            }
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func deletetable() {
        let createTableString = "DROP TABLE IF EXISTS UserDB; "
        var createTableStatement: OpaquePointer?
        if sqlite3_prepare_v2(dbQuere, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("UserDB Deleted")
            }
        }
    }
    
    func getData() -> [UserDetails] {
        var queryStatement: OpaquePointer?
        var psns : [UserDetails] = []
        let query = "select * from UserDB;"
        if sqlite3_prepare(dbQuere, query, -1, &queryStatement, nil) == SQLITE_OK {
              while(sqlite3_step(queryStatement) == SQLITE_ROW){
                  let fname = String(cString: sqlite3_column_text(queryStatement, 1))
                  let sname = String(cString: sqlite3_column_text(queryStatement, 2))
                  let age = String(cString: sqlite3_column_text(queryStatement, 3))
                  let gender = String(cString: sqlite3_column_text(queryStatement, 4))
                  let id = String(cString: sqlite3_column_text(queryStatement, 5))
                  var image = "female"
                  if gender == "Male" {
                      image = "male"
                  }
                  let userdata =  UserDetails(imageName: image, name: fname + " " + sname, gender: gender, age: age, employeeId: id)
                  psns.append(userdata)
              }
        }
        sqlite3_finalize(queryStatement)
        return psns
    }
    
    func insert(FirstName: String, LastName: String, Age: String, Gender: String, EmployeeId: String) {
        var insertStatement: OpaquePointer?
        let insertStatementString = "INSERT INTO UserDB (Login, FirstName, LastName, Age, Gender, EmployeeId) VALUES (?, ?, ?, ?, ?, ?);"
        let Login : NSString = (FirstName + EmployeeId) as NSString
        let FirstName : NSString = FirstName as NSString
        let LastName : NSString = LastName as NSString
        let Age : NSString = Age as NSString
        let Gender : NSString = Gender as NSString
        let EmployeeId : NSString = EmployeeId as NSString

        if sqlite3_prepare_v2(dbQuere, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, Login.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, FirstName.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, LastName.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, Age.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, Gender.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 6, EmployeeId.utf8String, -1, nil)
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted UserDB.")
            }
        }
    }
}
