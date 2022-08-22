//
//  DnDBackground.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/23/22.
//

import Foundation

struct DnDBackground {
    var name: String
    var skillProficiencies: Set<DnDSkillType> = []
    var languages: Set<DnDLanguage> = []
    var equipment: [DnDItem] = [];
    var coins = DnDCoins();
    // TODO: Add support for Feature
}
