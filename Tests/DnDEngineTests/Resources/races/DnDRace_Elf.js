//  Configuration File for DnDRace "Elf"
//
//  Created by Rodney Aiglstorfer on 8/25/22.
//

let name = "Elf"
let speed = 30
let size = "Medium"
let alignmentOptions = ["Chaotic Neutral", "Chaotic Evil"]

let descriptions = {
    age:```
Although elves reach physical maturity at about the same age as humans,
the elven understanding of adulthood goes beyond physical growth to
encompass worldly experience. An elf typically claims adulthood and an
adult name around the age of 100 and can live to be 750 years old.
```,
    alignment:```
Elves love freedom, variety, and self-expression, so they lean strongly
toward the gentler aspects of chaos. They value and protect others'
freedom as well as their own, and they are more often good than not. The
drow are an exception; their exile has made them vicious and dangerous.
Drow are more often evil than not.
```,
    size:```
Elves range from under 5 to over 6 feet tall and have slender builds. Your
size is Medium.
```,
    language:```
You can speak, read, and write Common and Elvish. Elvish is fluid, with
subtle intonations and intricate grammar. Elven literature is rich and
varied, and their songs and poems are famous among other races. Many bards
learn their language so they can add Elvish ballads to their repertoires.
```
}

let languages = ["Common", "Elvish"]

let optionalLanguages = []

let abilityBonuses = {
    dexterity: 2
}

let traits = ["Darkvision", "Fey Ancestry", "Trance"]

let subRaces = ["High Elf"]
