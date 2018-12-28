//: [Previous](@previous)

import Foundation

protocol Identifiable {
    associatedtype ID
    static var idKey: WritableKeyPath<Self, ID> { get }
}

struct Person: Identifiable {
    static let idKey = \Person.socialSecurityNumber
    var socialSecurityNumber: String
    var name: String
}

struct Book: Identifiable {
    static let idKey = \Book.isbn
    var isbn: String
    var title: String
}

struct Movie: Identifiable {
    static let idKey = \Movie.title
    var title: String
    var content: String
}

func printID<T: Identifiable>(thing: T) {
    print(thing[keyPath: T.idKey])
}

let taylor = Person(socialSecurityNumber: "02-555-5555", name: "sungwook")
printID(thing: taylor)

let jo = Book(isbn: "abcdefghijklmnop", title: "gg")
printID(thing: jo)

let mv = Movie(title: "WhyNot", content: "So So")
printID(thing: mv)
