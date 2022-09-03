//
//  DnDRollabe.swift
//  
//
//  Created by Rodney Aiglstorfer on 9/3/22.
//

import Foundation

/// Convenience function that simplifies the roll of a DnD die expression into a ``DnDRollable``
/// for quicker chaining.
///
/// ## Example:
/// ```swift
/// // This will roll 4 x six sided dice and
/// // return the highest 3 outcomes
/// let highest3 = roll("4d6").highest(3)
///
/// // This will roll 2 x 20 sided dice and
/// // return the single lowest outcome
/// let highest3 = roll("2d20").lowest()
///
/// ```
///
/// - Parameter expr: Any valid DnD dice expression (ex. 4d6, 2d20)
/// - Throws: If expression cannot be parsed or is invalid
/// - Returns: A ``DnDRollable`` that has been rolled and is read for use.
public func roll(_ expr:String) throws -> DnDRollable {
    return try! DnDRollable(expr).roll()
}

/// A ``DnDRollable`` is the mechanism by which one or more ``DnDDie``
/// are rolled in game.
public class DnDRollable {
    public let count: Int
    public let die: DnDDie
    public var results: [Int]
    
    
    /// Returns the highest subset of a roll involving 2 or more ``DnDDie`` (e.x. 4d6)
    /// - Parameter limit: The limit of the subset (must be less than the total dice rolled
    /// - Returns: Array of the subset of highest roll outcomes (e.g. highest 3 of a 4d6).
    public func highest(_ limit:Int = 1) -> [Int] {
        let sorted = results.sorted()
        return Array(sorted.suffix(limit))
    }
    
    /// Returns the lowest subset of a roll involving 2 or more ``DnDDie`` (e.x. 4d6)
    /// - Parameter limit: The limit of the subset (must be less than the total dice rolled
    /// - Returns: Array of the subset of lowest roll outcomes (e.g. highest 3 of a 4d6).
    public func lowest(_ limit:Int = 1) -> [Int] {
        let sorted = results.sorted()
        return Array(sorted.prefix(limit))
    }
    
    /// Executes a roll of a set of one or more ``DnDDie`` (ex. 4d6)
    /// - Returns: A ``DnDRollable`` of roll outcomes for each of the die rolled
    public func roll() -> DnDRollable {
        results = []
        for _ in 0..<count {
            results.append(Int.random(in: 0...die.rawValue))
        }
        
        return self
    }
    
    /// Parses a dice "expression"  (e,.g. 2d6) into a ``DnDRollable`` object
    /// - Parameter expression: Any valid DnD die expressed (ex. 4d6 or 2d20)
    convenience init(_ expression: String) throws {
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
    
    /// Generates a ``DnDRollable`` that has not results yet.  A call to ``roll()`` must
    /// first be made to see ``DnDRollable.results``
    /// - Parameters:
    ///   - count: Number of ``DnDDie`` to be able to roll
    ///   - die: Type of ``DnDDie`` to be able to roll
    init(count: Int?, die: DnDDie) {
        self.count = count ?? 1
        self.die = die
        self.results = []
    }
}





