//: [Previous](@previous)

import Foundation

extension Collection {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

let array = [1, 2, 3, 4, 5]

let sVal = array[safe:7]
print(sVal)
let val = array[3]
print(val)
