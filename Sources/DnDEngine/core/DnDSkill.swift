//
//  DnDSkill.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/25/22.
//

import Foundation


struct DnDSkill {
    var bonus: Int = 0
    var proficient: Bool = false
    var abilityModifier: () -> Int
    var type: DnDSkillType
    
    var modifier: Int {
        // TODO When to use bonus w.r.t. modifier
        // TOOD What about being "double proficient" (see Roge Feats for example)
        abilityModifier()
    }
    
    init(_ type: DnDSkillType, abilityModifier: @escaping () -> Int) {
        self.type = type
        self.abilityModifier = abilityModifier
    }
}
