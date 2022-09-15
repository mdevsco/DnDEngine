//
//  DnDSkill.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/25/22.
//

import Foundation

public class DnDSkills {
    // Strength
    public var athletics: DnDSkill
    
    // Dexterity
    public var acrobatics: DnDSkill
    public var sleightOfHand: DnDSkill
    public var stealth: DnDSkill
    
    // Intelligence
    public var arcana: DnDSkill
    public var history: DnDSkill
    public var investigation: DnDSkill
    public var nature: DnDSkill
    public var religion: DnDSkill
    
    // Wisdom
    public var animalHandling: DnDSkill
    public var insight: DnDSkill
    public var medicine: DnDSkill
    public var perception: DnDSkill
    public var survival: DnDSkill
    
    // Charisma
    public var deception: DnDSkill
    public var intimidation: DnDSkill
    public var performance: DnDSkill
    public var persuasion: DnDSkill

    public init(abilities: DnDAbilities) {
        self.athletics = DnDSkill(.athletics) { abilities.strength.modifier }
        
        // Dexterity
        self.acrobatics = DnDSkill(.acrobatics){ abilities.dexterity.modifier }
        self.sleightOfHand = DnDSkill(.sleightOfHand){ abilities.dexterity.modifier }
        self.stealth = DnDSkill(.stealth){ abilities.dexterity.modifier }
        
        // Intelligence
        self.arcana = DnDSkill(.arcana){ abilities.intelligence.modifier }
        self.history = DnDSkill(.history){ abilities.intelligence.modifier }
        self.investigation = DnDSkill(.investigation){ abilities.intelligence.modifier }
        self.nature = DnDSkill(.nature){ abilities.intelligence.modifier }
        self.religion = DnDSkill(.religion){ abilities.intelligence.modifier }
        
        // Wisdom
        self.animalHandling = DnDSkill(.animalHandling){ abilities.wisdom.modifier }
        self.insight = DnDSkill(.insight){ abilities.wisdom.modifier }
        self.medicine = DnDSkill(.medicine){ abilities.wisdom.modifier }
        self.perception = DnDSkill(.perception){ abilities.wisdom.modifier }
        self.survival = DnDSkill(.survival){ abilities.wisdom.modifier }
        
        // Charisma
        self.deception = DnDSkill(.deception){ abilities.charisma.modifier }
        self.intimidation = DnDSkill(.intimidation){ abilities.charisma.modifier }
        self.performance = DnDSkill(.performance){ abilities.charisma.modifier }
        self.persuasion = DnDSkill(.persuasion){ abilities.charisma.modifier }
    }
}

public struct DnDSkill {
    public var bonus: Int = 0
    public var proficient: Bool = false
    public var abilityModifier: () -> Int
    public var type: DnDSkillType
    
    public var modifier: Int {
        // TODO When to use bonus w.r.t. modifier
        // TOOD What about being "double proficient" (see Roge Feats for example)
        if (proficient) {
            return abilityModifier() + bonus
        } else {
            return abilityModifier()
        }
    }
    
    public init(_ type: DnDSkillType, abilityModifier: @escaping () -> Int) {
        self.type = type
        self.abilityModifier = abilityModifier
    }
}
