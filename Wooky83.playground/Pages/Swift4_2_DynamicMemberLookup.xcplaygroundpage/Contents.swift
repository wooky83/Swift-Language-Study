//: [Previous](@previous)

import Foundation
#if swift(>=4.2)

@dynamicMemberLookup
class Person {
    let name: String
    let age: Int
    private let details: [String: String]
    
    init(name: String, age: Int, details: [String: String]) {
        self.name = name
        self.age = age
        self.details = details
    }
    
    //2 - add subscript(dynamicMember:)
    subscript(dynamicMember key: String) -> String {
        switch key {
        case "info":
            return "\(name) is \(age) years old."
        default:
            return details[key] ?? ""
        }
    }
}

//: This allows access to the info and title properties by dot syntax, and doesn't change the access to the name and age properties

let details = ["title": "Author", "instrument": "Guitar"]
let me = Person(name: "Cosmin", age: 32, details: details)
//me["info"]    //this was the old Swift 4.1 access
//me["title"]   //this was the old Swift 4.1 access
me.info
me.title
me.name
me.age
me.test

#endif
//: [Next](@next)
