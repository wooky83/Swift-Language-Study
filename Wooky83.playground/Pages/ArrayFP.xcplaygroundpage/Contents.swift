//: [Previous](@previous)

import Foundation

var array = [3, 2, 6, 4, 5, 1]
let partitionResult = array.partition {
    $0 > 2
}

print(array)
print(partitionResult)

let max = array.max()

let filter = array.filter {
    $0 == 1
}
print(filter)

let dropResult = array.dropFirst()
print(dropResult)

let reduceResult = array.reduce(0) {
    $0 + $1*2
}

let first = array.first {
    return $0 > 2
}

