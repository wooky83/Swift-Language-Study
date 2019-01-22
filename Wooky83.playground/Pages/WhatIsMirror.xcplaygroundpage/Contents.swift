//: [Previous](@previous)

import Foundation

class Dog {
    let name: String
    let age: Int
    var hobby: String?
    
    init(name: String, age: Int, hobby: String? = nil) {
        self.name = name
        self.age = age
        self.hobby = hobby
    }
}

let dog = Dog(name: "GoodDog", age: 7)

let mirror = Mirror(reflecting: dog)

for case let (label?, name) in mirror.children {
    print("Look here = \(label), \(name), \(Mirror(reflecting: name).subjectType)")
}
