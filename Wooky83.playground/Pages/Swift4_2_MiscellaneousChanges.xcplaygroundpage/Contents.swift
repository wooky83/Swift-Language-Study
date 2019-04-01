//: [Previous](@previous)

import Foundation
#if swift(>=4.2)

class Country: Hashable {
    let name: String
    let capital: String
    
    init(name: String, capital: String) {
        self.name = name
        self.capital = capital
    }
    
    static func ==(lhs: Country, rhs: Country) -> Bool {
        return lhs.name == rhs.name && lhs.capital == rhs.capital
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(capital)
    }
}

//:Now with the Country class fully adopting the Hashable protocol, instances of that class can be added into Sets and Dictionaries.  I can define a few countries and add them to a set and dictionary.

let france = Country(name: "France", capital: "Paris")
let germany = Country(name: "Germany", capital: "Berlin")
let countries: Set = [france, germany]
let countryGreetings = [france: "Bonjour", germany: "Guten Tag"]

enum Seasons: String, CaseIterable {
    case spring = "Spring", summer = "Summer", autumn = "Autumn", winter = "Winter"
}

enum SeasonType {
    case equinox
    case solstice
}

//: Here allCases is automatically generated at runtime

for (index, season) in Seasons.allCases.enumerated() {
    let seasonType = index % 2 == 0 ? SeasonType.equinox : .solstice
    print("\(season.rawValue) \(seasonType).")
}

var greetings = ["Hello", "Hi", "Goodbye", "Bye"]
greetings.removeAll { $0.count > 3 }

var isOn = true
isOn.toggle()


#endif
//: [Next](@next)
