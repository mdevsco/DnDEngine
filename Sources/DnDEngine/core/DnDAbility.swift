//
//  DnDAbility.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/25/22.
//

import Foundation

struct DnDAbility {
    /// Each of a creature’s abilities has a score, a number that defines the
    /// magnitude of that ability. An ability score is not just a measure of innate
    /// capabilities, but also encompasses a creature’s training and competence
    /// in activities related to that ability.
    var score: Int = 0
    var bonus: Int = 0
    var type: DnDAbilityType
    
    /// Each ability also has a modifier, derived from the score and ranging from
    /// −5 (for an ability score of 1) to +10 (for a score of 30).
    ///
    /// To determine an ability modifier subtract 10 from the ability score and
    /// then divide the total by 2 (round down).
    var modifier: Int {
        get {
            ((score - 10) / 2) + bonus;
        }
    }
    
    init(_ type:DnDAbilityType) {
        self.type = type
    }
}
