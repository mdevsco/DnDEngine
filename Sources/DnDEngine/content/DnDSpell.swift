//
//  DnDSpell.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/24/22.
//

import Foundation

struct DnDSpell: Decodable {
    var name: String
    var desc: [String]
    var higher_level: [String]?
    var page: String?
    var range: String?
    var components: [String]?
    var material: String?
    var ritual: Bool?
    var duration: String?
    var concentration: Bool?
    var casting_time: String?
    var level: Int?
    
    static func loadFromFile() -> [DnDSpell] {

        guard let sourceURL = Bundle.main.url(forResource: "spells", withExtension: "json") else {
            fatalError("Could not find spells.json")
        }
        
        guard let spellData = try? Data(contentsOf: sourceURL) else {
            fatalError("Could not convert to data")
        }
        
        let decoder = JSONDecoder()
        guard let spells = try? decoder.decode([DnDSpell].self, from: spellData) else {
            fatalError("There was a problem decoding the data")
        }
        
        return spells
    }
}


