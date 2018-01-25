//: Playground - noun: a place where people can play

import Foundation

fileprivate enum AssociatedKeys {
    static var foo: Never?
    static var bar: Never?
}

protocol P: class {}

extension P {
    var foo: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.foo) as? String
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.foo, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var bar: Int? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.bar) as? Int
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.bar, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

class Test: P {
    
    func gg() {
        self.foo = "nike"
        print(self.foo)
        self.bar = 3
        print(self.bar)
    }
}

let g = Test()
g.gg()

