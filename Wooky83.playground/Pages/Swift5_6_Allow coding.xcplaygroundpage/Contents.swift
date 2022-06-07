//: [Previous](@previous)

import Foundation

enum OldSettings: String, Codable {
    case name
    case twitter
}

let oldDict: [OldSettings: String] = [.name: "Paul", .twitter: "@twostraws"]
let oldData = try JSONEncoder().encode(oldDict)
print(String(decoding: oldData, as: UTF8.self))
//["twitter","@twostraws","name","Paul"]

enum NewSettings: String, Codable, CodingKeyRepresentable {
    case name
    case twitter
}

let newDict: [NewSettings: String] = [.name: "Paul", .twitter: "@twostraws"]
let newData = try! JSONEncoder().encode(newDict)
print(String(decoding: newData, as: UTF8.self))
//{"name":"Paul","twitter":"@twostraws"}
