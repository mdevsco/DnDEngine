//
//  DnDRollableTest.swift
//  
//
//  Created by Rodney Aiglstorfer on 9/3/22.
//

import XCTest
import DnDEngine

class DnDRollableTest: XCTestCase {


    func testDnDDieInit() throws {
        XCTAssertEqual(DnDDie.init(rawValue: 4), DnDDie.d4)
        XCTAssertEqual(DnDDie.init(rawValue: 6), DnDDie.d6)
        XCTAssertEqual(DnDDie.init(rawValue: 8), DnDDie.d8)
        XCTAssertEqual(DnDDie.init(rawValue: 10), DnDDie.d10)
        
        XCTAssertEqual(DnDDie.init(rawValue: 12), DnDDie.d12)
        XCTAssertEqual(DnDDie.init(rawValue: 20), DnDDie.d20)
        XCTAssertEqual(DnDDie.init(rawValue: 100), DnDDie.d100)
        
        XCTAssertNil(DnDDie.init(rawValue: 120))
    
    }
    
    func testRolls() throws {
        var rollable = DnDRollable(count: 4, die: .d6)
        
        XCTAssertEqual(rollable.roll().results.count, 4)
        XCTAssertEqual(rollable.roll().highest(3).count, 3)
        XCTAssertEqual(rollable.roll().lowest(3).count, 3)
        
        rollable = try! DnDRollable("4d6")
        
        XCTAssertEqual(rollable.roll().results.count, 4)
        XCTAssertEqual(rollable.roll().highest(3).count, 3)
        XCTAssertEqual(rollable.roll().lowest(3).count, 3)
        
        let lowest3 = try! roll("4d6").lowest()
        XCTAssertEqual(lowest3.count, 1)
        let highest2 = try! roll("4d6").highest(2)
        XCTAssertEqual(highest2.count, 2)
        
        
    }


}
