//: [Previous](@previous)

import Foundation
#if swift(>=4.2)

let ages = ["ten", "twelve", "thirteen", "nineteen", "eighteen", "seventeen", "fourteen", "eighteen", "fifteen", "sixteen", "eleven"]

if let firstTeen = ages.first(where: { $0.hasSuffix("teen") }), let firstIndex = ages.firstIndex(where: { $0.hasSuffix("teen") }), let firstMajorIndex = ages.firstIndex(of: "eighteen") {
    print("Teenager number \(firstIndex + 1) is \(firstTeen) years old.")
    print("Teenager number \(firstMajorIndex + 1) isn't a minor anymore.")
} else {
    print("No teenagers around here.")
}


let values = [10, 8, 12, 20]
let allEven = values.allSatisfy { $0 % 2 == 0 }
print(allEven)


#endif
