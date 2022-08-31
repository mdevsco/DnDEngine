//
//  DnDLevel.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/31/22.
//

import Foundation

public func convertXPToLevel(_ xp: Int) -> Int {
    switch(xp) {
    case (0 ..< 300):
        return 1
    case (300 ..< 900):
        return 2
    case (900 ..< 2700):
        return 3
    case (2700 ..< 6500):
        return 4
    case (6500 ..< 14000):
        return 5
    case (14000 ..< 23000):
        return 6
    case (23000 ..< 34000):
        return 7
    case (34000 ..< 48000):
        return 8
    case (48000 ..< 64000):
        return 9
    case (64000 ..< 85000):
        return 10
    case (85000 ..< 100000):
        return 11
    case (100000 ..< 120000):
        return 12
    case (120000 ..< 140000):
        return 13
    case (140000 ..< 165000):
        return 14
    case (165000 ..< 195000):
        return 15
    case (195000 ..< 225000):
        return 16
    case (225000 ..< 265000):
        return 17
    case (265000 ..< 305000):
        return 18
    case (305000 ..< 355000):
        return 19
    default:
        return 20
    }
}

public func convertLevelToXP(_ level: Int) -> Int {
    switch (level) {
    case 1:
        return 0
    case 2:
        return 300
    case 3:
        return 900
    case 4:
        return 2700
    case 5:
        return 6500
    case 6:
        return 14000
    case 7:
        return 23000
    case 8:
        return 34000
    case 9:
        return 48000
    case 10:
        return 64000
    case 11:
        return 85000
    case 12:
        return 100000
    case 13:
        return 120000
    case 14:
        return 140000
    case 15:
        return 165000
    case 16:
        return 195000
    case 17:
        return 225000
    case 18:
        return 265000
    case 19:
        return 305000
    default:
        return 355000
        
    }
}

public func convertChallengeRatingToXP(_ cRating:Double) -> Int {
    switch(cRating) {
        
    case 0.125: return 25
    case 0.25: return 50
    case 0.5: return 100
    case 1: return 200
    case 2: return 450
    case 3: return 700
    case 4: return 1100
    case 5: return 1800
    case 6: return 2300
    case 7: return 2900
    case 8: return 3900
    case 9: return 5000
    case 10: return 5900
    case 11: return 7200
    case 12: return 8400
    case 13: return 10000
    case 14: return 11500
    case 15: return 13000
    case 16: return 15000
    case 17: return 18000
    case 18: return 20000
    case 19: return 22000
    case 20: return 25000
    case 21: return 33000
    case 22: return 41000
    case 23: return 50000
    case 24: return 62000
    case 25: return 75000
    case 26: return 90000
    case 27: return 105000
    case 28: return 120000
    case 29: return 135000
    case 30: return 155000
    default: return 10
    }
}
