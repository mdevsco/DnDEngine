//
//  DnDEquipment.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/25/22.
//

import Foundation

struct DnDEquipment {
    var armor: DnDArmor?
    var mainHand: DnDWeapon?
    var offHand: DnDItem?
    var head: DnDItem?
    var shoulders: DnDItem?
    var chest: DnDItem?
    var wrists: DnDItem?
    var hands: DnDItem?
    var waist: DnDItem?
    var legs: DnDItem?
    var feet: DnDItem?
    
    var neck: DnDItem?
    var back: DnDItem?
    var fingers: Set<DnDItem> = []
    
    var isShieldOn: Bool {
        get {
            (offHand != nil) ? offHand is DnDArmor : false;
        }
    }
    
    var isArmorOn: Bool {
        get {
            armor != nil;
        }
    }
    
    var weight: Double {
        get {
            // TODO: Implement equipment weight
            0
        }
    }
}
