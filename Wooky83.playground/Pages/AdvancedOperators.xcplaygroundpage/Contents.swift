//: [Previous](@previous)

import UIKit

let binary: UInt8 = 0b00001111
let invertedBits = ~binary

/*
 & = AND
 | = OR
 ^ = XOR
 */


let shift1 = 8 >> 1
let shift2 = 8 >> 2
let shift3 = 1 << 1
let shift4 = 1 << 2

prefix operator √
prefix func √(lhs: Double) -> Double {
    return sqrt(lhs)
}

var root = √9

postfix operator ^^
postfix func ^^(lhs: String?) -> Bool {
    guard let str = lhs else { return false }
    return !str.isEmpty
}

let str: String? = "good"
str^^

extension CGPoint {
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func * (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
    }
}

var point1 = CGPoint(x: 1.0, y: 1.0)
var result = point1 + point1
var pResult = point1 * 5

struct CarOptions: OptionSet {
    let rawValue: Int
    
    static let soundSystem = CarOptions(rawValue: 1 << 0) //1
    static let sportsSeats = CarOptions(rawValue: 1 << 1) //2
    static let alloys = CarOptions(rawValue: 1 << 2) //4
}

var stock: CarOptions = [.soundSystem, .sportsSeats]
stock.contains(.soundSystem)
stock.contains([.soundSystem, .sportsSeats])
stock.remove(.soundSystem)
stock.contains(.soundSystem)
stock.insert(.soundSystem)
stock.contains(.soundSystem)

print(stock)

extension CarOptions: CustomStringConvertible {
    var description: String {
        let strings = ["SoundSystem", "SportsSeats", "Alloys"]
        var members: [String] = []
        for (flag, string) in strings.enumerated()  where self.contains(CarOptions(rawValue: 1 << (UInt8(flag)))) {
            members.append(string)
        }
        return members.description
    }
}

print("\(CarOptions.alloys)")
