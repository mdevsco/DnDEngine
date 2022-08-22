//
//  dnd_utilsTests.swift
//  dnd_utilsTests
//
//  Created by Rodney Aiglstorfer on 8/20/22.
//

import XCTest
@testable import DnDEngine

class DnDCoinsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCoinsToString() throws {
        var coins = DnDCoins(cp: 1, gp: 1)
        
        coins.copper = 1
        XCTAssertEqual("\(coins)", "1cp 1gp")
    }
    
    func testCoinsZeroWeight() throws {
        let coins = DnDCoins()
        XCTAssertEqual(coins.weight, 0)
    }
    
    func testCointMath() throws {
        var myCoins = DnDCoins(cp: 3)
        let herCoins = DnDCoins(cp: 1, gp: 1)
        
        myCoins += herCoins
        
        XCTAssertEqual(myCoins.copper, 4)
        
        try! myCoins -= herCoins
        
        XCTAssertEqual(myCoins.copper, 3)
        
        myCoins = herCoins + herCoins
        
        XCTAssertEqual(myCoins.copper, 2)
        XCTAssertEqual(myCoins.gold, 2)
    }
    
    func testOptimizeWeight() throws {
        var coins = DnDCoins(cp: 1000, sp: 100, ep: 10, gp: 1, pp: 0)
        
        XCTAssertEqual("\(coins)", "1000cp 100sp 10ep 1gp")
        let weightBefore = coins.weight
        coins.optimizeForWeight()
        let weightAfter = coins.weight
        
        XCTAssertEqual("\(coins)", "6gp 2pp")
        XCTAssertTrue(weightBefore > weightAfter)
    }
    
    func testCoinsFromExpression() throws {
        let coins = try! DnDCoins("100cp 200sp 300ep 400gp 500pp")
        
        XCTAssertEqual(coins.copper, 100)
        XCTAssertEqual(coins.silver, 200)
        XCTAssertEqual(coins.electrum, 300)
        XCTAssertEqual(coins.gold, 400)
        XCTAssertEqual(coins.platinum, 500)
        
    }


}
