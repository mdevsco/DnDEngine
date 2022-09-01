//
//  DnDItem.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation

/// General purpose class for any item carried by a [DnDPlayer].
/// This is also subclassed for specialized items like [DnDWeapon]
public class DnDItem : Hashable {
    
    /// Name of the item
    public var name: String
    
    /// The weight of the item
    public var weight: Double = 0
    
    /// The cost of the item expressed as a coin expression (e.g. 1gp)
    public var cost: DnDCoins = DnDCoins(cp: 0, sp: 0, ep: 0, gp: 0, pp: 0)
    
    /// Description of the [DnDItem] and how it is to be used.
    public var description: String = ""
    
    public init(name: String, weight: Double, cost: String) {
        self.name = name
        self.weight = weight
        self.cost = try! DnDCoins.tryParse(cost)
    }
    
    // MARK: - Hashable functions
    public func hash(into hasher: inout Hasher) {
        hasher.combine("\(name)\(weight)\(cost)")
    }
    
    public static func == (lhs: DnDItem, rhs: DnDItem) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    public static func < (lhs: DnDItem, rhs: DnDItem) -> Bool {
        return lhs.name < rhs.name
    }
    
}
