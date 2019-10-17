import Foundation

var str = "Hello, Swift 5.1"

struct Cat {
  var name: String
  var age: Int = 0
}

let nermal = Cat(name: "Nermal")

let cats = [Cat(name: "Nermal"), Cat(name: "Phoebe"), Cat(name: "Waffles")]
let names = cats.map { $0.name }
print(names)

func catNames(cats: [Cat]) -> [String] {
  cats.map { $0.name }
}
let myCats = catNames(cats: cats)
print(myCats)


struct Dog {
  var age: Int
  var dogYears: Int {
    age * 7
  }
}
let dog = Dog(age: 3)
print(dog.dogYears)


enum Team {
  case screencasts
  case videos
  case tutorials
  case books
  
  private static var leads = [Team: String]()
  
  static func set(department: Team, name: String) {
    leads[department] = name
  }
  
  static func get(department: Team) -> String? {
    return leads[department]
  }
}
Team.set(department: .screencasts, name: "Andrea")
let screencastsLead = Team.get(department: .screencasts)

enum Team2 {
  case screencasts
  case videos
  case tutorials
  case books
  
  private static var leads = [Team2: String]()
  
  static subscript(team: Team2) -> String? {
    get {
      leads[team]
    }
    set {
      leads[team] = newValue
    }
  }
}
Team2[.screencasts] = "Ray"
print(Team2[.screencasts])
