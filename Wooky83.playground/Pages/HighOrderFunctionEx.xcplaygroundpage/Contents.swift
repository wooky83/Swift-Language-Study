//: [Previous](@previous)

import Foundation

func returnTypeLamda(a: Int) -> (Int) -> Int {
    let b = a + 2
    return { c in
        c + b + 2
    }
}

let function = returnTypeLamda(a: 4)
function(3)

func parameterTypeLamda(a: (Int) -> Int) -> Int {
    return a(5) + 2
}

let result = parameterTypeLamda { value -> Int in
    value + 5
}
