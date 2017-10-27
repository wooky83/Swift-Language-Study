//: [Previous](@previous)

import Foundation


func curry<X, Y, Z>(_ fp:@escaping (X,Y)->Z)->(X)->(Y)->Z {
    return { X in
        { Y in
            fp(X, Y)
        }
    }
}

func curry<A, B, C, D>(_ f: @escaping (A, B, C) -> D) -> (A) -> (B) -> (C) -> D {
    return { a in { b in { c in f(a, b, c) } } }
}

class SomeClass {
    
    func ggda(_ pa:String) -> (String) -> Bool {
        return {
            $0 ==  pa
        }
    }
    
    func gg(_ pa:String) -> (String) -> Bool {
        return { (pb:String) -> Bool in
            pb ==  pa
        }
    }
}

let ss = SomeClass()
let x = ss.ggda("gg")("x")



func fx(_ apiName: String,_ content:String) {
    print("\(apiName)(\(content));")
}

func ggx(_ a : Int,_ b : Int,_ c : Int) {
    let d = a + b + c
    print("whyNot\(d)")
}

let b1 = curry(fx)

let fff = curry(ggx)(1)(3)
fff(2)

let nike = curry(ggx)
let d1 = nike(3)
let xxx = d1(4)
let xxxxx = xxx(5)
//let hi = nike(2)
//hi(5)


let fy = curry(fx)("one")
fy("two")

//let two = curry(curryExe, "xx")

func curryFp<X, Y, Z>(_ f: @escaping (X) -> Y,_ g: @escaping (Y) -> Z) -> (X) -> Z {
    return { x in g(f(x)) }
}

var f1: (Int) -> Int = { $0 + 2 }
var g2: (Int) -> Int = { $0 * 3 }

let two = curryFp(f1, g2)
var ggg : Set<Int> = [1, 2, 3, 4, 5 ]
ggg.insert(1)
ggg.contains(2)
ggg.count

two(3)

func add1(x: Int, y: Int) -> Int {
    return x + y
}

func add2(_ x : Int) -> (Int) -> Int {
    return { y in return x + y }
}

let a1 = add2(3)
a1(5)




