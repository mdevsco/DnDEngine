//  Configuration File for Trait "Fey Ancestry"
//
//  Created by Rodney Aiglstorfer on 8/25/22.
//

let name = "Fey Ancestry"

let description = ```
You have advantage on saving throws against being charmed, and
magic cannot put you to sleep.
```

let races = ["Dwarf", "Hill Dwarf", "Elf", "High Elf", "Gnome",
"Rock Gnome", "Half-Elf", "Half-Orc", "Dwarf", "Hill Dwarf",
"Elf", "High Elf", "Gnome", "Rock Gnome", "Half-Elf", "Half-Orc"]

function applyTrait(player) {
    player.resistances.add("Unconscious", "Charmed")
}

function removeTrait(player) {
    player.resistances.remove("Unconscious", "Charmed")
}
