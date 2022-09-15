//
//  DnDLogger.swift
//  
//
//  Created by Rodney Aiglstorfer on 9/4/22.
//

import DiceKit
import Foundation

public class DnDLogger {
    private var events: [DnDLogEvent] = []
    
    public func logEvent(source: DnDLogSource, _ message: String...) {
        events.append(DnDLogEvent(from: source, message: message.joined(separator: " ")))
    }
}

public struct DnDLogEvent: Describable {
    let source: DnDLogSource
    let time = Date()
    let message: String
    
    init(from: DnDLogSource, message: String) {
        self.message = String(message)
        self.source = from
    }
    
    public var description: String {
        return "[\(time)] \(source.name) : \(message)"
    }
            
    public var debugDescription: String {
        return "DEBUG: \(self.description)"
    }
    
}

public protocol DnDLogSource {
    var name: String { get }
}
