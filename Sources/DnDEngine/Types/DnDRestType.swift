//
//  DnDRestType.swift
//  
//
//  Created by Rodney Aiglstorfer on 9/4/22.
//

import Foundation

/// Heroic though they might be, Adventurers can’t spend every hour of the day in
/// the thick of Exploration, Social Interaction, and Combat. They need rest—time
/// to sleep and eat, tend their wounds, refresh their minds and spirits for
/// Spellcasting, and brace themselves for further adventure.
///
/// Adventurers can take ``.shortRest`` in the midst of an Adventuring day and
/// a ``.longRest`` to end the day.
public enum DnDRestType {
    /// A Short Rest is a period of Downtime, at least 1 hour long, during which a
    /// character does nothing more strenuous than eating, drinking, reading, and
    /// tending to wounds.
    ///
    /// A character can spend one or more Hit Dice at the end of a Short Rest, up
    /// to the character’s maximum number of Hit Dice, which is equal to the
    /// character’s level. For each Hit Die spent in this way, the player rolls the die
    /// and adds the character’s Constitution modifier to it. The character regains
    /// Hit Points equal to the total. The player can decide to spend an additional
    /// Hit Die after each roll. A character regains some spent Hit Dice upon finishing
    /// a Long Rest, as explained below.
    case shortRest
    
    /// A Long Rest is a period of extended Downtime, at least 8 hours long, during
    /// which a character sleeps or performs light activity: reading, talking, eating,
    /// or standing watch for no more than 2 hours. If the rest is interrupted by a
    /// period of strenuous activity—at least 1 hour of walking, Fighting, casting
    /// Spells, or similar Adventuring activity—the Characters must begin the rest
    /// again to gain any benefit from it.
    ///
    /// At the end of a Long Rest, a character regains all lost Hit Points. The
    /// character also regains spent Hit Dice, up to a number of dice equal to half
    /// of the character’s total number of them (minimum of one die). For example,
    /// if a character has eight Hit Dice, he or she can regain four spent Hit Dice
    /// upon finishing a Long Rest.
    ///
    /// A character can’t benefit from more than one Long Rest in a 24-hour period,
    /// and a character must have at least 1 hit point at the start of the rest to gain
    /// its benefits.
    case longRest
}
