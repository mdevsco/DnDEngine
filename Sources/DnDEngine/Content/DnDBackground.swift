//
//  DnDBackground.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/23/22.
//

import Foundation

public struct DnDBackground {
    public var name: String
    public var skillProficiencies: Set<DnDSkillType> = []
    public var languages: Set<DnDLanguage> = []
    public var equipment: [DnDItem] = [];
    public var coins = DnDCoins();
    // TODO: Add support for Feature
}
