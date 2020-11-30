//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

enum EnumComparable : Comparable {
    case one
    case two
    case three(Int)
}

print(EnumComparable.one < EnumComparable.two)
print(EnumComparable.three(5) < EnumComparable.three(2))
