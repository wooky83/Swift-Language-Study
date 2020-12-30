//: [Previous](@previous)

import Foundation

enum MyError: Error {
    case one, two(String), three(String)
}

func performTask() throws -> Int {
    let number = Int.random(in: 0..<3)
    switch number {
    case 0:
        return 1
    case 1:
        throw MyError.one
    case 2:
        throw MyError.two("two")
    default:
        throw MyError.three("three")
    }
}

do {
    let n = try performTask()
    print("success number : \(n)")
} catch MyError.one {
    print("!!one")
} catch MyError.two(let msg) {
    print(msg)
} catch MyError.three(let msg) {
    print(msg)
}

//: [Next](@next)
