//: [Previous](@previous)

import Foundation

func factorial(_ n: Int) -> Int {
    if n < 1 {return 0}
    return n + factorial(n - 1)
}

func tailFactorial(_ n: Int, _ acc: Int = 0) -> Int {
    if n < 1 {return acc}
    return tailFactorial(n - 1, acc + n)
}

factorial(5)

tailFactorial(5)
