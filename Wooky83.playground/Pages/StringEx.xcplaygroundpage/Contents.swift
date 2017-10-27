//: [Previous](@previous)

import Foundation

let birthday1 = "19830803"
var containWord = birthday1.substring(to: birthday1.index(birthday1.startIndex, offsetBy: 4))
print(containWord)

let birthday2 = "19830803"
var containWord2 = birthday2[..<birthday1.index(birthday1.startIndex, offsetBy: 4)]
print(containWord2)

let text = "Hello world"
text[...text.index(text.startIndex, offsetBy: 2)] // "Hell"
print(text.index(text.startIndex, offsetBy: 2))

