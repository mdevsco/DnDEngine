//
//  DnDRollExpressionTest.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation
import XCTest
@testable import DnDEngine

class DnDRollExpressionTest: XCTestCase {
    
    func testTryParse() throws {
        var rollExpr = try! DnDRollExpression.tryParse("2d4")
        
        XCTAssertEqual(rollExpr.number, 2)
        XCTAssertEqual(rollExpr.dice, DnDDice.d4)
        
        rollExpr = try! DnDRollExpression.tryParse("2d6")
        
        XCTAssertEqual(rollExpr.number, 2)
        XCTAssertEqual(rollExpr.dice, DnDDice.d6)
        
        rollExpr = try! DnDRollExpression.tryParse("2d8")
        
        XCTAssertEqual(rollExpr.number, 2)
        XCTAssertEqual(rollExpr.dice, DnDDice.d8)
        
        rollExpr = try! DnDRollExpression.tryParse("2d10")
        
        XCTAssertEqual(rollExpr.number, 2)
        XCTAssertEqual(rollExpr.dice, DnDDice.d10)
        
        rollExpr = try! DnDRollExpression.tryParse("2d12")
        
        XCTAssertEqual(rollExpr.number, 2)
        XCTAssertEqual(rollExpr.dice, DnDDice.d12)
        
        rollExpr = try! DnDRollExpression.tryParse("2d20")
        
        XCTAssertEqual(rollExpr.number, 2)
        XCTAssertEqual(rollExpr.dice, DnDDice.d20)
        
        rollExpr = try! DnDRollExpression.tryParse("2d100")
        
        XCTAssertEqual(rollExpr.number, 2)
        XCTAssertEqual(rollExpr.dice, DnDDice.d100)
        
        do {
            rollExpr = try DnDRollExpression.tryParse("2d400")
            XCTFail("Did not get failure expected for 2d400")
        } catch DnDRollExpression.ExpressioinError.invalidExpressions{
            print("GooD!")
        }
        
    }
}
