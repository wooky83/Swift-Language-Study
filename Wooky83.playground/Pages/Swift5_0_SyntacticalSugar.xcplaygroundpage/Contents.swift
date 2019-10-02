//: [Previous](@previous)

import Foundation


let myInterger = 64

var isMultiple = myInterger.isMultiple(of: 2)
isMultiple = myInterger.isMultiple(of: 16)
isMultiple = myInterger.isMultiple(of:5)

struct Player {
  var id: Int
  
  init?(id: Int) {
    if id < 1 {
      return nil
    }
    
    self.id = id
    
  }
  
  func getBattingAverage() throws -> Double {
    //complicated code here, getting data from DB, performing calculations
    return 0.00
  }
}

let player = Player(id: 5)
let battingAverage = try? player?.getBattingAverage()



let averages = [
  "Steele": "0.250",
  "Wenderlich": "0.200",
  "Catterwaul": "0.225",
  "Moakley": "0.125",
  "Okun": "DNP"
]

let playersWithAverages = averages.compactMapValues{ Double($0) }
playersWithAverages


@dynamicCallable
class DynamicFeatures {
  // 2
  func dynamicallyCall(withArguments params: [Int]) -> Int? {
    guard !params.isEmpty else {
      return nil
    }
    return params.reduce(0, +)
  }
  
  func dynamicallyCall(withKeywordArguments params: KeyValuePairs<String, Int>) -> Int? {
    guard !params.isEmpty else {
      return nil
    }
    return params.reduce(0) { $1.key.isEmpty ? $0 : $0 + $1.value }
  }
}

// 3
let features = DynamicFeatures()
features() // nil
features(3, 4, 5) // 12
features(first: 3, 4, second: 5) // 8 
