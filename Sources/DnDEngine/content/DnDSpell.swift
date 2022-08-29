//
//  DnDSpell.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/24/22.
//

import Foundation

struct DnDSpell {
    var id: String
    var name: String
    var description: [String]?
    var higherLevelDescription: [String]?
    // TODO: Convert to use DnDRange instead of String
    var range: String?
    var components: [DnDSpellComponent]?
    var material: String?
    var isRitual: Bool?
    var duration: String?
    var ritual: Bool = false
    var requiresConcentration: Bool? = nil
    var castingTime: String?
    var level: Int?
    var school: DnDMagicSchool
}

// MARK: - Extension for JSON Decodable
extension DnDSpell: Decodable {
    struct JSONMagicSchool: Decodable {
        let name: String
    }
    
    private enum CodingKeys: String, CodingKey {
        case id = "index"
        case name
        case description = "desc"
        case higherLevelDescription = "higher_level"
        case range
        case components
        case material
        case isRitual = "ritual"
        case duration
        case requiresConcentration = "concentration"
        case castingTime = "casting_time"
        case level
        case school
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        description = try values.decodeIfPresent([String].self, forKey: .description)
        higherLevelDescription = try values.decodeIfPresent([String].self, forKey: .higherLevelDescription)
        range = try values.decodeIfPresent(String.self, forKey: .range)
        components = try values.decodeIfPresent([DnDSpellComponent].self, forKey: .components)
        material = try values.decodeIfPresent(String.self, forKey: .material)
        isRitual = try values.decodeIfPresent(Bool.self, forKey: .isRitual)
        duration = try values.decodeIfPresent(String.self, forKey: .duration)
        requiresConcentration = try values.decodeIfPresent(Bool.self, forKey: .requiresConcentration)!
        castingTime = try values.decodeIfPresent(String.self, forKey: .castingTime)
        level = try values.decodeIfPresent(Int.self, forKey: .level)
        
        // manually decode **school** into the custom type
        let jsonSchool = try values.decodeIfPresent(JSONMagicSchool.self, forKey: .school)
        
        // check if you can create an enum from the given string and throw appropriate error
        guard let schoolEnum = DnDMagicSchool(rawValue: jsonSchool!.name) else{
            throw DecodingError.dataCorrupted(.init(codingPath: [CodingKeys.school], debugDescription: "school has unknown value"))
        }
        // assign enum
        self.school = schoolEnum
    }
    
    static func loadFromFile(_ filename: String) throws -> [DnDSpell] {
        guard let sourceURL = Bundle.module.url(forResource: filename, withExtension: "json") else {
            fatalError("Could not find \(filename).json")
        }
        
        guard let data = try? Data(contentsOf: sourceURL) else {
            fatalError("Could not convert to data")
        }
        
        return try loadFromData(data)
    }
    
    static func loadFromData(_ data:Data) throws -> [DnDSpell] {
        return try JSONDecoder().decode([DnDSpell].self, from: data)
    }
}
