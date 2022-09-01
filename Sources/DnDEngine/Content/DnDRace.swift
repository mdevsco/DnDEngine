//
//  DnDRace.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/25/22.
//

import Foundation

public struct DnDRace {
    /// The name of the race
    public var name: String
    
    public var alignment = DnDAlignment.neutral
    
    public var size = DnDSize.medium;
    
    /// Your speed determines how far you can move
    /// when traveling ( “Adventuring”) and
    /// fighting (“Combat”).
    public var speeds: Set<DnDSpeed> = [DnDSpeed(30)]
    
    public var languages = Set<DnDLanguage>()
    public var languageChoices = Set<DnDLanguage>()
    
    /// If a creature or an object has resistance to a
    /// damage type, damage of that type is halved against it.
    public var resistances = Set<DnDDamageType>()
    
    /// If a creature or an object has vulnerability to a
    /// damage type, damage of that type is doubled against it.
    public var vulnerabilies = Set<DnDDamageType>()
    
    public var savingThrowProficiencies = Set<DnDAbilityType>()
    
    public var abilityBonuses = Set<DnDAbilityType>()
    public var abilityBonusChoices = Set<DnDAbilityType>()
    
    public var skillProficiencies = Set<DnDSkillType>()
    public var skillProficiencyChoices = Set<DnDSkillType>()
    
    public var weaponProficiencies = Set<DnDWeaponCategory>()
    
    public var armorProficiencies = Set<DnDArmorType>()
}
