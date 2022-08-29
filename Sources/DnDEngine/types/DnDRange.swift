//
//  DnDRange.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/29/22.
//

import Foundation

/// Based on data from http://private-5e.wikidot.com/general:spells-by-range
enum DnDRange {
    case touch
    case oneSelf
    case unlimited
    case distance(Int, String)
    case radius(Int, String)
}
