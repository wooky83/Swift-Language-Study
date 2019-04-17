//: [Previous](@previous)

import Foundation
import XCTest

class Score {
    private var score = 0
    
    func getScore() -> Int {
        return score
    }
    
    func incrementScore() {
        score += 1
    }
    
    func incrementScore(_ completion: @escaping (_ newScore: Int) -> Void) {
        incrementScore()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            completion(self.score)
        })
    }
}

class ScoreTests: XCTestCase {
    var keeper: Score!
    
    override func setUp() {
        super.setUp()
        keeper = Score()
    }
    
    func testInitialGetScore() {
        XCTAssert(keeper.getScore() == 0)
    }
    
    func testIncrementScore() {
        keeper.incrementScore()
        XCTAssert(keeper.getScore() == 1)
    }
    
    func testAsyncIncrmentScore() {
        let scoreExpectation = expectation(description: "Score Returned")
        
        keeper.incrementScore { score in
            print("Good Luck")
            scoreExpectation.fulfill()
        }
        
//        waitForExpectations(timeout: 1.0) { error in
//            print(error ?? "error da")
//        }
        
        wait(for: [scoreExpectation], timeout: 2.0)
    }
    
    func testMeasure() {
        measure {
            (0...100).forEach {
             print("measure \($0)")
            }
        }
    }
}

ScoreTests.defaultTestSuite.run()
