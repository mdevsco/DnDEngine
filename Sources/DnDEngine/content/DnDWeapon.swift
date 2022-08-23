//
//  DnDWeapon.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation

class DnDWeapon : DnDItem {
    var effectiveRange = 5
    var maximumRange = 5
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

enum DnDWeaponCategory: String {
    case simpleMelee = "Simple Melee"
    case simpleRanged = "Simple Ranged"
    case martialMelee = "Martial Melee"
    case martialRanged = "Martial Ranged"
}

enum DnDWeaponProperty: String {
    /// You can use a weapon that has the ammunition property to make a ranged
    /// attack only if you have ammunition to fire from the weapon. Each time you
    /// attack with the weapon, you expend one piece of ammunition. Drawing the
    /// ammunition from a quiver, case, or other container is part of the attack
    /// (you need a free hand to load a one-handed weapon). At the end of the
    /// battle, you can recover half your expended ammunition by taking a minute
    /// to search the battlefield.
    ///
    /// If you use a weapon that has the ammunition property to make a melee
    /// attack, you treat the weapon as an improvised weapon (see “Improvised
    /// Weapons” later in the section). A sling must be loaded to deal any damage
    /// when used in this way.
    case ammunition = "Ammunition"
    
    /// When making an attack with a finesse weapon, you use your choice of your
    /// Strength or Dexterity modifier for the attack and damage rolls. You must
    /// use the same modifier for both rolls.
    case finesse = "Finesse"
    
    /// Small creatures have disadvantage on attack rolls with heavy weapons. A
    /// heavy weapon’s size and bulk make it too large for a Small creature to
    /// use effectively.
    case heavy = "Heavy"
    
    /// A light weapon is small and easy to handle, making it ideal for use when
    /// fighting with two weapons.
    case light = "Light"
    
    /// Because of the time required to load this weapon, you can fire only one
    /// piece of ammunition from it when you use an action, bonus action, or
    /// reaction to fire it, regardless of the number of attacks you can normally
    /// make.
    case loading = "Loading"
    
    /// A weapon that can be used to make a ranged attack has a range in
    /// parentheses after the ammunition or thrown property. The range lists two
    /// numbers. The first is the weapon’s normal range in feet, and the second
    /// indicates the weapon’s long range. When attacking a target beyond normal
    /// range, you have disadvantage on the attack roll. You can’t attack a
    /// target beyond the weapon’s long range.
    case range = "Range"
    
    /// This weapon adds 5 feet to your reach when you attack with it, as well as
    /// when determining your reach for opportunity attacks with it.
    case reach = "Reach"
    
    /// A weapon with the special property has unusual rules governing its use,
    /// explained in the weapon’s description (see “Special Weapons” later in
    /// this section).
    case special = "Special"
    
    /// If a weapon has the thrown property, you can throw the weapon to make a
    /// ranged attack. If the weapon is a melee weapon, you use the same ability
    /// modifier for that attack roll and damage roll that you would use for a
    /// melee attack with the weapon. For example, if you throw a handaxe, you
    /// use your Strength, but if you throw a dagger, you can use either your
    /// Strength or your Dexterity, since the dagger has the finesse property.
    case thrown = "Thrown"
    
    /// This weapon requires two hands when you attack with it.
    case twoHanded = "Two-Handed"
    
    /// This weapon can be used with one or two hands. A damage value in
    /// parentheses appears with the property—the damage when the weapon is used
    /// with two hands to make a melee attack.
    case versatile = "Versatile"
}


