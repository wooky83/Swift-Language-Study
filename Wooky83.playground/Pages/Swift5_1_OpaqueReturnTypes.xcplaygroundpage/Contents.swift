//: [Previous](@previous)

import Foundation

protocol Weapon: Equatable {
  var damageOutput: Int { get }
}

protocol Hero: Equatable {
  var name: String { get }
  init(name: String)
  
  associatedtype Weapon
  var weapon: Weapon { get }
}

struct Whip: Weapon {
  var damageOutput: Int = 10
}

struct Sword: Weapon {
  var damageOutput: Int = 20
}

struct LongRangeHero: Hero {
  var name: String
  
  typealias Weapon = Sword
  var weapon = Sword()
  init(name: String) {
    self.name = name
  }
}

struct ShortRangeHero: Hero {
  var name: String
  
  typealias Weapon = Sword
  var weapon = Sword()
  init(name: String) {
    self.name = name
  }
}

//func randomHero() -> Hero {
//  if Int.random(in: 0...1) % 2 == 0 {
//    return LongRangeHero(name: "Belmont")
//  } else {
//    return ShortRangeHero(name: "Link")
//  }
//}
//
//let belmont = randomHero()
//let link = randomHero()
//belmont == link

func createHero<T: Hero>(name: String) -> T {
  T(name: name)
}

let belmont: LongRangeHero = createHero(name: "Belmont")
let link: ShortRangeHero = createHero(name: "Link")
//belmont == link
let belmont2: LongRangeHero = createHero(name: "Belmont2")
belmont == belmont2

func randomLongRangeHero(name: String) -> some Hero {
  LongRangeHero(name: name)
}
let donatello = randomLongRangeHero(name: "Donatello")
let samus = randomLongRangeHero(name: "Samus")
donatello == samus

func doDamage<T: Hero>(hero: T) {
  print(hero.weapon)
}

doDamage(hero: belmont)
