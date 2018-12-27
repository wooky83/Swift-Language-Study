//: [Previous](@previous)

import Foundation

// 1
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
    
    // 2
    subscript(dynamicMember key: String) -> String {
        switch key {
        case "info":
            return "\(name) is \(age) years old."
        default:
            return details[key] ?? ""
        }
    }
}

let details = ["title": "Author", "instrument": "Guitar"]
let me = Person(name: "Cosmin", age: 32, details: details)
// 3
me.info   // "Cosmin is 32 years old."
me.title  // "Author"
me.empty
