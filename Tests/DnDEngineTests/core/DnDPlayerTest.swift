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
        player1.dexterity.bonuses.append(Bonus.racial(2, "Elf (Drow)"))
        player1.dexterity.bonuses.append(Bonus.feat(1, "Athlete"))
        
        
        player1.constitution.score = 10
        
        player1.intelligence.score = 13
        player1.intelligence.bonuses.append(Bonus.racial(1, "Elf (Drow)"))
        
        player1.wisdom.score = 12
        
        player1.charisma.score = 16
        
        player1.armorProficiencies.insert(DnDArmorType.light)
        XCTAssertEqual(player1.passivePerception, 15)
    }
}
