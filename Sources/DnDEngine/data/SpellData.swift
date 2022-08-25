//
//  SpellData.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/24/22.
//

import Foundation

let SpellData = """
[
  {
    "id": "1",
    "name": "Acid Arrow",
    "desc": [
      "A shimmering green arrow streaks toward a target within range and bursts in a spray of acid. Make a ranged spell attack against the target. On a hit, the target takes 4d4 acid damage immediately and 2d4 acid damage at the end of its next turn. On a miss, the arrow splashes the target with acid for half as much of the initial damage and no damage at the end of its next turn."
    ],
    "higher_level": [
      "When you cast this spell using a spell slot of 3rd level or higher, the damage (both initial and later) increases by 1d4 for each slot level above 2nd."
    ],
    "page": "phb 259",
    "range": "90 feet",
    "components": ["V", "S", "M"],
    "material": "Powdered rhubarb leaf and an adder's stomach.",
    "ritual": false,
    "duration": "Instantaneous",
    "concentration": false,
    "casting_time": "1 action",
    "level": 2,
    "school": {
      "name": "Evocation",
      "url": "http://www.dnd5eapi.co/api/magic-schools/5"
    },
    "classes": [
      {
        "name": "Wizard",
        "url": "http://www.dnd5eapi.co/api/classes/12"
      }
    ],
    "subclasses": [
      {
        "name": "Lore",
        "url": "http://www.dnd5eapi.co/api/subclasses/2"
      },
      {
        "name": "Land",
        "url": "http://www.dnd5eapi.co/api/subclasses/4"
      }
    ],
    "url": "http://www.dnd5eapi.co/api/spells/1"
  },
  {
    "id": "2",
    "name": "Acid Splash",
    "desc": [
      "You hurl a bubble of acid. Choose one creature within range, or choose two creatures within range that are within 5 feet of each other. A target must succeed on a dexterity saving throw or take 1d6 acid damage.",
      "This spell's damage increases by 1d6 when you reach 5th level (2d6), 11th level (3d6), and 17th level (4d6)."
    ],
    "page": "phb 211",
    "range": "60 feet",
    "components": ["V", "S"],
    "ritual": false,
    "duration": "Instantaneous",
    "concentration": false,
    "casting_time": "1 action",
    "level": 0,
    "school": {
      "name": "Conjuration",
      "url": "http://www.dnd5eapi.co/api/magic-schools/2"
    },
    "classes": [
      {
        "name": "Sorcerer",
        "url": "http://www.dnd5eapi.co/api/classes/10"
      },
      {
        "name": "Wizard",
        "url": "http://www.dnd5eapi.co/api/classes/12"
      }
    ],
    "subclasses": [
      {
        "name": "Lore",
        "url": "http://www.dnd5eapi.co/api/subclasses/2"
      }
    ],
    "url": "http://www.dnd5eapi.co/api/spells/2"
  },

]
"""
