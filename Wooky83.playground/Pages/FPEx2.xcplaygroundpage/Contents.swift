//: [Previous](@previous)

import Foundation

let hi: Int? = 8

func doubleEven(_ num: Int) -> Int? {
    if num % 2 == 0 {
        return num * 2
    }
    return nil
}

Optional(3).flatMap(doubleEven)
Optional(2).flatMap(doubleEven)

let optionalArr: [Int?] = [1, 2, nil, 5]

let mapedArr: [Int?] = optionalArr.map{ $0 }
let flatmappedArr : [Int] = optionalArr.flatMap{ $0 }

print(mapedArr)

print(flatmappedArr)

let a1 = hi.map{$0} ?? 3
print(a1)

