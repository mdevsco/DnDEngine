//
//  DnDClass.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/25/22.
//

import Foundation

struct DnDClass {
    var name: String
    
    var hitDie: String
    
    var spellcastingAbility: DnDAbilityType
    
    var savingThrowProficiencies = Set<DnDAbilityType>()
    
    var abilityBonuses = Set<DnDAbilityType>()
    var abilityBonusChoices = = Set<DnDAbilityType>()
    
    var skillProficiencies = Set<DnDSkillType>()
    var skillProficiencyChoices = Set<DnDSkillType>()
    
    var weaponProficiencies = Set<DnDWeaponCategory>()
    
    var armorProficiencies = Set<DnDArmorType>()
    
    var features = Set<DnDFeature>()
}
