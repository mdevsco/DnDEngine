//  Configuration File for Trait "Trance"
//
//  Created by Rodney Aiglstorfer on 8/25/22.
//

let name = "Trance"

let description = ```
Elves do not need to sleep. Instead, they meditate deeply, remaining
semiconscious, for 4 hours a day. (The Common word for such meditation
is "trance.") While meditating, you can dream after a fashion; such
dreams are actually mental exercises that have become reflexive
through years of practice. After resting this way, you gain the same
benefit that a human does from 8 hours of sleep.
```

let races = ["Elf", "High Elf"]

function applyTrait(player) {
    // reduce the duration of the longRest cycle down to 4hrs
    player.restInterval.longRest = 4
}

function removeTrait(player) {
    // revert the longRest to a normal 8hr cycle
    player.restInterval.longRest = 8
}
