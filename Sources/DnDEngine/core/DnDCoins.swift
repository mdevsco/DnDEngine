//
//  DnDCoins.swift
//
//  Created by Rodney Aiglstorfer on 8/20/22.
//

import Foundation

/// Common coins come in several different denominations based on the relative
/// worth of the metal from which they are made. The three most common coins
/// are the gold piece (gp), the silver piece (sp), and the copper piece (cp).
/// With one gold piece, a character can buy a bedroll, 50 feet of good rope,
/// or a goat. A skilled (but not exceptional) artisan can earn one gold piece
/// a day. The gold piece is the standard unit of measure for wealth, even if
/// the coin itself is not commonly used. When merchants discuss deals that
/// involve goods or services worth hundreds or thousands of gold pieces, the
/// transactions don’t usually involve the exchange of individual coins.
/// Rather, the gold piece is a standard measure of value, and the actual
/// exchange is in gold bars, letters of credit, or valuable goods.
///
/// One gold piece is worth ten silver pieces, the most prevalent coin among
/// commoners. A silver piece buys a laborer’s work for half a day, a flask of
/// lamp oil, or a night’s rest in a poor inn.
///
/// One silver piece is worth ten copper pieces, which are common among
/// laborers and beggars. A single copper piece buys a candle, a torch, or a
/// piece of chalk.
///
/// In addition, unusual coins made of other precious metals sometimes appear
/// in treasure hoards. The electrum piece (ep) and the platinum piece (pp)
/// originate from fallen empires and lost kingdoms, and they sometimes arouse
/// suspicion and skepticism when used in transactions. An electrum piece is
/// worth five silver pieces, and a platinum piece is worth ten gold pieces.
///
public struct DnDCoins: CustomStringConvertible {
    /// Copper (cp)
    public var copper: Int = 0
    
    /// Silver (sp) is equivalent to 10 copper pieces
    public var silver: Int = 0
    
    /// Electrum (ep) is equivalent to 5 sivler pieces or 0.5 gold
    public var electrum: Int = 0
    
    /// Gold (gp) is equivalent to 10 sivler pieces
    public var gold: Int = 0
    
    /// Platinum (pp) is equivalent to 10 gold pieces
    public var platinum: Int = 0
    
    /// A standard coin weighs about a third of an ounce, so fifty coins weigh a pound.
    /// Returns the computed weight of all the coins
    public var weight: Double {
        let total = Double(copper + silver + electrum + gold + platinum);
        return (total > 0) ? total / 3 : 0;
    }
    
    /// The effective total value of the pouch expressed in coppers (lowest common denominator)
    private var value: Int {
        copper + (silver*10) + (electrum*5*10) + (gold*10*10) + (platinum*10*10*10)
    }
    
    public var description: String {
        var coins = "";
        if (copper > 0) {
            coins = "\(copper)cp "
        }
        if (silver > 0) {
            coins += "\(silver)sp "
        }
        if (electrum > 0) {
            coins += "\(electrum)ep "
        }
        if (gold > 0) {
            coins += "\(gold)gp "
        }
        if (platinum > 0) {
            coins += "\(platinum)pp "
        }
        
        return coins.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
    }
    
    // MARK: - Initializers
    public init(cp: Int = 0, sp: Int = 0, ep: Int = 0, gp: Int = 0, pp: Int = 0) {
        copper = cp
        silver = sp
        gold = gp
        platinum = pp
        electrum = ep
    }
    
    public static func tryParse(_ coinExpr:String) throws -> DnDCoins {
        var coins = DnDCoins()
        let slices = coinExpr.split(separator: " ")
        for slice in slices {
            let coinString = slice.description
            do {
                let matches = try coinString.extractMatches(#"(\d+)(..)"#)
                let numCoins = Int(matches[0])
                if(matches[1] == "cp") {
                    coins.copper = numCoins!
                } else if(matches[1] == "sp") {
                    coins.silver = numCoins!
                } else if(matches[1] == "ep") {
                    coins.electrum = numCoins!
                } else if(matches[1] == "gp") {
                    coins.gold = numCoins!
                } else if(matches[1] == "pp") {
                    coins.platinum = numCoins!
                }
                
            } catch {
                throw CoinError.unableToParse("Unable to parse [\(coinString)]")
            }
        }
        
        return coins
    }
    
    // MARK: - Utility Functions
    
    ///  Combines coins into their higher value equivalent so that the pouch contains the fewest
    ///  coin pieces possible and thereby reducing the total weight of the pouch.
    public mutating func optimizeForWeight() {
        // convert coppers to silvers
        if (copper >= 10) {
            silver += copper / 10
            copper = copper % 10
        }
        
        // convert electrum to gold
        if (electrum >= 2) {
            gold += electrum / 2
            electrum = electrum % 2
        }
        
        // convert silver into gold
        if (silver >= 10) {
            gold += silver / 10
            silver = silver % 10
        }
        
        // convert gold into platinum
        if (gold >= 10) {
            platinum += gold / 10
            gold = gold % 10
        }
    }
    
    // MARK: - Operator Overrides
    
    public static func + (left: DnDCoins, right:DnDCoins) -> DnDCoins {
        return DnDCoins(
            cp: left.copper + right.copper,
            sp: left.silver + right.silver,
            ep: left.electrum + right.electrum,
            gp: left.gold + right.gold,
            pp: left.platinum + right.platinum)
    }
    
    public static func += (left: inout DnDCoins, right: DnDCoins) {
        left.copper = left.copper + right.copper
        left.silver = left.silver + right.silver
        left.electrum = left.electrum + right.electrum
        left.gold = left.gold + right.gold
        left.platinum = left.platinum + right.platinum
    }
    
    public static func < (left: DnDCoins, right:DnDCoins) -> Bool {
        left.value < right.value
    }
    
    public static func <= (left: DnDCoins, right:DnDCoins) -> Bool {
        left.value <= right.value
    }
    
    public static func > (left: DnDCoins, right:DnDCoins) -> Bool {
        left.value > right.value
    }
    
    public static func >= (left: DnDCoins, right:DnDCoins) -> Bool {
        left.value >= right.value
    }
    
    // TODO: Handle insufficent funds exception
    // TODO: Handle making change when precise coinage not availble
    public static func - (left: DnDCoins, right:DnDCoins) throws -> DnDCoins  {
        if (left < right) {
            throw CoinError.insufficentFunds("Unabled to subtract (\(right)) from (\(left))")
        }
        return DnDCoins(
            cp: left.copper - right.copper,
            sp: left.silver - right.silver,
            ep: left.electrum - right.electrum,
            gp: left.gold - right.gold,
            pp: left.platinum - right.platinum)
    }
    
    // TODO: Handle insufficent funds exception
    // TODO: Handle making change when precise coinage not availble
    public static func -= (left: inout DnDCoins, right: DnDCoins) throws {
        if (left >= right) {
            left.copper = left.copper - right.copper
            left.silver = left.silver - right.silver
            left.electrum = left.electrum - right.electrum
            left.gold = left.gold - right.gold
            left.platinum = left.platinum - right.platinum
        } else {
            throw CoinError.insufficentFunds("Unabled to subtract (\(right)) from (\(left))")
        }
    }
}

public enum CointUnit: String {
    case copper = "cp"
    case silver = "sp"
    case electrum = "ep"
    case gold = "gp"
    case platinum = "pp"
}

// TODO: Move into DnDError
public enum CoinError : Error {
    case insufficentFunds(String)
    case noExactChange(String)
    case unableToParse(String)
}
