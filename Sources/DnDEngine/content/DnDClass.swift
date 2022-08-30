//
//  DnDClass.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/25/22.
//

import Foundation

public struct DnDClass {
    public var name: String
    
    public var hitDie: String
    
    public var spellcastingAbility: DnDAbilityType
    
    public var savingThrowProficiencies = Set<DnDAbilityType>()
    
    public var abilityBonuses = Set<DnDAbilityType>()
    public var abilityBonusChoices = Set<DnDAbilityType>()
    
    public var skillProficiencies = Set<DnDSkillType>()
    public var skillProficiencyChoices = Set<DnDSkillType>()
    
    public var weaponProficiencies = Set<DnDWeaponCategory>()
    
    public var armorProficiencies = Set<DnDArmorType>()
    
    public var features = [DnDFeature]()
}
