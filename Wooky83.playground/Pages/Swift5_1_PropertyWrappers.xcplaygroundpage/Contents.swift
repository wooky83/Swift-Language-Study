//: [Previous](@previous)

import Foundation


var settings: [String: Any] = ["swift": true, "latestVersion": 5, "name": "hi"]

@propertyWrapper
struct SettingsWrapper<T> {
    let key: String
    let defaultValue: T
    
    var wrappedValue: T {
        get {
            settings[key] as? T ?? defaultValue
        }
        set {
            settings[key] = newValue
        }
    }
}

struct Settings {
    @SettingsWrapper(key: "swift", defaultValue: false) var isSwift: Bool
    @SettingsWrapper(key: "latestVersion", defaultValue: 3) var latestVersion: Int
    @SettingsWrapper(key: "name", defaultValue: "Good") var name: String
    @SettingsWrapper(key: "temporary", defaultValue: "tmp") var tmp: String
}

var newSettings = Settings()
newSettings.isSwift
newSettings.latestVersion
newSettings.name
newSettings.tmp
newSettings.isSwift = false
newSettings.isSwift
