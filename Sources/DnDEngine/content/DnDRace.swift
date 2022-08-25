//
//  DnDRace.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/25/22.
//

import Foundation

struct DnDRace {
    /// The name of the race
    var name: String
    
    var alignment = DnDAlignment.neutral
    
    var size = DnDSize.medium;
    
    /// Your speed determines how far you can move
    /// when traveling ( “Adventuring”) and
    /// fighting (“Combat”).
    var speed = DnDSpeed()
    
    var languages = Set<DnDLanguage>()
    var languageChoices = Set<DnDLanguage>()
    
    /// If a creature or an object has resistance to a
    /// damage type, damage of that type is halved against it.
    var resistances = Set<DnDDamageType>()
    
    /// If a creature or an object has vulnerability to a
    /// damage type, damage of that type is doubled against it.
    var vulnerabilies = Set<DnDDamageType>()
    
    var savingThrowProficiencies = Set<DnDAbilityType>()
    
    var abilityBonuses = Set<DnDAbilityType>()
    var abilityBonusChoices = Set<DnDAbilityType>()
    
    var skillProficiencies = Set<DnDSkillType>()
    var skillProficiencyChoices = Set<DnDSkillType>()
    
    var weaponProficiencies = Set<DnDWeaponCategory>()
    
    var armorProficiencies = Set<DnDArmorType>()
}
