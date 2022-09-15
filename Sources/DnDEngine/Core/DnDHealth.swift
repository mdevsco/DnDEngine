//
//  DnDHealth.swift
//  TODO: Add support for +/- operators on DnDHealth that will account for use of tempHitpoints
//
//  Created by Rodney Aiglstorfer on 9/4/22.
//

import Foundation
import DiceKit

public class DnDHealth {
    /// One or more hit dice expressions for the player.  **NOTE** Most players will
    /// only have a single hit die expression (e.g. `"4d6"`) except when multi-class like
    /// **Paladin/Cleric** which may have multiple hit die expressions at higher levels.
    public var hitDice: Die? // TODO: Consider how to support multi-class
    
    /// The total hit points for this creature
    public var maxHitPoints: Int?
    
    /// You gain the hit points from your new class as described for levels after 1st.
    /// You gain the 1st-level hit points for a class only when you are a 1st-level
    /// character.
    ///
    /// You add together the Hit Dice granted by all your classes to form your pool
    /// of Hit Dice. If the Hit Dice are the same die type, you can simply pool them
    /// together. For example, both the fighter and the paladin have a d10, so if you
    /// are a paladin 5/fighter 5, you have ten d10 Hit Dice. If your classes give you
    /// Hit Dice of different types, keep track of them separately. If you are a paladin
    /// 5/cleric 5, for example, you have five d10 Hit Dice and five d8 Hit Dice.
    public var hitPoints: Int?
    
    
    /// Some spells and special abilities confer temporary hit points to a creature.
    /// Temporary hit points aren't actual hit points; they are a buffer against damage,
    /// a pool of hit points that protect you from injury.
    ///
    /// When you have temporary hit points and take damage, the temporary hit points
    /// are lost first, and any leftover damage carries over to your normal hit points. For
    /// example, if you have 5 temporary hit points and take 7 damage, you lose the
    /// temporary hit points and then take 2 damage.
    ///
    /// Because temporary hit points are separate from your actual hit points, they can
    /// exceed your hit point maximum. A character can, therefore, be at full hit points
    /// and receive temporary hit points.
    ///
    /// Healing can't restore temporary hit points, and they can't be added together. If
    /// you have temporary hit points and receive more of them, you decide whether to
    /// keep the ones you have or to gain the new ones. For example, if a spell grants
    /// you 12 temporary hit points when you already have 10, you can have 12 or 10,
    /// not 22.
    ///
    /// If you have 0 hit points, receiving temporary hit points doesn't restore you to
    /// consciousness or stabilize you. They can still absorb damage directed at you
    /// while you're in that state, but only true healing can save you.
    ///
    /// Unless a feature that grants you temporary hit points has a duration, they last
    /// until they're depleted or you finish a long rest.
    public var tempHitPoints: Int = 0
}
