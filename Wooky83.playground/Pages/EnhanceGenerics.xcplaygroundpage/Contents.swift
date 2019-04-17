//: [Previous](@previous)

import Foundation


//Function Generics
func exist<T: Equatable>(from: T, in array: [T]) -> Bool {
    for item in array {
        if from == item {
            return true
        }
    }
    return false
}

let intArray = [1, 2, 3]
exist(from: 2, in: intArray)

let strArray = ["a", "b", "c"]
exist(from: "d", in: strArray)

//protocol Generic
protocol GenericProtocol {
    associatedtype MyType
    var property: MyType { get set }
}

class StringImplementation: GenericProtocol {
    var property: String = "a"
    typealias MyType = String
}

class IntImplementation: GenericProtocol {
    var property: Int = 8
}

//Where Clause
protocol Money {
    associatedtype Currency
    var currency: Currency { get }
    var amout: Float { get }
    
    func sum<M: Money>(with money: M) -> M? where M.Currency == Currency
}

class Euro {}
class Pound {}

class Irish: Money {

    var currency = Euro()
    var amout: Float = 10.0
    
    func sum<M>(with money: M) -> M? where M : Money, Irish.Currency == M.Currency {
        return nil
    }
}

protocol Tradable {}

protocol Company  {
    associatedtype TradeCurrency
    func buy<T: Tradable, M: Money>(product: T, with money: M) -> T? where M.Currency == TradeCurrency
}

class BerkshireHathaway: Company {
    typealias TradeCurrency = Euro
    func buy<T, M>(product: T, with money: M) -> T? where T : Tradable, M : Money, BerkshireHathaway.TradeCurrency == M.Currency {
        return nil
    }
}

class Oil: Tradable {}
var berk = BerkshireHathaway()
let oil = berk.buy(product: Oil(), with: Irish())

//Class Generics
class Foo<T: Numeric> {
    func addPlusOne(from: T) -> T {
        return from + 1
    }
}

let f = Foo<Int>()
f.addPlusOne(from: 5)

class Bar<T: Numeric>: Foo<T> {
    func minusOne(from: T) -> T {
        return from - 1
    }
}

let b = Bar<Int>()
b.addPlusOne(from: 5)
b.minusOne(from: 5)

class Box<T> where T: Equatable {
    let bx: T
    init(bx: T) {
        self.bx = bx
    }
    
    func eq(from: T) -> Bool {
        return from == bx
    }
    
}

let bx = Box(bx: 5)
bx.eq(from: 5)
bx.eq(from: 3)
