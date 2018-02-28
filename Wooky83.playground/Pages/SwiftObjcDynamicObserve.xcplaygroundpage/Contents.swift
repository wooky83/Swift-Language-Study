
import Foundation

class SomeClass: NSObject {
    @objc dynamic var value: String = ""
}

let someObject = SomeClass()

someObject.observe(\.value) { (object, change) in
    print("SomeClass object value changed to \(object.value), \(change.oldValue)")
}

someObject.value = "test"
