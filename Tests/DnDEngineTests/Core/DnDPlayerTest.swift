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
 
    func testNewPlayerDefaults() throws {
        // Create a new instance of the play using its name
        let p = DnDPlayer(name: "Draken")
        XCTAssertEqual(p.name, "Draken")
        XCTAssertNil(p.race)
        XCTAssertNil(p.class)
        // Validate that the correct defaults apply
        XCTAssertEqual(p.level, 1)
        XCTAssertEqual(p.xp, 0)
        XCTAssertEqual(p.proficiencyBonus, 2)
        // MARK: Validate restInterval defaults
        XCTAssertEqual(p.restInterval.shortRest, 1)
        XCTAssertEqual(p.restInterval.longRest, 8)
        // MARK: Validate that defaul speed is Basic 30ft
        p.speeds.basic = DnDSpeed(30)
        XCTAssertNotNil(p.speeds.basic)
        p.speeds.fly = DnDSpeed(120, units: .feet)
        
        XCTAssertEqual(p.speeds.basic?.amount, 30)
        XCTAssertEqual(p.speeds.basic?.units, .feet)
        XCTAssertEqual(p.speeds.fly?.amount, 120)
        XCTAssertEqual(p.speeds.fly?.units, .feet)
     
        
        // MARK: Validate that all array types are not nil and empty
        XCTAssertFalse(p.languages.isEmpty)
        XCTAssertEqual(p.languages.first, "Common")
        
        // MARK: Validate that all lists are empty
        XCTAssertTrue(p.armorProficiencies.isEmpty)
        XCTAssertTrue(p.inventory.isEmpty)
        XCTAssertTrue(p.resistances.isEmpty)
        XCTAssertTrue(p.immunities.isEmpty)
        XCTAssertTrue(p.conditions.isEmpty)
        XCTAssertTrue(p.vulnerabilies.isEmpty)
        
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
        
        
    }
    
    func testCreateLvl1Character() throws {
        let p = DnDPlayer(name: "Draken")
        p.race = "Elf (Drow)"
        p.class = "Rogue"
        
        // TODO: Roll for hitpoints and assign to `health`
        
        
        // MARK: Assign abilitiy scores & add bonuses
        p.abilities.strength.score = 8
        
        p.abilities.dexterity.score = 16
        p.abilities.dexterity.bonuses.append(DnDBonus.racial(2, "Elf (Drow)"))
        p.abilities.dexterity.bonuses.append(DnDBonus.feat(1, "Athlete"))
        
        
        p.abilities.constitution.score = 10
        
        p.abilities.intelligence.score = 13
        p.abilities.intelligence.bonuses.append(DnDBonus.racial(1, "Elf (Drow)"))
        
        p.abilities.wisdom.score = 12
        
        p.abilities.charisma.score = 16
        
        p.armorProficiencies.insert(DnDArmorType.light)
        XCTAssertEqual(p.passivePerception, 11)
    }
}
