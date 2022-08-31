//
//  DnDTrait.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/25/22.
//

import Foundation

public struct DnDTrait {
    public var name: String
    public var races = Set<String>()
    public var description: String?
    // TODO Need way to translate the description into actionable logic.
}
