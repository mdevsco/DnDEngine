//  Configuration File for Trait "Keen Senses"
//
//  Created by Rodney Aiglstorfer on 8/25/22.
//

let name = "Keen Senses"

let description = ```
You have proficiency in the Perception skill.
```

let races = ["Elf", "High Elf"]

function applyTrait(player) {
    player.skill.perception.proficient = true
}

function removeTrait(player) {
    player.skill.perception.proficient = false
}
