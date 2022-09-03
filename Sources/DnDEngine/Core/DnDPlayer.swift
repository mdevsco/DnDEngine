//
//  DnDPlayer.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//
// TODO: Heavy Armor. Heavier armor interferes with the wearer's
// ability to move quickly, stealthily, and freely. If the Armor
// table shows "Str 13" or "Str 15" in the Strength column for an
// armor type, the armor reduces the wearer's speed by 10 feet
// unless the wearer has a Strength score equal to or higher than
// the listed score.

// TODO: Proficiency with a weapon allows you to add your
// proficiency bonus to the attack roll for any attack you make
// with that weapon. If you make an attack roll using a weapon
// with which you lack proficiency, you do not add your
// proficiency bonus to the attack roll.

import Foundation

/// Instances of this class are created for every player (or NPC?).  It contains all the active
/// stats for the character as well as supporting derived/computed values.
public class DnDPlayer {
    
    /// The name by which the player wants to be identified
    public var name: String
    
    /// A brief description of the player's background, personality, etc.
    public var description: String?
    
    /// Race refers to the fantasy species or ancestry of a character.
    public var race: String?
    
    /// There are 12 basic classes in D&D: Barbarian, bard, cleric, druid, fighter, monk,
    /// paladin, ranger, rogue, sorcerer, warlock and wizard.
    public var dndClass: DnDClass?
    
    /// Experience the creature has starts at `0` at level `1` and can go as
    /// high as `355000`
    public var xp: Int = 0
    
    /// The size of the player's
    public var size = DnDSize.medium
    
    /// The player's alignment
    public var alignment = DnDAlignment.neutral
    
    /// The  player's various speeds
    public var speeds: Set<DnDSpeed> = [DnDSpeed(30)]
    
    /// Languages spoken by creature
    public var languages: Set<DnDLanguage> = []
    
    /// The weight of the player typically defined by the ``DnDRace``
    public var weight: Double = 0
    
    /// The total hit points for this creature
    public var maxHitPoints: Int?
    
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
    public var hitPoints: Int?
    
    /// One or more hit dice expressions for the player.  **NOTE** Most players will
    /// only have a single hit die expression (e.g. `"4d6"`) except when multi-class like
    /// **Paladin/Cleric** which may have multiple hit die expressions at higher levels.
    public var hitDice: DnDDie?
    
    
    /// Some spells and special abilities confer temporary hit points to a creature.
    /// Temporary hit points aren't actual hit points; they are a buffer against damage,
    /// a pool of hit points that protect you from injury.
    ///
    /// When you have temporary hit points and take damage, the temporary hit points
    /// are lost first, and any leftover damage carries over to your normal hit points. For
    /// example, if you have 5 temporary hit points and take 7 damage, you lose the
    /// temporary hit points and then take 2 damage.
    ///
    /// Because temporary hit points are separate from your actual hit points, they can
    /// exceed your hit point maximum. A character can, therefore, be at full hit points
    /// and receive temporary hit points.
    ///
    /// Healing can't restore temporary hit points, and they can't be added together. If
    /// you have temporary hit points and receive more of them, you decide whether to
    /// keep the ones you have or to gain the new ones. For example, if a spell grants
    /// you 12 temporary hit points when you already have 10, you can have 12 or 10,
    /// not 22.
    ///
    /// If you have 0 hit points, receiving temporary hit points doesn't restore you to
    /// consciousness or stabilize you. They can still absorb damage directed at you
    /// while you're in that state, but only true healing can save you.
    ///
    /// Unless a feature that grants you temporary hit points has a duration, they last
    /// until they're depleted or you finish a long rest.
    public var tempHitPoints: Int = 0
    

    
    /// Your Spellcasting Ability is determined by which base ability your character
    /// uses to power their spells. For example, Sorcerers get their spellcasting power
    /// from their Charisma, so their Spellcasting Ability is Charisma. Your Spellcasting
    /// Ability modifier is a number taken from the ability used to power the spells.
    public var spellcastingAbility: DnDAbilityType?
    
    public var inventory: Set<DnDItem> = []
    
    /// Any conditions that a player may be experiencing during game play.
    /// TODO: Adding or removing conditions may alter the stats and/or modifiers in/out of a combat session
    public var conditions: Set<DnDCondition> = []
    
    public var armorProficiencies: Set<DnDArmorType> = []
    public var equipment = DnDEquipment()
    public var coins = DnDCoins()
    
    // MARK: - Abilities
    public var strength = DnDAbility(DnDAbilityType.strength)
    public var dexterity = DnDAbility(DnDAbilityType.dexterity)
    public var constitution = DnDAbility(DnDAbilityType.constitution)
    public var intelligence = DnDAbility(DnDAbilityType.intelligence)
    public var wisdom = DnDAbility(DnDAbilityType.wisdom)
    public var charisma = DnDAbility(DnDAbilityType.charisma)
    
    public func ability(for type:DnDAbilityType) -> DnDAbility {
 
        switch (type) {
        case DnDAbilityType.strength:
            return self.strength
        case DnDAbilityType.dexterity:
            return self.dexterity
        case DnDAbilityType.constitution:
            return self.constitution
        case DnDAbilityType.intelligence:
            return self.intelligence
        case DnDAbilityType.wisdom:
            return self.wisdom
        case DnDAbilityType.charisma:
            return self.charisma
        }
    }
    
        
    // MARK: - Skills
    // Strength
    public lazy var athletics = DnDSkill(.athletics) { self.strength.modifier }
    
    // Dexterity
    public lazy var acrobatics  = DnDSkill(.acrobatics){ self.dexterity.modifier }
    public lazy var sleightOfHand  = DnDSkill(.sleightOfHand){ self.dexterity.modifier }
    public lazy var stealth  = DnDSkill(.stealth){ self.dexterity.modifier }
    
