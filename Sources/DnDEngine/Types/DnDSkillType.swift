//
//  DnDSkillType.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation

public enum DnDSkillType: String {
    case athletics = "Athletics"
    case acrobatics = "Acrobatics"
    case sleightOfHand = "Sleight of Hand"
    case stealth = "Stealth"
    case arcana = "Arcana"
    case history = "History"
    case investigation = "Investigation"
    case nature = "Nature"
    case religion = "Religion"
    case animalHandling = "Animal Handling"
    case insight = "Insight"
    case medicine = "Medicine"
    case perception = "Perception"
    case survival = "Survival"
    case deception = "Deception"
    case intimidation = "Intimidation"
    case performance = "Performance"
    case persuasion = "Persuasion"
    
    var relatedAbility : DnDAbilityType {
        get {
            switch(self) {
            case .athletics:
                return .strength
            case .acrobatics, .sleightOfHand, .stealth:
                return .dexterity
            case .arcana, .history, .investigation, .nature, .religion:
                return .intelligence
            case .animalHandling, .insight, .medicine, .perception, .survival:
                return .wisdom
            case .deception, .intimidation, .performance, .persuasion:
                return .charisma
            }
        }
    }
}
