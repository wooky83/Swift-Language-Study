//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

struct Calculator {
    var a: Int
    var b: Int

    var sum: Int {
        return a + b
    }
}

var calculator = Calculator(a: 3, b: 5)

let closure = { [cal = calculator] in
    print("The result is \(cal.sum)")
}
calculator.b = 20

closure() // Prints "The result is 8"


//: [Next](@next)
