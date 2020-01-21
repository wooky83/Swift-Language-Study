//: [Previous](@previous)

import Foundation

//자동 클로저는 전달인자를 갖지 않는다
//자동 클로저는 클로저가 호출되기 전까지는 클로저 내부의 코드가 동작하지 않기 때문에 연산을 지연시킬 수 있음

//

var customerProvider = ["apple", "banana", "cat", "dog", "egg"]
func serveCustomer(_ customerProvider: @autoclosure () -> String) {
    print("Good Serving \(customerProvider())!")
}

serveCustomer(customerProvider.removeFirst())

typealias ClosureType = () -> String
func serveCustomer51(_ customerProvider: @autoclosure ClosureType) {
    print("Good Serving \(customerProvider())!")
}

serveCustomer51(customerProvider.removeFirst())
