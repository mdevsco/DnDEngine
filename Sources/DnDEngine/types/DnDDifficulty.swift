//
//  DnDDifficulty.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation

/// To make an ability check, roll a d20 and add the
/// relevant ability modifier. As with other d20 rolls,
/// apply bonuses and penalties, and compare the total
/// to the DC. If the total equals or exceeds the DC,
/// the ability check is a success--the creature
/// overcomes the challenge at hand. Otherwise, it's a
/// failure, which means the character or monster makes
/// no progress toward the objective or makes progress
/// combined with a setback determined by the DM.
enum DnDDifficulty: Int {
    case veryEasy = 5
    case easy  = 10
    case medium = 15
    case hard = 20
    case veryHard = 25
    case nearlyimpossible = 30
}
