//: [Previous](@previous)

import Foundation

let input1 = [1, 2, 3, 4, 5, nil, 6, 7]
print(input1)
let compactMap = input1.compactMap { $0 }
print(compactMap)
let flatMap = input1.flatMap { $0 }
print(flatMap)

print("-----------------")

let input2 = [[2, 3], [4, 5, nil, 6, 7]]
print(input2)
let compactMap2 = input2.compactMap { $0 }
print(compactMap2)
let flatMap2 = input2.flatMap { $0 }.compactMap { $0 }
print(flatMap2)
