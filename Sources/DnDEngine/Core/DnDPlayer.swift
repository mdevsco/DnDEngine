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
import DiceKit

/// Instances of this class are created for every player (or NPC?).  It contains all the active
/// stats for the character as well as supporting derived/computed values.
public class DnDPlayer {
    
    /// The name by which the player wants to be identified
    public var name: String
    
    /// A brief description of the player's background, personality, etc.
    public var description: String?
    
    /// Race refers to the fantasy species or ancestry of a character.
    public var race: String? // TODO: Refactor to support DnDRace
    
    /// There are 12 basic classes in D&D: Barbarian, bard, cleric, druid, fighter, monk,
    /// paladin, ranger, rogue, sorcerer, warlock and wizard.
    public var `class`: String? // TODO: Refactor to support DnDClass
    
    /// Experience the creature has starts at `0` at level `1` and can go as
    /// high as `355000`
    public var xp: Int = 0
    
    /// The size of the player's
    public var size = DnDSize.medium
    
    /// The time interval a player must wait before they can roll to restore health
    ///  **NOTE** Defaults to 1hr for a `shortInterval` and 8hrs for a `longInterval`
    public var restInterval = DnDRestInterval()
    
    /// The player's alignment
    public var alignment = DnDAlignment.neutral
    
    /// The  player's various speeds
    public var speeds = DnDSpeeds()
    
    /// Languages spoken by creature
    public var languages: Set<String> = ["Common"]
    
    /// The weight of the player typically defined by the ``DnDRace``
    public var weight: Double = 0
    
    /// The hitpoints and hitdie information about the health state of the player
    public var health = DnDHealth()
    
    /// Your Spellcasting Ability is determined by which base ability your character
    /// uses to power their spells. For example, Sorcerers get their spellcasting power
    /// from their Charisma, so their Spellcasting Ability is Charisma. Your Spellcasting
    /// Ability modifier is a number taken from the ability used to power the spells.
    public var spellcastingAbility: DnDAbilityType?
    
    
    /// Any conditions that a player may be experiencing during game play.
    /// TODO: Adding or removing conditions may alter the stats and/or modifiers in/out of a combat session
    public var conditions: Set<DnDCondition> = []
    
    public var armorProficiencies: Set<DnDArmorType> = []
    public var inventory: Set<DnDItem> = []
    public var equipment = DnDEquipment()
    public var coins = DnDCoins()
    
    // MARK: - Resistance, vulnerabilitys and immunities
    /// If a creature or an object has resistance to a
    /// ``DnDCondition`` of that type is halved against it.
    public var resistances: [DnDCondition] = [] // TODO: should this be for conditions or damage type?
    
    /// If a creature or an object has vulnerability to a
    /// damage type, damage of that type is doubled against it.
    public var vulnerabilies: [DnDDamageType] = []
    
    public var immunities: [DnDDamageType] = [] // TODO: should this be for conditions or damage type?
    
    // MARK: - Abilities
    public var abilities = DnDAbilities()

    
        
    // MARK: - Skills
    public lazy var skills = DnDSkills(abilities: self.abilities)


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
    public var spellAttackBonus: Int {
        get {
            switch (spellcastingAbility) {
            case .strength:
                return proficiencyBonus + abilities.strength.modifier
            case .dexterity:
                return proficiencyBonus + abilities.dexterity.modifier
            case .constitution:
                return proficiencyBonus + abilities.constitution.modifier
            case .wisdom:
                return proficiencyBonus + abilities.wisdom.modifier
            case .intelligence:
                return proficiencyBonus + abilities.intelligence.modifier
            case .charisma:
                return proficiencyBonus + abilities.charisma.modifier
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
    public var armorClass: Int {
        // TODO: If player wears armor or shield calculate AC using Equipment rules
        return 10 + abilities.dexterity.modifier
    }
    
    /// The total combined weight of the player and everything they are carrying.
    public var totalWeight: Double {
        get {
            self.weight + self.coins.weight + self.inventory.reduce(0) {$0 + $1.weight} + self.equipment.weight;
        }
    }
    
    /// The maximum carry capacity for the player
    public var carryCapacity: Int {
        get {
            abilities.strength.score * 15;
        }
    }
    
    /// The player's level of ``DnDEncumberance`` based on their ``carryCapacity``.
    public var encumbered: DnDEncumberance {
        get {
            let score = abilities.strength.score
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
    public var proficiencyBonus: Int {
        // TODO: Is there a potential for bonuses to proficiency?
        get {
            (1 + Int(ceil(Double(self.level) / 4.0)))
        }
    }
    
    /// The initiative modifier value for the player, used by the ``DnDEngine.rollInitiative``.
    public var initiative: Int {
        get {
            // TODO: How to compute initiative
            abilities.dexterity.modifier
        }
    }
    
    /// Passive perception is a character's ability to notice what's happening around
    /// them without actively examining their surroundings. You calculate your score
    /// by adding 10 to their perception modifier, which is their Wisdom modifier plus
    /// their proficiency bonus if proficient.
    public var passivePerception: Int {
        get {
            return 10 + abilities.wisdom.modifier
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
    public var level: Int {
        get {
            convertXPToLevel(self.xp)
        }
        
        /// **NOTE**: Setting a level explicity will reset the XP to the starting xp for the level.
        /// The value of level is automaticall set based on xp.
        set (newLevel) {
            self.xp = convertLevelToXP(newLevel)
        }
    }
    
    // MARK: - Initializers
    
    /// Quick initializer for a creature
    public init(name: String) {
        self.name = name
    }
}



