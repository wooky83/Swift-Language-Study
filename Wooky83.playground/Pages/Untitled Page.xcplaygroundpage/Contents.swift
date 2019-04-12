//: [Previous](@previous)

import Foundation

//Default Init과 Custom Init을 같이 쓰려면 Extension으로

struct Pet {
    let name: String
    
}

extension Pet {
    init(dictionary: [String: String]) {
        self.name = dictionary["name"] ?? "wook"
    }
}

//OK
let pet = Pet(name: "hi")
//OK
let pet1 = Pet(dictionary: ["name": "kwon"])


struct Foo {
    let name: String
    init(dictionary: [String: String]) {
        self.name = dictionary["name"] ?? "foo"
    }
}

//Compile Error
//let foo = Foo(name: "hi")
//OK
let foo1 = Foo(dictionary: ["name": "kwon"])

