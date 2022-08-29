//
//  DnDSpellTest.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/24/22.
//

import Foundation

import XCTest
@testable import DnDEngine

class DnDSpellTest: XCTestCase {
    
    func testLoadSpellsFromJSON() throws {
        let spells = DnDSpell.loadFromFile()
        
        XCTAssertFalse(spells.isEmpty)
        
        print(spells[0...4])
    }
}
