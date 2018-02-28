//: [Previous](@previous)

import Foundation


enum State: String {
    case `default`
    case cancel
    case success
    case fail
    
    static func parseState(state name: String?) -> State {
        return name.flatMap(State.init) ?? .default
    }
}

let state = State.parseState(state: "cancel")

switch state {
case .success:
    print("success")
case .cancel:
    print("cancel")
case .fail:
    print("fail")
case .default:
    print("default")
}
