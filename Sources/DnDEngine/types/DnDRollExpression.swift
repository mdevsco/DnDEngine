//
//  DnDRollExpression.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation

struct DnDRollExpression {
    var number: Int
    var dice: DnDDice
    
    enum ExpressioinError: Error {
        case unableToParse(String)
        case invalidExpressions(String)
    }
    
    static func tryParse(_ rollExpr: String) throws -> DnDRollExpression {
        var parts: [String]
        
        do {
            parts = try rollExpr.extractMatches(#"(\d+)(d4|d6|d8|d100|d12|d20|d10)"#)
        } catch {
            throw ExpressioinError.unableToParse("Unable to parse rollExpr \"\(rollExpr)\"")
        }
        
        if parts.isEmpty || parts.count != 2 {
            throw ExpressioinError.invalidExpressions("Missing value in rollExpr \"\(parts)\"")
        }
        
        let dice = DnDDice.init(rawValue: parts[1])!
        let number = Int(parts[0])!
        
        return DnDRollExpression(number: number, dice: dice)
    }
}
