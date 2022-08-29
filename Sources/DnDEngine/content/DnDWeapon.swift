//
//  DnDWeapon.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation

class DnDWeapon : DnDItem {
    var effectiveRange = DnDRange.distance(5, "feet")
    var maximumRange = DnDRange.distance(5, "feet")
    var type = DnDWeaponCategory.simpleMelee
    var properties: Set<DnDWeaponProperty> = []
    var damage: DnDDamageType
    
    /// Sometimes characters don’t have their weapons and have to attack with
    /// whatever is at hand. An improvised weapon includes any object you can
    /// wield in one or two hands, such as broken glass, a table leg, a frying
    /// pan, a wagon wheel, or a dead goblin.
    ///
    /// Often, an improvised weapon is similar to an actual weapon and can be
    /// treated as such. For example, a table leg is akin to a club. At the GM’s
    /// option, a character proficient with a weapon can use a similar object as
    /// if it were that weapon and use his or her proficiency bonus.
    ///
    /// An object that bears no resemblance to a weapon deals 1d4 damage (the GM
    /// assigns a damage type appropriate to the object). If a character uses a
    /// ranged weapon to make a melee attack, or throws a melee weapon that does
    /// not have the thrown property, it also deals 1d4 damage. An improvised
    /// thrown weapon has a normal range of 20 feet and a long range of 60 feet.
    var isImprovised = false
    
    /// Some monsters that have immunity or resistance to nonmagical weapons are
    /// susceptible to silver weapons, so cautious adventurers invest extra coin
    /// to plate their weapons with silver. You can silver a single weapon or
    /// ten pieces of ammunition for 100 gp. This cost represents not only the
    /// price of the silver, but the time and expertise needed to add silver to
    /// the weapon without making it less effective.
    var isSilvered = false
    
    init(name: String, weight: Double, cost: String, type: DnDWeaponCategory, damage: DnDDamageType) {
        self.type = type
        self.damage = damage
        super.init(name: name, weight: weight, cost: cost)
    }
   
}



