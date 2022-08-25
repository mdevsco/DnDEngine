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


class DnDPlayer : DnDCreature {
    
    var weight: Double = 0
    //var tempHitPoints: Int = 0
    var race: String
    var dndClass: String
    
    //var spellcasting: DnDSpellcasting
    lazy var inventory: Set<DnDItem> = []
    
    lazy var armorProficiencies: Set<DnDArmorType> = []
    lazy var equipment = DnDEquipment()
    lazy var coins = DnDCoins()
    
    // MARK: - Skills
    // Strength
    lazy var athletics = DnDSkill(.athletics) { self.strength.modifier }
    
    // Dexterity
    lazy var acrobatics  = DnDSkill(.acrobatics){ self.dexterity.modifier }
    lazy var sleightOfHand  = DnDSkill(.sleightOfHand){ self.dexterity.modifier }
    lazy var stealth  = DnDSkill(.stealth){ self.dexterity.modifier }
    
    // Intelligence
    lazy var history  = DnDSkill(.history){ self.intelligence.modifier }
    lazy var investigation  = DnDSkill(.investigation){ self.intelligence.modifier }
    lazy var nature  = DnDSkill(.nature){ self.intelligence.modifier }
    lazy var religion  = DnDSkill(.religion){ self.intelligence.modifier }
    
    // Wisdom
    lazy var animalHandling  = DnDSkill(.animalHandling){ self.wisdom.modifier }
    lazy var insight  = DnDSkill(.insight){ self.wisdom.modifier }
    lazy var medicine  = DnDSkill(.medicine){ self.wisdom.modifier }
    lazy var perception  = DnDSkill(.perception){ self.wisdom.modifier }
    lazy var survival  = DnDSkill(.survival){ self.wisdom.modifier }
    
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
    
    var spellSaveDC: Int {
        get {
            8 + self.spellAttack
        }
    }
    var spellAttack: Int {
        get {
        return proficiencyBonus + abilities[dndClass.spellcastingAbility].modifier
        }
    }
    
    // MARK: - Initializers
    
//    init(name: String) {
//        super.init(name: name)
//    }
}



