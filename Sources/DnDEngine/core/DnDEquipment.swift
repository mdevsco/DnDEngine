//
//  DnDEquipment.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/25/22.
//

import Foundation

public struct DnDEquipment {
    public var armor: DnDArmor?
    public var mainHand: DnDWeapon?
    public var offHand: DnDItem?
    public var head: DnDItem?
    public var shoulders: DnDItem?
    public var chest: DnDItem?
    public var wrists: DnDItem?
    public var hands: DnDItem?
    public var waist: DnDItem?
    public var legs: DnDItem?
    public var feet: DnDItem?
    
    public var neck: DnDItem?
    public var back: DnDItem?
    public var fingers: Set<DnDItem> = []
    
    public var isShieldOn: Bool {
        get {
            (offHand != nil) ? offHand is DnDArmor : false;
        }
    }
    
    public var isArmorOn: Bool {
        get {
            armor != nil;
        }
    }
    
    public var weight: Double {
        get {
            // TODO: Implement equipment weight
            0
        }
    }
}
