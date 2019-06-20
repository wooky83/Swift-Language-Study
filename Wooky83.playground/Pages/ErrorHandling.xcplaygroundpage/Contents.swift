//: [Previous](@previous)

import Foundation

func preconditionTest(_ name: String?) -> Bool {
    guard let _ = name else { return false }
    return true
}

precondition(preconditionTest(""), "invalid Argument")

enum CSError: Error {
    case zerroError
    case messageError(String)
    case resultError
}

func errorHandle(_ number: Int) throws -> Int {
    if number == 0 {
        throw CSError.zerroError
    } else if number == 1 {
        throw CSError.messageError("Look")
    } else {
        return number * 2
    }
}

do {
    try errorHandle(0)
}
catch CSError.messageError(let message) {
    print("message is \(message)")
}
catch {
    print("error is \(error)")
}

do {
    try errorHandle(1)
}
catch CSError.messageError(let message) {
    print("message is \(message)")
}
catch {
    print("error is \(error)")
}


do {
    try errorHandle(1)
}
catch (let error as NSError) {
    dump(error)
}

#if swift(>=5.0)

func resultTest(_ number: Int) -> Result<Int, CSError> {
    switch number {
    case 0:
        return .failure(CSError.resultError)
    default:
        return .success(number)
    }
}

switch resultTest(2) {
case .success(let success):
    print(success)
case .failure(let fail):
    print(fail)
}

try resultTest(3).get()

#endif
