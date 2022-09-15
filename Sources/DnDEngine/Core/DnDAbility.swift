//
//  DnDAbility.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/25/22.
//

import Foundation

public class DnDAbilities {
    public var strength = DnDAbility(DnDAbilityType.strength)
    public var dexterity = DnDAbility(DnDAbilityType.dexterity)
    public var constitution = DnDAbility(DnDAbilityType.constitution)
    public var intelligence = DnDAbility(DnDAbilityType.intelligence)
    public var wisdom = DnDAbility(DnDAbilityType.wisdom)
    public var charisma = DnDAbility(DnDAbilityType.charisma)
}

public struct DnDAbility: CustomStringConvertible {
    
    /// Each of a creature’s abilities has a score, a number that defines the
    /// magnitude of that ability. An ability score is not just a measure of innate
    /// capabilities, but also encompasses a creature’s training and competence
    /// in activities related to that ability.
    public var score: Int = 0
    /// The racial bonus  + other bonuses from feats, spells or weapons
    public var bonuses: [DnDBonus] = []
    public var type: DnDAbilityType
    
    /// Each ability also has a modifier, derived from the score and ranging from
    /// −5 (for an ability score of 1) to +10 (for a score of 30).
    ///
    /// To determine an ability modifier subtract 10 from the ability score and
    /// then divide the total by 2 (round down).
    public var modifier: Int {
        get {
            let totalBonus = bonuses.reduce(0) { (result, bonus) in
                switch(bonus) {
                case .feat(let scoreBonus, _):
                    return result + scoreBonus
                case .racial(let scoreBonus, _):
                    return result + scoreBonus
                case .equipment(let scoreBonus, _):
                    return result + scoreBonus
                case .spell(let scoreBonus, _):
                    return result + scoreBonus
                case .item(let scoreBonus, _):
                    return result + scoreBonus
                }
            }
            return ((score + totalBonus - 10) / 2)
        }
    }
    
    /// Custom print string for this ability as it might appear on a character sheet
    public var description: String {
        "\(type.rawValue) - \(score) (\(modifier))"
    }
    
    public init(_ type:DnDAbilityType) {
        self.type = type
    }
}


