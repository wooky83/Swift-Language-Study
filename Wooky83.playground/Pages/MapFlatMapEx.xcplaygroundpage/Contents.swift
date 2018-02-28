//: Playground - noun: a place where people can play

import UIKit

var a: Int? = 4
let q: (Int) -> Int? = { n in
    if n % 2 == 0 {
        return n + 3
    }
    return nil
}

let b = a.map(q)

let c = a.flatMap(q)


let a1 = [1,2,3,4,5]
let c1 : (Int) -> Int? = { n in
    if n % 2 == 0 {
        return n * 2
    }
    return nil
}

let b1 = a1.map(c1)
print(b1)
let b2 = a1.flatMap(c1)
print(b2)
print("-------------------------------------------------")
let list = [1, 2, 3, nil, 4, 5]
print(list)
let mapList = list.map{$0}
print(mapList)
let flatMapList = list.flatMap{$0}
print(flatMapList)
