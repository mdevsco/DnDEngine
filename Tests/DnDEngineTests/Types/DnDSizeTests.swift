//
//  DnDSizeTests.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation
import XCTest
@testable import DnDEngine

class DnDSizeTests: XCTestCase {
    
    func testSizeInFeet() throws {
        
        XCTAssertEqual(DnDSize.tiny.sizeInFeet, 2.5)
        XCTAssertEqual(DnDSize.small.sizeInFeet, 5)
        XCTAssertEqual(DnDSize.medium.sizeInFeet, 5)
        XCTAssertEqual(DnDSize.large.sizeInFeet, 10)
        XCTAssertEqual(DnDSize.huge.sizeInFeet, 15)
        XCTAssertEqual(DnDSize.gargantuan.sizeInFeet, 20)
    }
    
    func testSizeInSquares() throws {
        
        XCTAssertEqual(DnDSize.tiny.sizeInSquares, 0.5)
        XCTAssertEqual(DnDSize.small.sizeInSquares, 1)
        XCTAssertEqual(DnDSize.medium.sizeInSquares, 1)
        XCTAssertEqual(DnDSize.large.sizeInSquares, 2)
        XCTAssertEqual(DnDSize.huge.sizeInSquares, 3)
        XCTAssertEqual(DnDSize.gargantuan.sizeInSquares, 4)
    }
}