    // Intelligence
    public lazy var arcana = DnDSkill(.arcana){ self.intelligence.modifier }
    public lazy var history  = DnDSkill(.history){ self.intelligence.modifier }
    public lazy var investigation  = DnDSkill(.investigation){ self.intelligence.modifier }
    public lazy var nature  = DnDSkill(.nature){ self.intelligence.modifier }
    public lazy var religion  = DnDSkill(.religion){ self.intelligence.modifier }
    
    // Wisdom
    lazy var animalHandling  = DnDSkill(.animalHandling){ self.wisdom.modifier }
    lazy var insight  = DnDSkill(.insight){ self.wisdom.modifier }
    lazy var medicine  = DnDSkill(.medicine){ self.wisdom.modifier }
    lazy var perception  = DnDSkill(.perception){ self.wisdom.modifier }
    lazy var survival  = DnDSkill(.survival){ self.wisdom.modifier }
    
    // Charisma
    public lazy var deception  = DnDSkill(.deception){ self.charisma.modifier }
    public lazy var intimidation  = DnDSkill(.intimidation){ self.charisma.modifier }
    public lazy var performance  = DnDSkill(.performance){ self.charisma.modifier }
    public lazy var persuasion  = DnDSkill(.persuasion){ self.charisma.modifier }

    // MARK: - Initializers
    
    /// Quick initializer for a creature
    public init(name: String) {
        self.name = name
    }

    // MARK: - Computed Values
    
    /// The DC to resist one of your Spells equals 8 + your Spellcasting ability modifier +
    /// your Proficiency bonus + any Special Modifiers.
    public var spellSaveDC: Int {
        get {
            8 + self.spellAttackBonus
        }
    }
    
    /// Some Spells require the caster to make an Attack roll to determine whether the spell
    /// Effect hits the intended target. Your Attack bonus with a spell Attack equals your
    /// Spellcasting ability modifier + your Proficiency bonus. Most Spells that require Attack
    /// rolls involve Ranged Attacks.
    var spellAttackBonus: Int {
        get {
            switch (spellcastingAbility) {
            case .strength:
                return proficiencyBonus + strength.modifier
            case .dexterity:
                return proficiencyBonus + dexterity.modifier
            case .constitution:
                return proficiencyBonus + constitution.modifier
            case .wisdom:
                return proficiencyBonus + wisdom.modifier
            case .intelligence:
                return proficiencyBonus + intelligence.modifier
            case .charisma:
                return proficiencyBonus + charisma.modifier
            default:
                return 0
            }
        }
    }
    
    /// Your Armor Class (AC) represents how well your character avoids being wounded in battle.
    /// Things that contribute to your AC include the armor you wear, the shield you carry, and your
    /// Dexterity modifier. Not all characters wear armor or carry shields, however.
    ///
    /// Without armor or a shield, your character’s AC equals 10 + his or her Dexterity modifier. If
    /// your character wears armor, carries a shield, or both, calculate your AC using the rules in the
    /// Equipment section. Record your AC on your character sheet.
    ///
    /// Your character needs to be proficient with armor and shields to wear and use them effectively,
    /// and your armor and shield proficiencies are determined by your class. There are drawbacks to
    /// wearing armor or carrying a shield if you lack the required proficiency, as explained in the
    /// Equipment section.
    ///
    /// Some spells and class features give you a different way to calculate your AC. If you have
    /// multiple features that give you different ways to calculate your AC, you choose which one to use.
    var armorClass: Int {
        // TODO: If player wears armor or shield calculate AC using Equipment rules
        return 10 + dexterity.modifier
    }
    
    /// The total combined weight of the player and everything they are carrying.
    var totalWeight: Double {
        get {
            self.weight + self.coins.weight + self.inventory.reduce(0) {$0 + $1.weight} + self.equipment.weight;
        }
    }
    
    /// The maximum carry capacity for the player
    var carryCapacity: Int {
        get {
            self.strength.score * 15;
        }
    }
    
    /// The player's level of ``DnDEncumberance`` based on their ``carryCapacity``.
    var encumbered: DnDEncumberance {
        get {
            let score = self.strength.score
            let encumberedWeight = score * 5
            let heavilyEmcumberedWeight = score * 10
            if (score < encumberedWeight) {
                return DnDEncumberance.none
            } else if (score < heavilyEmcumberedWeight) {
                // TODO: If you carry weight in excess of 5 times your Strength score,
                // you are encumbered, which means your speed drops by 10 feet.
                return DnDEncumberance.light
            } else {
                // TODO: If you carry weight in excess of 10 times your Strength score,
                // up to your maximum carrying capacity, you are instead heavily
                // encumbered, which means your speed drops by 20 feet and you
                // have disadvantage on ability checks, attack rolls, and saving
                // throws that use Strength, Dexterity, or Constitution.
                return DnDEncumberance.heavy
            }
        }
    }
    
    /// The player's proficiency bonus.
    var proficiencyBonus: Int {
        // TODO: Is there a potential for bonuses to proficiency?
        get {
            (1 + Int(ceil(Double(self.level) / 4.0)))
        }
    }
    
    /// The initiative modifier value for the player, used by the ``DnDEngine.rollInitiative``.
    var initiative: Int {
        get {
            // TODO: How to compute initiative
            self.dexterity.modifier
        }
    }
    
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
            convertXPToLevel(self.xp)
        }
        
        /// **NOTE**: Setting a level explicity will reset the XP to the starting xp for the level.
        /// The value of level is automaticall set based on xp.
        set (newLevel) {
            self.xp = convertLevelToXP(newLevel)
        }
    }
}



