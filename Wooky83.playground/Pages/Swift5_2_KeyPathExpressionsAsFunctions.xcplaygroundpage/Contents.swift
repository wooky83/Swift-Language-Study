//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

struct User {
    let name: String
    let age: Int
    let bestFriend: String?

    var canVote: Bool {
        age >= 18
    }
}

let eric = User(name: "Eric Effiong", age: 18, bestFriend: "Otis Milburn")
let maeve = User(name: "Maeve Wiley", age: 19, bestFriend: nil)
let otis = User(name: "Otis Milburn", age: 17, bestFriend: "Eric Effiong")
let users = [eric, maeve, otis]

let userNames = users.map(\.name)
//["Eric Effiong", "Maeve Wiley", "Otis Milburn"]
print(userNames)
let oldUserNames = users.map { $0.name }
print(oldUserNames)
let voters = users.filter(\.canVote)
print(voters)
let bestFriends = users.compactMap(\.bestFriend)
print(bestFriends)
