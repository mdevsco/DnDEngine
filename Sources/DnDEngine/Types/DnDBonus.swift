//
//  DnDBonus.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/27/22.
//

import Foundation

public enum DnDBonus {
    case feat(Int, String)
    case racial(Int, String)
    case equipment(Int, String)
    case spell(Int, String)
    case item(Int, String)
}
