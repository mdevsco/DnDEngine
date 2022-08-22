//
//  DnDMonster.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/23/22.
//

import Foundation

class DnDMonster : DnDCreature {
    var armorClass: Int
    
    var proficiencyBonus: Int {
        get {
            switch(challengeRating) {
            case 0..<5: return 2
            case 5..<9: return 3
            case 9..<13: return 4
            case 13..<17: return 5
            case 17..<21: return 6
            case 21..<25: return 7
            case 25..<29: return 8
            default: return 9
            }
        }
    }
    
    /// A monster's challenge rating tells you how great a threat the monster is. An appropriately
    /// equipped and well-rested party of four adventurers should be able to defeat a monster that
    /// has a challenge rating equal to its level without suffering any deaths. For example, a party
    /// of four 3rd-level characters should find a monster with a challenge rating of 3 to be a worthy
    /// challenge, but not a deadly one.
    var challengeRating: Double {
        /// The number of experience points (XP) a monster is worth is based on its challenge rating.
        /// Typically, XP is awarded for defeating the monster, although the DM may also award XP
        /// for neutralizing the threat posed by the monster in some other manner. Unless something
        /// tells you otherwise, a monster summoned by a spell or other magical ability is worth the
        /// XP noted in its stat block.
        didSet {
            switch(challengeRating) {
                
            case 0.125: xp = 25
            case 0.25: xp = 50
            case 0.5: xp = 100
            case 1: xp = 200
            case 2: xp = 450
            case 3: xp = 700
            case 4: xp = 1100
            case 5: xp = 1800
            case 6: xp = 2300
            case 7: xp = 2900
            case 8: xp = 3900
            case 9: xp = 5000
            case 10: xp = 5900
            case 11: xp = 7200
            case 12: xp = 8400
            case 13: xp = 10000
            case 14: xp = 11500
            case 15: xp = 13000
            case 16: xp = 15000
            case 17: xp = 18000
            case 18: xp = 20000
            case 19: xp = 22000
            case 20: xp = 25000
            case 21: xp = 33000
            case 22: xp = 41000
            case 23: xp = 50000
            case 24: xp = 62000
            case 25: xp = 75000
            case 26: xp = 90000
            case 27: xp = 105000
            case 28: xp = 120000
            case 29: xp = 135000
            case 30: xp = 155000
            default: xp = 10
            }
        }
    }
    
    /// If a creature or an object has resistance to a
    /// damage type, damage of that type is halved against it.
    var resistances: [DnDDamageType] = []
    
    /// If a creature or an object has vulnerability to a
    /// damage type, damage of that type is doubled against it.
    var vulnerabilies: [DnDDamageType] = []
    
    var immunities: [DnDDamageType] = []
    
    
    init(name: String, size: DnDSize = DnDSize.medium, alignment: DnDAlignment = DnDAlignment.neutral, speed: DnDSpeed = DnDSpeed(), maxHitPoints: Int, strength: Int = 0, dexterity: Int = 0, constitution: Int = 0, intelligence: Int = 0, wisdom: Int = 0, charisma: Int = 0, armorClass: Int, challengeRating: Double) {
        self.armorClass = armorClass
        self.challengeRating = challengeRating
        super.init(name: name, size: size, alignment: alignment, speed: speed, maxHitPoints: maxHitPoints, strength: strength, dexterity: dexterity, constitution: constitution, intelligence: intelligence, wisdom: wisdom, charisma: charisma)
    }
}
