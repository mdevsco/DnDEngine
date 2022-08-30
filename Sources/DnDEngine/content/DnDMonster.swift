//
//  DnDMonster.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/23/22.
//

import Foundation

public struct DnDMonster {
    public var armorClass: Int = 0
    
    /// Used in the rules on ability checks, saving throws, and attack rolls.
    public var proficiencyBonus: Int {
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
    public var challengeRating: Double = 0
    
    /// The number of experience points (XP) a monster is worth is based on its challenge rating.
    /// Typically, XP is awarded for defeating the monster, although the DM may also award XP
    /// for neutralizing the threat posed by the monster in some other manner. Unless something
    /// tells you otherwise, a monster summoned by a spell or other magical ability is worth the
    /// XP noted in its stat block.
    public var xpReward: Int {
        get {
            convertChallengeRatingToXP(self.challengeRating)
        }
    }
    
    
    /// If a creature or an object has resistance to a
    /// damage type, damage of that type is halved against it.
    public var resistances: [DnDDamageType] = []
    
    /// If a creature or an object has vulnerability to a
    /// damage type, damage of that type is doubled against it.
    public var vulnerabilies: [DnDDamageType] = []
    
    public var immunities: [DnDDamageType] = []
    
}
