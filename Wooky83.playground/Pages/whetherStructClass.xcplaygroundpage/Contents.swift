//: [Previous](@previous)

import Foundation

struct S1 {}
class C1 {}

let s1 = S1()
let c1 = C1()
Mirror(reflecting:s1).displayStyle == .struct
Mirror(reflecting:s1).displayStyle
Mirror(reflecting:c1).displayStyle == .class
Mirror(reflecting:c1).displayStyle

