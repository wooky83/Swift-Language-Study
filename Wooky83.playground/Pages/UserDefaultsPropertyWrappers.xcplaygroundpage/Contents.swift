//: [Previous](@previous)

import Foundation

struct DecodingHelper: Decodable {
    private let decoder: Decoder

    init(from decoder: Decoder) throws {
        self.decoder = decoder
    }

    func decode(to type: Decodable.Type) throws -> Decodable {
        let decodable = try type.init(from: decoder)
        return decodable
    }
}

extension Encodable {
    func toJSONData() -> Data? {
        try? JSONEncoder().encode(self)
    }
}

@propertyWrapper
struct CSUserDefault<T> {
    let key: String
    let isCodable: Bool
    
    init(key: String, isCodable: Bool = false) {
        self.key = key
        self.isCodable = isCodable
    }

    var projectedValue: CSUserDefault<T> {
        return self
    }
    
    var wrappedValue: T? {
        get {
            if isCodable, let data = UserDefaults.standard.data(forKey: key), let model = try? JSONDecoder().decode(DecodingHelper.self, from: data), let decodeJson = try? model.decode(to: T.self as! Decodable.Type), let result = decodeJson as? T  {
                return result
            } else {
                return UserDefaults.standard.object(forKey: key) as? T
            }
        }
        set {
            let newData: Any?
            if isCodable, let encodeData = newValue as? Encodable, let data = encodeData.toJSONData() {
                newData = data
            } else {
                newData = newValue
            }
            UserDefaults.standard.set(newData, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
}

struct TT: Codable {
    let name: String
    let age: Int
}


struct AppData {
    @CSUserDefault(key: "username") var username: String?
    @CSUserDefault(key: "codable", isCodable: true) var code: TT?
}

var data = AppData()
print(data.username)
print(data.code?.name)
data.username = "good"
print(data.username)


let code = TT(name: "kwon", age: 38)
data.code = code
