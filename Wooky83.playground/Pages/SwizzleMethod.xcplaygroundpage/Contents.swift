//: [Previous](@previous)

import Foundation

extension UIViewController {
    static let swizzleethod: Void = {
        let originalSelector = #selector(viewWillAppear)
        let swizzledSelector = #selector(myViewWillAppear)
        
        let originalMethod = class_getInstanceMethod(UIViewController.self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(UIViewController.self, swizzledSelector)
        if let origin = originalMethod, let swizzle = swizzledMethod {
            method_exchangeImplementations(origin, swizzle)
        }
    }()
    
    @objc func myViewWillAppear() {
        print("swizzledSelector Good!!!!😀")
    }
}

UIViewController.swizzleethod
