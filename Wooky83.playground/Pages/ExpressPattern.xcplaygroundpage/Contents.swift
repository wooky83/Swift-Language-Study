import Foundation

let ex1 = 1..<5 ~= 5
let ex2 = 1...2 ~= 2

func ~= (pattern: Int, value: String) -> Bool {
    return "\(pattern)" == value
}

let value = "83"
switch value {
case 83:
    print("correct")
default:
    print("nothing")
}

let exPattern1 = 1...5 ~= 3
print(exPattern1)

let exPattern2 = 3 ~= "3"
print(exPattern2)

struct Solider {
    let hp: Int
    let x: Int
    let y: Int
}

func ~=(pattern: Int, value: Solider) -> Bool {
    print("xxxx")
    return pattern == value.hp
}

let solider = Solider(hp: 99, x: 10, y: 10)
switch solider {
case 99:
    print("99")
case 100:
    print("100")
default:
    print("no correct")
}
