//: [Previous](@previous)

import Foundation

struct PValue {
    var x, y: Int
}

final class PReference {
    var x, y: Int
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

do {
    let p1 = PValue(x: 10, y: 12)
    var p2 = p1
    p2.x = 100
    dump(p1)
    dump(p2)
}

print("------------")

do {
    let p1 = PReference(x: 10, y: 12)
    var p2 = p1
    p2.x = 100
    dump(p1)
    dump(p2)
}


struct Tracked<Value> {
    private var _value: Value
    private(set) var readCount = 0
    private(set) var writeCount = 0
    
    init(_ value: Value) {
        self._value = value
    }
    
    mutating func resetCounts() {
        readCount = 0
        writeCount = 0
    }
    
    var debugDescription: String {
        return "\(_value) Reads: \(readCount) Writes: \(writeCount)"
    }
    
    var value: Value {
        mutating get {
            readCount += 1
            return _value
        }
        set {
            writeCount += 1
            _value = newValue
        }
    }
    
}


func computeNothing(input: inout Int) {
    
}

func compute100Times(input: inout Int) {
    for _ in 1...100 {
        input += 1
    }
}

var tracked = Tracked(42)
computeNothing(input: &tracked.value)
print("ComputeNothing", tracked)
tracked.resetCounts()

compute100Times(input: &tracked.value)
print("compute100Times", tracked)

struct PointValue: CustomStringConvertible {
    var x, y: Int
    
    var description: String {
        return "(\(x), \(y))"
    }
    
    mutating func transpose() {
        (y, x) = (x, y)
    }
}

final class PointReference: CustomStringConvertible {
    var x, y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    var description: String {
        return "(\(x), \(y))"
    }
    
    func transpose() {
        (y, x) = (x, y)
    }
}

//////////////////////////////////////////////////////////////////////

var pointValues: [PointValue] = [] {
    didSet {
        print("didSet PointValue", pointValues)
    }
}

print("Value Array")
var pv1 = PointValue(x: 10, y: 11)
var pv2 = PointValue(x: 20, y: 21)
pointValues.append(pv1)
pointValues.append(pv2)
pointValues.append(PointValue(x: 30, y: 31))
pv1.x = 50
pointValues[0].x = 25
pointValues[1].transpose()

//////////////////////////////////////////////////////////////////////


var pointReferences: [PointReference] = [] {
    didSet {
        print("didSet PointReference", pointReferences)
    }
}
print("Class Array")
var pr1 = PointReference(x: 100, y: 110)
var pr2 = PointReference(x: 200, y: 210)

pointReferences.append(pr1)
pointReferences.append(pr2)
pointReferences.append(pr1)

pr1.x = 100
pointReferences[0].x = -300
pointReferences[1].transpose()


print("------------------------------")

let owlBear = RWMonster(name: "Owl Bear", hitPoints: 30)
var enemies: [RWMonster] = [owlBear]
owlBear.hitPoints += 10
print(enemies)  // Reference semantics :[

final class SwiftReference<T> {
    var object: T
    init(_ object: T) {
        self.object = object
    }
}

struct Monster: CustomStringConvertible {
    
    private var _monster: SwiftReference<RWMonster>
    
    private var _mutatingMonster: RWMonster {
        
        mutating get {
            if !isKnownUniquelyReferenced(&_monster) {
                print("making copy")
                _monster = SwiftReference(_monster.object.copy() as! RWMonster)
            } else {
                print("no copy")
            }
            return _monster.object
        }
    }
    
    init(name: String, hitPoints: Int) {
        _monster = SwiftReference(RWMonster(name: name, hitPoints: hitPoints))
    }
    
    var description: String {
        return String(describing: _monster.object)
    }
    
    var name: String {
        get {
            return _monster.object.name
        }
        set {
            _mutatingMonster.name = newValue
        }
    }
    
    var hitPoints: Int {
        get {
            return _monster.object.hitPoints
        }
        set {
            _mutatingMonster.hitPoints = newValue
        }
    }
}

var troll = Monster(name: "Troll", hitPoints: 30)
var monsters: [Monster] = [troll]
print("^^")
troll.hitPoints += 100
troll.hitPoints += 1000
troll.hitPoints += 1000
troll.hitPoints += 1000
print("^^")
print(monsters)  // Value semantics :]
print(troll)
