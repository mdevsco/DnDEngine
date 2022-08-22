//
//  DnDCreature.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation

class DnDCreature {
    /// Name of the creature.  For Monsters, this may be
    /// a generic name whereas for Players it may be
    /// unique to an individual.
    var name: String
    
    /// A description of the creature.
    var description: String = ""
    
    /// The total hit points for this creature
    var maxHitPoints: Int
    
    /// The current hit points this creature has
    var hitPoints: Int = 0
    
    /// The size of the creature
    var size: DnDSize
    
    /// The creatures alignment
    var alignment: DnDAlignment
    
    /// The creatures various speeds
    var speed: DnDSpeed
    
    /// Languages spoken by creature
    var languages: Set<DnDLanguage> = []
    
    /// Passive perception is a character's ability to notice what's happening around
    /// them without actively examining their surroundings. You calculate your score
    /// by adding 10 to their perception modifier, which is their Wisdom modifier plus
    /// their proficiency bonus if proficient.
    var passivePerception: Int {
        get {
            return 10 + wisdom.modifier
        }
    }
    
    // MARK: - Abilities
    var strength: DnDAbility
    var dexterity: DnDAbility
    var constitution: DnDAbility
    var intelligence: DnDAbility
    var wisdom: DnDAbility
    var charisma: DnDAbility
    
    /// Quick initializer for a creature
    init(name: String, size: DnDSize = DnDSize.medium,
         alignment: DnDAlignment = DnDAlignment.neutral,
         speed: DnDSpeed = DnDSpeed(), maxHitPoints: Int,
         strength: Int = 0, dexterity: Int = 0, constitution: Int = 0,
         intelligence: Int = 0, wisdom: Int = 0, charisma: Int = 0) {
        
        self.name = name
        self.size = size
        self.maxHitPoints = maxHitPoints
        self.alignment = alignment
        self.speed = speed
        self.strength = DnDAbility(score: strength)
        self.dexterity = DnDAbility(score: dexterity)
        self.constitution = DnDAbility(score: constitution)
        self.intelligence = DnDAbility(score: intelligence)
        self.wisdom = DnDAbility(score: wisdom)
        self.charisma = DnDAbility(score: charisma)
    }
}

struct DnDAbility {
    /// Each of a creature’s abilities has a score, a number that defines the
    /// magnitude of that ability. An ability score is not just a measure of innate
    /// capabilities, but also encompasses a creature’s training and competence
    /// in activities related to that ability.
    var score: Int
    var bonus: Int = 0
    var proficient: Bool = false
    
    /// Each ability also has a modifier, derived from the score and ranging from
    /// −5 (for an ability score of 1) to +10 (for a score of 30).
    ///
    /// To determine an ability modifier subtract 10 from the ability score and
    /// then divide the total by 2 (round down).
    var modifier: Int {
        get {
            ((score - 10) / 2) + bonus;
        }
    }
}