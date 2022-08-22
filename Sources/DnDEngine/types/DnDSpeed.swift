//
//  DnDSpeed.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation

/// Every character and monster has a speed, which is the distance in feet that
/// the character or monster can walk in 1 round. This number assumes short
/// bursts of energetic movement in the midst of a life-threatening situation.
///
/// *DnDPace* determine how far a character or monster can move in a minute, an hour, or a day.
struct DnDSpeed {
    var basic: DnDPace = DnDPace.normal
    var fly: DnDPace = DnDPace.none
    var swim: DnDPace = DnDPace.none
    var burrow: DnDPace = DnDPace.none
    var climb: DnDPace = DnDPace.none
    var prone: DnDPace = DnDPace.none
    
    
    enum DnDPace: String {
        case fast = "Fast"
        case normal = "Normal"
        case slow = "Slow"
        case none = "N/A"
        
        var feetPerMinute: Int {
            get {
                switch(self){
                case .fast:
                    return 400
                case .normal:
                    return 300
                case .slow:
                    return 200
                default:
                    return 0
                }
            }
        }
        
        var milesPerHour: Int {
            get {
                switch(self){
                case .fast:
                    return 4
                case .normal:
                    return 3
                case .slow:
                    return 2
                default:
                    return 0
                }
            }
        }
        
        var feetPerDay: Int {
            get {
                switch(self){
                case .fast:
                    return 30
                case .normal:
                    return 24
                case .slow:
                    return 18
                default:
                    return 0
                }
            }
        }
    }
}

