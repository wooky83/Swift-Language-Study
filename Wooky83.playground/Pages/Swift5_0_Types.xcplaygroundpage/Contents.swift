//: [Previous](@previous)

import Foundation

enum NetworkError: Error {
    case badURL
    case noNetworkConnection
    case error404
}

func getSomeDataFromTheURL(_ urlString: String, completion: @escaping (Result<Int, NetworkError>) -> Void) {
    guard let url = URL(string: urlString) else {
        completion(.failure(.badURL))
        return
    }
    
    print("Good \(url)")
    completion(.success(200))
}

getSomeDataFromTheURL("http://raywenderlich.com", completion: { result in
    
    switch result {
    case .success(let code):
        print("(1) return Code is \(code)")
    case .failure(let errCode):
        print("fail is \(errCode.localizedDescription)")
    }
    
    if let code = try? result.get() {
        print("(2) return code is \(code)")
    }
})
