//: [Previous](@previous)

import Foundation

//: Playground - noun: a place where people can play

import UIKit

@objcMembers class Person: NSObject {
    var firstName: String = ""
    var lastName: String = ""
    var friends: [Person] = []
    var bestFriend: Person?
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    public func whynot() {
        let xx = #keyPath(firstName)
        print("whyNotsss:\(xx)")
    }
}

class Test {
    var hi = 1
    var gg = "2"
}

let chris = Person(firstName: "Chris", lastName: "Lattner")
let joe = Person(firstName: "Joe", lastName: "Groff")
let douglas = Person(firstName: "Douglas", lastName: "Gregor")
chris.friends = [joe, douglas]
chris.bestFriend = joe

let xx = #keyPath(Person.firstName)
chris.whynot()
print(xx)

let why = Test()
let nameKeyPath = \Test.hi
print(nameKeyPath)
print(why.hi)
why[keyPath: nameKeyPath] = 5
print(why.hi)



