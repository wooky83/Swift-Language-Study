//: [Previous](@previous)

import Foundation

@dynamicMemberLookup
struct PropertyDictionary<T> {
    private let property: [String: Any]
    
    init(_ dictionary: [String: Any]) {
        property = dictionary
    }
    
    subscript(dynamicMember key: String) -> T? {
        guard let value = property[key] else { return nil }
        if T.self == String.self {
            return String(describing: value) as? T
        } else {
            return value as? T
        }
    }
}


let dictionary: [String: Any] = ["a": 1, "b": "2", "c": false]
let property = PropertyDictionary<Any>(dictionary)
property.a
property.b
property.c
property.d


let dictionaryStr: [String: Any] = ["a": 1, "b": "2", "c": false]
let propertyStr = PropertyDictionary<String>(dictionaryStr)
propertyStr.a
propertyStr.b
propertyStr.c
propertyStr.d


let dictionaryInt: [String: Any] = ["a": 1, "b": "2", "c": false]
let propertyInt = PropertyDictionary<Int>(dictionaryInt)
propertyInt.a
propertyInt.b
propertyInt.c
propertyInt.d


@dynamicCallable
struct Callable {
    func dynamicallyCall(withArguments args: [Int]) -> Int {
        return args.count
    }
}

let c = Callable()
print(c())
print(c(1, 2))

@dynamicMemberLookup
struct PersonWrapper<T> {
    private let primate: T
    
    init(_ primate: T) {
        self.primate = primate
    }
    
    subscript<U>(dynamicMember keyPath: WritableKeyPath<T, U>) -> U {
        return primate[keyPath: keyPath]
    }
}

struct Person {
    var name: String = "DH"
    var age: Int = 100
}

let person = PersonWrapper(Person())
print(person.name)
