
import Foundation
import UIKit

// 1
class Foo<T> {}
extension Foo where T: Numeric {
    func gg() {
        print("Foo")
    }
}

let a = Foo<Int>()
a.gg()

struct Foz<T> {}
extension Foz where T: Numeric {}

// 2
protocol Bar {
    associatedtype T
    var name: T {get set}
}
extension Bar where T: Numeric {
    func gg() { print("Bar")}
}

class BarTest : Bar {
    var name: Int = 0
}
let a2 = BarTest()
a2.gg()


// 3
protocol Baz {}
extension Baz where Self: UIView {
    func gg() { print("Baz")}
}
class BazTest : UIImageView, Baz {
    
}

let a3 = BazTest()
a3.gg()

//4
class Box<T>: Baz {
    
}
extension Baz where Self: Box<Int> {
    func gg() {
        print("box")
    }
}

let a9 = Box<Int>()
a9.gg()



