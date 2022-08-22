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


class DnDPlayer : DnDCreature, DnDHasExperience {
    
    var xp: Int = 0
    
    
    var weight: Double = 0
    //var tempHitPoints: Int = 0
    //    var race: DnDRace
    //    var dndClass: DnDClass
    
    //var spellcasting: DnDSpellcasting
    lazy var inventory: Set<DnDItem> = []
    
    lazy var armorProficiencies: Set<DnDArmorType> = []
    lazy var equipment = DnDEquipment()
    lazy var coins = DnDCoins()
    
    // MARK: - Skills
    // Strength
    lazy var athletics = DnDSkill { self.strength.modifier }
    
    // Dexterity
    lazy var acrobatics  = DnDSkill{ self.dexterity.modifier }
    lazy var sleightOfHand  = DnDSkill{ self.dexterity.modifier }
    lazy var stealth  = DnDSkill{ self.dexterity.modifier }
    
    // Intelligence
    lazy var history  = DnDSkill{ self.intelligence.modifier }
    lazy var investigation  = DnDSkill{ self.intelligence.modifier }
    lazy var nature  = DnDSkill{ self.intelligence.modifier }
    lazy var religion  = DnDSkill{ self.intelligence.modifier }
    
    // Wisdom
    lazy var animalHandling  = DnDSkill{ self.wisdom.modifier }
    lazy var insight  = DnDSkill{ self.wisdom.modifier }
    lazy var medicine  = DnDSkill{ self.wisdom.modifier }
    lazy var perception  = DnDSkill{ self.wisdom.modifier }
    lazy var survival  = DnDSkill{ self.wisdom.modifier }
    
    // Charisma
    lazy var deception  = DnDSkill{ self.charisma.modifier }
    lazy var intimidation  = DnDSkill{ self.charisma.modifier }
    lazy var performance  = DnDSkill{ self.charisma.modifier }
    lazy var persuasion  = DnDSkill{ self.charisma.modifier }
    
    // MARK: - Computed Properties
    
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
    
    /// The player's level of [DnDEncumberance] based on their [carryCapacity].
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
    /// TODO: Is there a potential for bonuses to proficiency?
    var proficiencyBonus: Int {
        get {
         (1 + (self.level / 4))
        }
    }
    
    /// The initiative modifier value for the player, used by the [DnDEngine]
    /// to [rollInitiative].
    var initiative: Int {
        get {
            self.dexterity.modifier
        }
    }
    
    /// Passive wisdom modifier used by the [DnDEngine] to [rollPassiveWisdom].
    var passiveWisdom: Int {
        get {
        self.wisdom.modifier + 10
        }
    }
    
    // TODO: Implement spellAttack & sellSaveDC
//    var spellSaveDC: Int {
//        get {
//            8 + self.spellAttack
//        }
//    }
//    var spellAttack: Int {
//        get {
//        return proficiencyBonus + abilities[dndClass.spellcastingAbility].modifier
//        }
//    }
    
    // MARK: - Initializers
    
    init(name: String, maxHitPoints: Int) {
        super.init(name: name, maxHitPoints: maxHitPoints)
    }
}

struct DnDSkill {
    var bonus: Int
    var proficient: Bool
    var abilityModifier: () -> Int
    
    var modifier: Int {
        // TODO When to use bonus w.r.t. modifier
        // TOOD What about being "double proficient" (see Roge Feats for example)
        abilityModifier()
    }
    
    init(bonus: Int = 0, proficient: Bool = false, abilityModifier: @escaping () -> Int) {
        self.bonus = bonus
        self.proficient = proficient
        self.abilityModifier = abilityModifier
    }
}

struct DnDEquipment {
    var armor: DnDArmor?
    var mainHand: DnDWeapon?
    var offHand: DnDItem?
    var head: DnDItem?
    var shoulders: DnDItem?
    var chest: DnDItem?
    var wrists: DnDItem?
    var hands: DnDItem?
    var waist: DnDItem?
    var legs: DnDItem?
    var feet: DnDItem?
    
    var neck: DnDItem?
    var back: DnDItem?
    var fingers: Set<DnDItem> = []
    
    var isShieldOn: Bool {
        get {
            (offHand != nil) ? offHand is DnDArmor : false;
        }
    }
    
    var isArmorOn: Bool {
        get {
            armor != nil;
        }
    }
    
    var weight: Double {
        get {
            // TODO: Implement equipment weight
            0
        }
    }
}
