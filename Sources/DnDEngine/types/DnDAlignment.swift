//
//  DnDAlignment.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation

/// A typical creature in the game world has an alignment,
/// which broadly describes its moral and personal attitudes.
/// Alignment is a combination of two factors: one identifies
/// morality (good, evil, or neutral), and the other
/// describes attitudes toward society and order (lawful,
/// chaotic, or neutral). Thus, nine distinct alignments define
/// the possible combinations.
///
/// These brief summaries of the nine alignments describe the
/// typical behavior of a creature with that alignment.
/// Individuals might vary significantly from that typical
/// behavior, and few people are perfectly and consistently
/// faithful to the precepts of their alignment.
enum DnDAlignment: String {
    case lawfulGood = "Lawful Good"
    case neutralGood = "Neutral Good"
    case chaoticGood = "Chaotic Good"
    case lawfulNeutral = "Lawful Neutral"
    case neutral = "Neutral"
    case chaoticNeutral = "Chaotic Neutral"
    case lawfulEvil = "Lawful Evil"
    case neutralEvil = "Neutral Evil"
    case chaoticEvil = "Chaotic Evil"
    
    static func parse(alignment:String?) throws -> DnDAlignment {
        switch (alignment?.lowercased()) {
        case "lawful good", "lawful good (lg)", "lg":
            return lawfulGood
        case "neutral good", "neutral good (ng)", "ng":
            return neutralGood
        case "chaotic good", "chaotic good (cg)", "cg":
            return chaoticGood
            
        case "lawful neutral", "lawful neutral (ln)", "ln":
            return lawfulNeutral
            
        case "chaotic neutral", "chaotic neutral (cn)", "cn":
            return chaoticNeutral
            
        case "lawful evil", "lawful evil (le)", "le":
            return lawfulEvil
        case "neutral evil", "neutral evil (ne)", "ne":
            return neutralEvil
        case "chaotic evil", "chaotic evil (ce)", "ce":
            return chaoticEvil
        case "neutral", "neutral (n)", "n":
            return neutral
        default:
            let msg = "\"\(alignment as Optional)\" is not a valignmentalignment."
            throw DnDAlignmentError.unableToParse(msg)
        }
    }
}

enum DnDAlignmentError : Error {
    case unableToParse(String)
}
