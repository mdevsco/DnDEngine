//
//  DnDSkill.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/25/22.
//

import Foundation


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
