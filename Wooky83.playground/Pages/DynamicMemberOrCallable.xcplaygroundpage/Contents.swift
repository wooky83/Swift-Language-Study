//: [Previous](@previous)

import Foundation

@dynamicMemberLookup
struct PropertyDictionary<T> {
    private let property: [String: Any]
    
    init(_ dictionary: [String: Any]) {
        property = dictionary
    }
    
    subscript(dynamicMember string: String) -> T? {
        guard let value = property[string] else { return nil }
        if T.self == String.self {
            return String(describing: value) as? T
        } else {
            return value as? T
        }
    }
}


let dictionary: [String: Any] = ["a": 1, "b": "2", "c": false]
let property = PropertyDictionary<String>(dictionary)
property.a
property.b
property.c
property.d


@dynamicCallable
struct Callable {
    func dynamicallyCall(withArguments args: [Int]) -> Int {
        return args.count
    }
}

let c = Callable()
print(c())
print(c(1, 2))
