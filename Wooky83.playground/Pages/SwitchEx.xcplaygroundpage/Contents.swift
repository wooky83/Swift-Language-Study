//: [Previous](@previous)

import Foundation

enum MarkerType: String {
    case dday
    case point
    case normal
}

let enumDday = MarkerType.dday
print(enumDday.rawValue)

let pointType = MarkerType(rawValue: "point")
print("type : \(String(describing: pointType))")

switch pointType {
case .some(.dday):
    print("dday")
case .some(.point):
    print("point")
default:
    print("default")
}


enum CustomType {
    case movie(String)
    case music(String)
}

let movieType = CustomType.movie("Good!")
let musicType = CustomType.music("Song!!")

switch movieType {
case .movie(let title):
    print(title)
default:()
}

if case let CustomType.music(name) = musicType {
    print(name)
}

if case let CustomType.music(name) = musicType, name.count > 3 {
    print(name)
}

func test() {
    guard case let .music(ms) = movieType else {
        print("NO")
        return
    }
    print("YES")
}

test()






