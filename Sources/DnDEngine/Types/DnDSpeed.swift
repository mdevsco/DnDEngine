//
//  DnDSpeed.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation

/// Every character and monster has a speed, which is the distance in feet that
/// the character or monster can walk in 1 round. This number assumes short
/// bursts of energetic movement in the midst of a life-threatening situation.
public class DnDSpeeds {
    public var basic: DnDSpeed?
    public var fly: DnDSpeed?
    public var swim: DnDSpeed?
    public var burrow: DnDSpeed?
    public var climb: DnDSpeed?
    public var prone: DnDSpeed?
}

public struct DnDSpeed {
    public let amount: Int
    public let units: DnDDistanceType
    
    /// If you create a `DnDSpeed(30)` it will default to "basic 30 ft"
    init(_ amount: Int, units: DnDDistanceType = .feet) {
        self.amount = amount
        self.units = units
    }
}

