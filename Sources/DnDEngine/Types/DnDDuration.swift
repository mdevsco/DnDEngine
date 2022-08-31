//
//  DnDDuration.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation

/// A spell’s duration is the length of time the spell persists. A duration can
/// be expressed in rounds, minutes, hours, or even years. Some spells specify
/// that their effects last until the spells are dispelled or destroyed.
public struct DnDDuration {
    enum Units {
        case rounds
        case minutes
        case hours
        case years
        
        /// Many spells are instantaneous. The spell harms, heals, creates, or alters
        /// a creature or an object in a way that can’t be dispelled, because its
        /// magic exists only for an instant.
        case instantaneous
        
        /// Some spells require you to maintain concentration in order to keep their
        /// magic active. If you lose concentration, such a spell ends.
        ///
        /// If a spell must be maintained with concentration, that fact appears in
        /// its Duration entry, and the spell specifies how long you can concentrate
        /// on it. You can end concentration at any time (no action required).
        case concentration
    }
    
    var value: Int
    var units: Units
    
    init(_ value: Int, units: Units) {
        self.value = value
        self.units = units
    }
    
}
