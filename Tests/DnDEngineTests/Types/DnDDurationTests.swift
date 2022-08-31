//
//  File.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation

import XCTest
@testable import DnDEngine

class DnDDurationTests: XCTestCase {
    
    func testDurationInit() throws {
        let duration = DnDDuration(5, units: .concentration)
        
        XCTAssertEqual(duration.value, 5)
        XCTAssertEqual(duration.units, DnDDuration.Units.concentration)
    }
}
