//
//  DnDArmor.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation

/// Fantasy gaming worlds are a vast tapestry made up of many different
/// cultures, each with its own technology level. For this reason, adventurers
/// have access to a variety of armor types, ranging from leather armor to
/// chain mail to costly plate armor, with several other kinds of armor in
/// between.
///
/// *NOTE*: Heavier armor interferes with the wearer’s ability to move quickly,
/// stealthily, and freely. If the Armor table shows “Str 13” or “Str 15” in
/// the Strength column for an armor type, the armor reduces the wearer’s speed
/// by 10 feet unless the wearer has a Strength score equal to or higher than
/// the listed score.
public class DnDArmor : DnDItem {
    
    /// The [DnDArmorType] of this article of [DnDArmor]
    public var type: DnDArmorType
    
    /// Armor protects its wearer from attacks. The [rating] defines the
    /// amount this article of Armor adds to a characters overall Armor Class.
    public var rating: Int
    
    /// If false the dexterity modifier is not used to determine the ArmorClass.
    /// By default this is always `true`.
    public var addDexModifier = true
    
    /// The maxium dexterity modifier value that can be used.  By default this
    /// value is set to 10, the highest value a dexterity modifier can get.
    public var maxDexModifier = 10
    
    /// Heavier armor interferes with the wearer’s ability to move quickly,
    /// stealthily, and freely. The [minStrength] for an armor type defines the
    /// mimum Stregth required before the armor reduces the wearer’s speed by 10
    /// feet.
    public var minStrength = 0;
    
    /// If the Armor [hasDisadvantage] the wearer has disadvantage on Dexterity
    /// (Stealth) checks.
    public var stealth = DnDCircumstance.neutral
    
    /// This is the time it takes to put on armor. You benefit from the armor’s
    /// AC only if you take the full time to don the suit of armor.
    /// TODO: should this be added to constructor?
    public var donTime: DnDDuration {
        get {
            type.donTime
        }
    }
    
    /// This is the time it takes to take off armor. If you have help, reduce
    /// this time by half.
    /// TODO: should this be added to constructor?
    public var doffTime: DnDDuration {
        get {
            type.doffTime
        }
    }
    
    public init(name: String, type: DnDArmorType, rating: Int, weight: Double, cost: String) {
        self.type = type
        self.rating = rating
        super.init(name: name, weight: weight, cost: cost)
    }
}
