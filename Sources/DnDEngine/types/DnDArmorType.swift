//
//  DnDArmorType.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation

/// DnDArmorType is a collection of the common categories: light armor,
/// medium armor, and heavy armor. Many warriors supplement their armor
/// with a shield.
enum DnDArmorType: String {
    /// Made from supple and thin materials, light armor favors agile adventurers
    /// since it offers some protection without sacrificing mobility. If you wear
    /// light armor, you add your Dexterity modifier to the base number from your
    /// armor type to determine your Armor Class.
    case light = "Light"
    
    /// Medium armor offers more protection than light armor, but it also impairs
    /// movement more. If you wear medium armor, you add your Dexterity modifier,
    /// to a maximum of +2, to the base number from your armor type to determine
    /// your Armor Class.
    case medium = "Medium"
    
    /// Of all the armor categories, heavy armor offers the best protection.
    /// These suits of armor cover the entire body and are designed to stop a
    /// wide range of attacks. Only proficient warriors can manage their weight
    /// and bulk.
    ///
    /// Heavy armor doesn’t let you add your Dexterity modifier to your Armor
    /// Class, but it also doesn’t penalize you if your Dexterity modifier is
    /// negative.
    case heavy = "Heavy"
    
    /// Many warriors supplement their armor with a shield.
    case shield = "Shield"
}
