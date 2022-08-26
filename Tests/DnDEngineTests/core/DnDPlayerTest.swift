//
//  DnDPlayerTest.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/25/22.
//

import Foundation


import XCTest
@testable import DnDEngine

class DnDPlayerTest: XCTestCase {
 
    func testCreateNewPlayer() throws {
        let player1 = DnDPlayer(name: "Drow Rogue 1", race: "Drow", dndClass: "Rogue")
        
        player1.hitPoints = 8
        player1.hitDice = "1d8"
        player1.speed.basic = .normal
        
        player1.strength.score = 8
        
        player1.dexterity.score = 16
        player1.dexterity.bonus = 3
        
        player1.constitution.score = 10
        
        player1.intelligence.score = 13
        player1.intelligence.bonus = 1
        
        player1.wisdom.score = 12
        player1.wisdom.bonus = 1
        
        player1.charisma.score = 16
        player1.charisma.bonus = 3
        
        player1.armorProficiencies.insert(DnDArmorType.light)
        XCTAssertEqual(player1.passivePerception, 15)
    }
}
