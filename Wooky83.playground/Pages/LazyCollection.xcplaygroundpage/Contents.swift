//: [Previous](@previous)

import Foundation

func increment(x: Int) -> Int {
    print("Computing next value of \(x)")
    return x+1
}

let array = Array(0..<1000)
let incArrayNormal = array.map(increment)
print("Normal Result:")
print(incArrayNormal[0], incArrayNormal[4])

let incArrayLazy = array.lazy.map(increment)
print("Lazy Result:")
print(incArrayLazy[0], incArrayLazy[4])
