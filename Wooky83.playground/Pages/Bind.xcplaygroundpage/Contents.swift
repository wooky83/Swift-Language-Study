//: [Previous](@previous)

import Foundation

func bind<A, B>(_ a: A?, f: (A) -> B?) -> B?
{
    if let x = a {
        return f(x)
    } else {
        return .none
    }
}

infix operator >>=: MultiplicationPrecedence
func >>=<A, B>(a: A?, f: (A) -> B?) -> B?
{
    return bind(a, f: f)
}

func add(x: Int) -> (Int) -> Int {
    return {
        y in x + y
    }
}

let f1: (String) -> (String?) = {
    str in str + " bind f1"
}

var f2: (String) -> (String?) = {
    str in str + " bind f2"
}

let f3: (String) -> (String?) = {
    str in str.count > 15 ? str + " bind f3" : nil
}

let whyNot = "String" >>= f1 >>= f2 >>= f3 ?? ""
print(whyNot)

//let xxxx =  1 >>= add

//((("String" >>= f1) >>= f2 ) >>= f1) >>= f2    // "String bind f1 bind f2 bind f1 bind f2"
//(("String" >>= f1) >>= f2) >>= f3    // "String bind f1 bind f2 bind f3"
//
//("String" >>= f1) >>= f3            // nil
//(("String" >>= f1) >>= f3) >>= f2    // nil
//((("String" >>= f1) >>= f3) >>= f2) >>= f1    // nil


