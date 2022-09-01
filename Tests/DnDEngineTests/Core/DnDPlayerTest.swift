//
//  DnDPlayerTest.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/25/22.
//

import Foundation


import XCTest
@testable import DnDEngine
@testable import DiceKit

class DnDPlayerTest: XCTestCase {
 
    func testCreateNewPlayer() throws {
        // Create a new instance of the play using its name
        let p = DnDPlayer(name: "Draken")
        XCTAssertEqual(p.name, "Draken")
        XCTAssertNil(p.race)
        XCTAssertNil(p.classType)
        // Validate that the correct defaults apply
        XCTAssertEqual(p.level, 1)
        XCTAssertEqual(p.xp, 0)
        XCTAssertEqual(p.proficiencyBonus, 2)
        // MARK: Validate that defaul speed is Basic 30ft
        XCTAssertEqual(p.speeds.isEmpty, false)
        p.speeds.insert(DnDSpeed(120, movement: .fly))
        XCTAssertEqual(p.speeds.count, 2)
        XCTAssertEqual(p.speeds.first { speed in
            speed.movement == .basic
        }?.amount, 30)
        XCTAssertEqual(p.speeds.first { speed in
            speed.movement == .fly
        }?.amount, 120)
        
        // MARK: Validate that all array types are not nil and empty
        XCTAssertTrue(p.languages.isEmpty)
        XCTAssertTrue(p.armorProficiencies.isEmpty)
        
        // MARK: Test "Empty" Equipment
        XCTAssertNil(p.equipment.armor)
        XCTAssertNil(p.equipment.mainHand)
        XCTAssertNil(p.equipment.offHand)
        XCTAssertNil(p.equipment.head)
        XCTAssertNil(p.equipment.shoulders)
        XCTAssertNil(p.equipment.chest)
        XCTAssertNil(p.equipment.wrists)
        XCTAssertNil(p.equipment.hands)
        XCTAssertNil(p.equipment.waist)
        XCTAssertNil(p.equipment.legs)
        XCTAssertNil(p.equipment.feet)
        XCTAssertNil(p.equipment.neck)
        XCTAssertNil(p.equipment.back)
        XCTAssertTrue(p.equipment.fingers.isEmpty)
        XCTAssertFalse(p.equipment.isShieldOn)// Computed
        XCTAssertFalse(p.equipment.isArmorOn) // Computed
        XCTAssertEqual(p.equipment.weight, 0) // Computed
        
        p.race = "Elf (Drow)"
        p.classType = DnDClassType.rogue
        
        p.hitPoints = 8
        p.hitDice = [Die.d10, Die.d8]
        
        
        
        p.strength.score = 8
        
        p.dexterity.score = 16
        p.dexterity.bonuses.append(DnDBonus.racial(2, "Elf (Drow)"))
        p.dexterity.bonuses.append(DnDBonus.feat(1, "Athlete"))
        
        
        p.constitution.score = 10
        
        p.intelligence.score = 13
        p.intelligence.bonuses.append(DnDBonus.racial(1, "Elf (Drow)"))
        
        p.wisdom.score = 12
        
        p.charisma.score = 16
        
        p.armorProficiencies.insert(DnDArmorType.light)
        XCTAssertEqual(p.passivePerception, 11)
    }
}
