//
//  File.swift
//  
//
//  Created by Rodney Aiglstorfer on 9/3/22.
//

import Foundation

public func loadFromFile<T:Decodable>(_ filename: String) throws -> T {
    // TODO: Bundle.main vs Bundle.module (which stopped working)?
    guard let sourceURL = Bundle.main.url(forResource: filename, withExtension: "json") else {
        fatalError("Could not find \(filename).json")
    }
    
    guard let data = try? Data(contentsOf: sourceURL) else {
        fatalError("Could not convert to data")
    }
    
    return try JSONDecoder().decode(T.self, from: data)
}

public func loadFromData<T:Decodable>(_ data:Data, type: T) throws -> T {
    return try JSONDecoder().decode(T.self, from: data)
}
