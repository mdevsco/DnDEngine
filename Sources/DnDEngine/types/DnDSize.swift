//
//  DnDSize.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation

/// Each creature takes up a different amount of space.
/// Objects sometimes use the same size categories.


enum DnDSize: String {
    case tiny = "Tiny"
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
    case huge = "Huge"
    case gargantuan = "Gargantuan"
    
    /// The effective size in feet that the creature takes up
    var sizeInFeet: Double {
        get {
            switch(self) {
            case .tiny:
                return 2.5
            case .small, .medium:
                return 5
            case .large:
                return 10
            case .huge:
                return 15
            //case: .gargantuan
            default:
                return 20
            }
        }
    }
    
    /// The effective size in "squares" that the creature takes up
    var sizeInSquares: Double {
        get {
            return self.sizeInFeet / 5
        }
    }
}
