//
//  DnDCondition.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation

public enum DnDCondition: String {
    
    /// A blinded creature can’t see and automatically fails
    /// any *ability check* that requires sight.
    /// *Attack rolls* against the creature have advantage,
    /// and the creature’s attack rolls have disadvantage.
    case blinded = "Blinded"
    
    /// A charmed creature can't attack the charmer or target
    /// the charmer with harmful abilities or magical effects.
    /// The charmer has *advantage* on any *ability check* to
    /// interact socially with the creature.
    case charmed = "Charmed"
    
    /// A deafened creature can’t hear and automatically fails
    /// any *ability check* that requires hearing.
    case deafened = "Deafened"
    
    /// A frightened creature has *disadvantage* on *ability checks*
    /// and *attack rolls* while the source of its fear is within
    /// line of sight.
    /// The creature can’t willingly move closer to the source
    /// of its fear.
    case frightened = "Frightened"
    
    /// A grappled creature’s *speed* becomes 0, and it can't benefit
    /// from any bonus to its speed.
    /// The condition ends if the grappler is *Incapacitated*.
    /// The condition also ends if an effect removes the grappled
    /// creature from the reach of the grappler or grappling effect,
    /// such as when a creature is hurled away by the thunderwave spell.
    case grappled = "Grappled"
    
    /// An incapacitated creature can’t take actions or reactions.
    case incapacitated = "Incapacitated"
    
    /// An invisible creature is impossible to see without the aid
    /// of magic or a special sense. For the purpose of hiding, the
    /// creature is *heavily obscured*. The creature’s location can be
    /// detected by any noise it makes or any tracks it leaves.
    /// *Attack rolls* against the creature have *disadvantage*, and the
    /// creature’s *attack rolls* have *advantage*
    case invisible = "Invisible"
    
    /// A paralyzed creature is *Incapacitated* and can’t move or speak.
    /// The creature automatically fails *Strength* and *Dexterity*
    /// *saving throws*.
    /// *Attack rolls* against the creature have advantage.
    /// Any *attack* that hits the creature is a *critical hit* if the
    /// attacker is within *5 feet* of the creature.
    case paralyzed = "Paralyzed"
    
    /// A petrified creature is transformed, along with any nonmagical
    /// object it is wearing or carrying, into a solid inanimate
    /// substance (usually stone). Its *weight increases* by a factor
    /// of ten, and it ceases aging.
    /// The creature is *Incapacitated*.
    /// *Attack rolls* against the creature have *advantage*.
    /// The creature automatically fails *Strength* and *Dexterity*
    /// saving throws.
    /// The creature has *resistance* to *all damage*.
    /// The creature is *immune* to *poison* and *disease*, although a poison
    /// or disease already in its system is suspended, not neutralized.
    case petrified = "Petrified"
    
    /// A poisoned creature has *disadvantage* on *attack rolls* and *ability checks*.
    case poisoned = "Poisoned"
    
    /// A prone creature’s only *movement* option is to *crawl*, unless it
    /// stands up and thereby ends the condition.
    /// The creature has *disadvantage* on *attack rolls*.
    /// An *attack roll* against the creature has *advantage* if the
    /// attacker is within 5 feet of the creature. Otherwise, the
    /// *attack roll* has *disadvantage*.
    case prone = "Prone"
    
    /// A restrained creature’s *speed* becomes 0, and it can’t benefit
    /// from any bonus to its speed.
    /// *Attack rolls* against the creature have *advantage*, and the
    /// creature’s *attack rolls* have *disadvantage*.
    /// The creature has disadvantage on Dexterity saving throws.
    case restrained = "Restrained"
    
    /// A stunned creature is *Incapacitated*.
    /// The creature automatically fails *Strength* and *Dexterity* *saving throws*.
    /// Attack rolls against the creature have advantage.
    case stunned = "Stunned"
    
    /// An unconscious creature is *Incapacitated*, can’t move or
    /// speak, and is unaware of its surroundings
    /// The creature drops whatever it’s holding and falls *Prone*.
    /// The creature automatically fails *Strength* and *Dexterity* *saving throws*.
    /// *Attack rolls* against the creature have *advantage*.
    /// Any attack that hits the creature is a *critical hit* if the
    /// attacker is within 5 feet of the creature.
    case unconscious = "Unconscious"
}
