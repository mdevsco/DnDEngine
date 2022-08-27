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
    
    /// Experience the creature has
    var xp: Int = 0
    
    /// The total hit points for this creature
    var maxHitPoints: Int = 0
    
    /// You gain the hit points from your new class as described for levels after 1st.
    /// You gain the 1st-level hit points for a class only when you are a 1st-level
    /// character.
    ///
    /// You add together the Hit Dice granted by all your classes to form your pool
    /// of Hit Dice. If the Hit Dice are the same die type, you can simply pool them
    /// together. For example, both the fighter and the paladin have a d10, so if you
    /// are a paladin 5/fighter 5, you have ten d10 Hit Dice. If your classes give you
    /// Hit Dice of different types, keep track of them separately. If you are a paladin
    /// 5/cleric 5, for example, you have five d10 Hit Dice and five d8 Hit Dice.
    var hitPoints: Int = 0
    
    // TODO: Need to support multiple hitDice see Paladin
    // TODO: Need to compute number of dice by level (or ??)
    var hitDice: String = "1d8"
    
    /// The size of the creature
    var size = DnDSize.medium
    
    /// The creatures alignment
    var alignment = DnDAlignment.neutral
    
    /// The creatures various speeds
    var speed = DnDSpeed()
    
    /// Languages spoken by creature
    var languages: Set<DnDLanguage> = []
    
    // MARK: - Computed Values
    
    /// Passive perception is a character's ability to notice what's happening around
    /// them without actively examining their surroundings. You calculate your score
    /// by adding 10 to their perception modifier, which is their Wisdom modifier plus
    /// their proficiency bonus if proficient.
    var passivePerception: Int {
        get {
            return 10 + wisdom.modifier
        }
    }
    
    /// Typically, a character starts at 1st level and advances in level by adventuring
    /// and gaining experience points (XP). A 1st-level character is inexperienced in
    /// the adventuring world, although he or she might have been a soldier or a
    /// pirate and done dangerous things before.
    ///
    /// Starting off at 1st level marks your character’s entry into the adventuring life.
    /// If you’re already familiar with the game, or if you are joining an existing D&D
    /// campaign, your DM might decide to have you begin at a higher level, on the
    /// assumption that your character has already survived a few harrowing
    /// adventures.
    var level: Int {
        get {
            switch(xp) {
            case (0 ..< 300):
                return 1
            case (300 ..< 900):
                return 2
            case (900 ..< 2700):
                return 3
            case (2700 ..< 6500):
                return 4
            case (6500 ..< 14000):
                return 5
            case (14000 ..< 23000):
                return 6
            case (23000 ..< 34000):
                return 7
            case (34000 ..< 48000):
                return 8
            case (48000 ..< 64000):
                return 9
            case (64000 ..< 85000):
                return 10
            case (85000 ..< 100000):
                return 11
            case (100000 ..< 120000):
                return 12
            case (120000 ..< 140000):
                return 13
            case (140000 ..< 165000):
                return 14
            case (165000 ..< 195000):
                return 15
            case (195000 ..< 225000):
                return 16
            case (225000 ..< 265000):
                return 17
            case (265000 ..< 305000):
                return 18
            case (305000 ..< 355000):
                return 19
            default:
                return 20
            }
        }
        
        /// **NOTE**: Setting a level explicity will reset the XP to the starting xp for the level.
        /// The value of level is automaticall set based on xp.
        set (newLevel) {
            switch (newLevel) {
            case 1:
                xp = 0
            case 2:
                xp = 300
            case 3:
                xp = 900
            case 4:
                xp = 2700
            case 5:
                xp = 6500
            case 6:
                xp = 14000
            case 7:
                xp = 23000
            case 8:
                xp = 34000
            case 9:
                xp = 48000
            case 10:
                xp = 64000
            case 11:
                xp = 85000
            case 12:
                xp = 100000
            case 13:
                xp = 120000
            case 14:
                xp = 140000
            case 15:
                xp = 165000
            case 16:
                xp = 195000
            case 17:
                xp = 225000
            case 18:
                xp = 265000
            case 19:
                xp = 305000
            default:
                xp = 355000
                
            }
        }
    }
    
    // MARK: - Abilities
    var strength = DnDAbility(DnDAbilityType.strength)
    var dexterity = DnDAbility(DnDAbilityType.dexterity)
    var constitution = DnDAbility(DnDAbilityType.constitution)
    var intelligence = DnDAbility(DnDAbilityType.intelligence)
    var wisdom = DnDAbility(DnDAbilityType.wisdom)
    var charisma = DnDAbility(DnDAbilityType.charisma)
    
    // MARK: - Initializers
    
    /// Quick initializer for a creature
    init(name: String) {
        self.name = name
    }
}

