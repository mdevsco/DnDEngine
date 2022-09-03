//
//  DnDDie.swift
//  
//
//  Created by Rodney Aiglstorfer on 9/3/22.
//

import Foundation

public enum DnDDie: Int {
    /// The unloved D4, also known as the caltrop. If you have stepped on a
    /// D4 with bare feet, you will never forget it. Because of its large flat sides
    /// it does not roll as well as the other shapes. In Dungeons & Dragons,
    /// the D4 is used where you want low variation, and an average roll of 2.5.
    /// Damage rolls for small weapons is a common use, as well as use
    /// for healing spells.
    case d4 = 4
    /// The standard cube shape die found in most boardgames is also used
    /// in D&D. Many gamers gather a set of D6 for quickly rolling multiples,
    /// like the original 3D6 rolls for attributes during character creation. This
    /// practice later turned into rolling 4D6, discounting the lowest roll, and
    /// assigning each number where the player wants.
    case d6 = 6
    /// The eight sided die, each face is triangular and it resembles two
    /// pyramids attached base-to-base. Often used for damage done
    /// by larger weapons.
    case d8 = 8
    /// The ten sided die is used often while playing D&D. There are actually
    /// two ten sided dice in a standard 7-dice D&D set. The faces of one are
    /// numbered 0 to 9, and the faces of the other go from 00 to 90 by tens.
    /// To make a 'percentile' roll, you roll both die and add them together,
    /// with one exception: a double zero roll is 100.
    case d10 = 10
    /// The twelve sided die is often used for damage for large weapons
    /// carried by a raging barbarian. Each face is shaped like a pentagon.
    /// These dice also stack very well for those long dice-stacking intervals
    /// between combat turns.
    case d12 = 12
    /// The signature die of Dungeons & Dragons, and taller than its siblings,
    /// the D20 rolls further because it is the most spherical. The faces are
    /// equilateral triangles.​ The D20 is used any time you want to know if an
    /// attempt is successful: attacks, saving throws, skill checks, and ability
    /// checks. Each value has a 5% chance.
    /// After you roll a D20 to see if you hit an enemy, you will roll other dice
    /// to see how much damage you deal. Small weapons use a D4, larger
    /// weapons deal D6 or D8 damage, and the biggest deal D10 or D12.
    /// D20, The "decider" of D&D dice.
    case d20 = 20
    /// The main use that a d100 has is to determine percentages, whether for
    /// save rolls or for spells-to-hit.
    case d100 = 100
}

public class DnDRollable {
    public let count: Int
    public let die: DnDDie
    public var results: [Int]
    
    public enum RollContraint {
        case highest(Int)
        case lowest(Int)
    }
    
    public func highest(_ limit:Int) -> [Int] {
        let sorted = results.sorted()
        return Array(sorted.suffix(limit))
    }
    
    public func lowest(_ limit:Int) -> [Int] {
        let sorted = results.sorted()
        return Array(sorted.prefix(limit))
    }
    
    public func roll() -> DnDRollable {
        results = []
        for _ in 0..<count {
            results.append(Int.random(in: 0...die.rawValue))
        }
        
        return self
    }
    
    /// Parses a dice "expression"  (e,.g. 2d6) into a ``DnDRollable`` object
    public convenience init(_ expression: String) throws {
        let matches = try expression.extractMatches(#"(\d)+d(\d+)"#)
        if (matches.isEmpty || matches.count != 2) {
            throw DnDError.unableToParse("Unable to parse dice expression '\(expression)'")
        }
        guard let newCount = Int(matches[0]) else {
            throw DnDError.unableToParse("Number of dice not recognized in dice expression '\(expression)'")
        }
        let rawDie = Int(matches[1])
        guard let newDie = DnDDie.init(rawValue: rawDie!) else {
            throw DnDError.unableToParse("Dice of type d\(String(describing: rawDie)) is not recognized")
        }
        self.init(count: newCount, die: newDie)
    }
    
    public init(count: Int, die: DnDDie) {
        self.count = count
        self.die = die
        self.results = []
    }
}

public func roll(_ expr:String) throws -> DnDRollable {
    return try! DnDRollable(expr).roll()
}


