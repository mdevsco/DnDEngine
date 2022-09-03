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
public struct DnDSpeed {
    
    
    
    public let amount: Int
    public let movement: DnDMovementType
    public let units: DnDDistanceType
    
    /// If you create a `DnDSpeed(30)` it will default to "basic 30 ft"
    init(_ amount: Int, movement: DnDMovementType = .basic, units: DnDDistanceType = .feet) {
        self.amount = amount
        self.movement = movement
        self.units = units
    }
}

extension DnDSpeed: Hashable {
    public static func == (lhs: DnDSpeed, rhs: DnDSpeed) -> Bool {
        lhs.movement == rhs.movement
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(movement)
    }
}

