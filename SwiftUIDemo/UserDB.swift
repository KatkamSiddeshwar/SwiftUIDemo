//
//  UserDB.swift
//  SwiftUIDemo
//
//  Created by Auriga on 29/08/22.
//

import Foundation
import SQLite3

var dbURL = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
var dbQuere : OpaquePointer!

class UserDB {
    init() {
        dbQuere = createdatabase()
        createtable()
    }
    
    func createdatabase() -> OpaquePointer? {
        var db : OpaquePointer?
        let url = NSURL(fileURLWithPath: dbURL)
        if let path = url.appendingPathComponent("SwiftUIDemo.sqlite") {
            let filecomponent = path.path
            if sqlite3_open(filecomponent, &db) == SQLITE_OK {
                print("Success at \(filecomponent)")
                return db
            }
        }
        return db
    }
    
    func createtable() {
        let createTableString = """
        CREATE TABLE IF NOT EXISTS UserLoginDB (
            Login TEXT PRIMARY KEY NOT NULL,
            FirstName TEXT,
            LastName TEXT,
            Age TEXT,
            Username TEXT,
            Password TEXT);
        """
        var createTableStatement: OpaquePointer?
        if sqlite3_prepare_v2(dbQuere, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("UserLoginDB created.")
            }
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func deletetable() {
        let createTableString = "DROP TABLE IF EXISTS UserLoginDB; "
        var createTableStatement: OpaquePointer?
        if sqlite3_prepare_v2(dbQuere, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("UserLoginDB Deleted")
            }
        }
    }
    
    func AlreadyLogin(Username: String, Password: String) -> Int {
        var queryStatement: OpaquePointer?
        let login = Username + Password
        var count = 0
        let query = "select * from UserLoginDB;"
        if sqlite3_prepare(dbQuere, query, -1, &queryStatement, nil) == SQLITE_OK {
              while(sqlite3_step(queryStatement) == SQLITE_ROW){
                  let loginid = String(cString: sqlite3_column_text(queryStatement, 0))
                  if loginid == login {
                      count += 1
                  }
              }
        }
        return count
    }
    
    func insert(FirstName: String, LastName: String, Age: String, Username: String, Password: String) {
        var insertStatement: OpaquePointer?
        let insertStatementString = "INSERT INTO UserLoginDB (Login, FirstName, LastName, Age, Username, Password) VALUES (?, ?, ?, ?, ?, ?);"
        let Login : NSString = (Username + Password) as NSString
        let FirstName : NSString = FirstName as NSString
        let LastName : NSString = LastName as NSString
        let Age : NSString = Age as NSString
        let Username : NSString = Username as NSString
        let Password : NSString = Password as NSString

        if sqlite3_prepare_v2(dbQuere, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, Login.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, FirstName.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, LastName.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, Age.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, Username.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 6, Password.utf8String, -1, nil)
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted UserLoginDB.")
            }
        }
    }
}
