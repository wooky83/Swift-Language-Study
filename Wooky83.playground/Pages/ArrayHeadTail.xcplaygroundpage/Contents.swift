//: [Previous](@previous)

import Foundation

func sum(_ arr: [Int]) -> Int{
    guard let head = arr.first else {return 0}
    return head + sum(Array(arr.dropFirst()))
}

let result = sum([1, 2, 3, 4, 5])
print(result)
